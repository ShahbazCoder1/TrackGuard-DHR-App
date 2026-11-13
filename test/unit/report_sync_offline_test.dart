import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show SupabaseClient;
import 'package:trackguard_dhr/core/connectivity/connectivity_provider.dart';
import 'package:trackguard_dhr/features/auth/domain/auth_state.dart';
import 'package:trackguard_dhr/features/auth/presentation/auth_controller.dart';
import 'package:trackguard_dhr/features/reports/data/report_sync_service.dart';
import 'package:trackguard_dhr/features/reports/data/supabase_media_data_source.dart';
import 'package:trackguard_dhr/features/reports/data/supabase_report_data_source.dart';
import 'package:trackguard_dhr/features/reports/data/temporary_report_repository.dart';
import 'package:trackguard_dhr/features/reports/domain/report_repository_provider.dart';
import 'package:trackguard_dhr/shared/models/app_user.dart';
import 'package:trackguard_dhr/shared/models/hazard_report.dart';
import 'package:trackguard_dhr/shared/models/hazard_type.dart';
import 'package:trackguard_dhr/shared/models/severity.dart';
import 'package:trackguard_dhr/shared/models/sync_status.dart';
import 'package:trackguard_dhr/shared/models/user_role.dart';

final _client = SupabaseClient('https://example.supabase.co', 'test-key');

class _Remote extends SupabaseReportDataSource {
  _Remote() : super(_client);
  int calls = 0;
  Object? error;
  @override
  Future<void> upsertReport(HazardReport report) async {
    calls++;
    if (error != null) throw error!;
  }
}

class _Media extends SupabaseMediaDataSource {
  _Media() : super(_client);
  int calls = 0;
  Object? error;
  @override
  Future<void> uploadReportMedia(HazardReport report) async {
    calls++;
    if (error != null) throw error!;
  }
}

class _Auth extends AuthController {
  @override
  AuthState build() => AuthState.authorizedGangman(
    AppUser(
      id: 'owner',
      email: 'owner@example.com',
      role: UserRole.gangman,
      createdAt: DateTime(2026),
      updatedAt: DateTime(2026),
    ),
  );
}

HazardReport _report(
  String id, {
  String owner = 'owner',
  SyncStatus status = SyncStatus.pending,
}) => HazardReport(
  id: id,
  createdBy: owner,
  createdAt: DateTime(2026),
  updatedAt: DateTime(2026),
  sectionId: 'kurseong-ghum',
  confirmedHazardType: HazardType.other,
  confirmedSeverity: Severity.medium,
  userNote: '',
  syncStatus: status,
);

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test(
    'offline reports stay pending and sync after connection returns',
    () async {
      final repo = TemporaryReportRepository();
      final remote = _Remote();
      final media = _Media();
      var online = false;
      await repo.saveReport(_report('report'));
      final service = ReportSyncService(
        repository: repo,
        remote: remote,
        media: media,
        isOnline: () async => online,
        currentUserId: () => 'owner',
      );
      await service.syncPendingReports();
      expect(remote.calls, 0);
      expect(
        (await repo.getReportById('report'))!.syncStatus,
        SyncStatus.pending,
      );
      online = true;
      await service.syncPendingReports();
      expect(remote.calls, 1);
      expect(media.calls, 1);
      expect(
        (await repo.getReportById('report'))!.syncStatus,
        SyncStatus.synced,
      );
    },
  );
  test(
    'connection loss leaves report pending and retries use the same id',
    () async {
      final repo = TemporaryReportRepository();
      final remote = _Remote()
        ..error = const SocketException('failed host lookup');
      final media = _Media();
      await repo.saveReport(_report('stable-id'));
      final service = ReportSyncService(
        repository: repo,
        remote: remote,
        media: media,
        isOnline: () async => true,
        currentUserId: () => 'owner',
      );
      await service.syncPendingReports();
      final pending = (await repo.getReportById('stable-id'))!;
      expect(pending.syncStatus, SyncStatus.pending);
      expect(pending.retryCount, 1);
      remote.error = null;
      await service.syncPendingReports();
      expect((await repo.getLocalReports()).single.id, 'stable-id');
      expect(
        (await repo.getReportById('stable-id'))!.syncStatus,
        SyncStatus.synced,
      );
    },
  );
  test(
    'failed media is retained for retry and other users reports are skipped',
    () async {
      final repo = TemporaryReportRepository();
      final remote = _Remote();
      final media = _Media()..error = Exception('media upload failed');
      await repo.saveReport(_report('own'));
      await repo.saveReport(_report('other', owner: 'another-user'));
      final service = ReportSyncService(
        repository: repo,
        remote: remote,
        media: media,
        isOnline: () async => true,
        currentUserId: () => 'owner',
      );
      await service.syncPendingReports();
      expect((await repo.getReportById('own'))!.syncStatus, SyncStatus.failed);
      expect(
        (await repo.getReportById('other'))!.syncStatus,
        SyncStatus.pending,
      );
      media.error = null;
      await service.syncPendingReports();
      expect((await repo.getReportById('own'))!.syncStatus, SyncStatus.synced);
      expect(remote.calls, 2);
    },
  );
  test('connectivity restoration triggers queued sync', () async {
    final repo = TemporaryReportRepository();
    final remote = _Remote();
    final media = _Media();
    var online = false;
    await repo.saveReport(_report('report'));
    final service = ReportSyncService(
      repository: repo,
      remote: remote,
      media: media,
      isOnline: () async => online,
      currentUserId: () => 'owner',
    );
    final connection = StreamController<bool>.broadcast();
    final container = ProviderContainer(
      overrides: [
        reportSyncServiceProvider.overrideWithValue(service),
        authControllerProvider.overrideWith(_Auth.new),
        isOnlineProvider.overrideWith((ref) => connection.stream),
      ],
    );
    addTearDown(() async {
      container.dispose();
      await connection.close();
    });
    final subscription = container.listen(
      automaticReportSyncProvider,
      (_, _) {},
    );
    addTearDown(subscription.close);
    connection.add(false);
    await Future<void>.delayed(const Duration(milliseconds: 20));
    expect(remote.calls, 0);
    online = true;
    connection.add(true);
    await Future<void>.delayed(const Duration(milliseconds: 50));
    expect(remote.calls, 1);
    expect((await repo.getReportById('report'))!.syncStatus, SyncStatus.synced);
  });
}
