import 'package:flutter/foundation.dart';

import '../../../shared/models/hazard_report.dart';
import '../../../shared/models/inspection_status.dart';
import '../../../shared/models/sync_status.dart';
import 'report_repository.dart';
import 'supabase_media_data_source.dart';
import 'supabase_report_data_source.dart';

class ReportSyncService {
  ReportSyncService({
    required this.repository,
    required this.remote,
    required this.media,
    required this.isOnline,
    required this.currentUserId,
  });

  final ReportRepository repository;
  final SupabaseReportDataSource remote;
  final SupabaseMediaDataSource media;
  final Future<bool> Function() isOnline;
  final String? Function() currentUserId;

  bool _isSyncing = false;

  Future<void> syncPendingReports() async {
    if (_isSyncing) return;

    _isSyncing = true;
    try {
      if (!await isOnline() || currentUserId() == null) return;
      final reports = await repository.getLocalReports();

      for (final report in reports) {
        if (currentUserId() != report.createdBy || !await isOnline()) continue;
        if (report.syncStatus != SyncStatus.pending &&
            report.syncStatus != SyncStatus.failed &&
            report.syncStatus != SyncStatus.syncing) {
          continue;
        }

        await repository.saveReport(
          report.copyWith(syncStatus: SyncStatus.syncing),
        );

        try {
          await remote.upsertReport(report);
          await media.uploadReportMedia(report);

          await repository.saveReport(
            report.copyWith(
              syncStatus: SyncStatus.synced,
              syncTimestamp: DateTime.now().toUtc(),
              retryCount: 0,
              lastSyncError: null,
            ),
          );
          debugPrint(
            '[ReportSyncService] Successfully synced report ${report.id} to Supabase',
          );
        } catch (error) {
          debugPrint(
            '[ReportSyncService] Error syncing report ${report.id}: $error',
          );
          final isConnectionError = _isConnectionError(error);
          await repository.saveReport(
            report.copyWith(
              syncStatus: isConnectionError
                  ? SyncStatus.pending
                  : SyncStatus.failed,
              retryCount: report.retryCount + 1,
              lastSyncError: error.toString(),
            ),
          );
        }
      }
    } finally {
      _isSyncing = false;
    }
  }

  static bool _isConnectionError(Object error) {
    final message = error.toString().toLowerCase();
    return message.contains('socketexception') ||
        message.contains('failed host lookup') ||
        message.contains('no route to host') ||
        message.contains('network is unreachable');
  }

  Future<List<HazardReport>> fetchRemoteReports({
    int page = 0,
    int pageSize = 50,
  }) async {
    final reports = await remote.fetchReports(page: page, pageSize: pageSize);

    for (final report in reports) {
      final local = await repository.getReportById(report.id);

      // Never overwrite a report that still has local changes.
      if (local != null && local.syncStatus != SyncStatus.synced) {
        continue;
      }

      // Avoid replacing a newer local version with an older remote version.
      if (local != null && local.syncVersion > report.syncVersion) {
        continue;
      }

      await repository.saveReport(report);
    }

    return reports;
  }

  Future<HazardReport?> refreshInspectionStatus(String reportId) async {
    final remoteState = await remote.fetchInspectionState(reportId);
    if (remoteState == null) return repository.getReportById(reportId);

    final local = await repository.getReportById(reportId);
    if (local == null) return null;

    final updatedAt = DateTime.tryParse(
      remoteState['updated_at'] as String? ?? '',
    );

    final refreshed = local.copyWith(
      inspectionStatus: InspectionStatus.fromString(
        remoteState['inspection_status'] as String?,
      ),
      updatedAt: updatedAt ?? local.updatedAt,
    );

    await repository.saveReport(refreshed);
    return refreshed;
  }
}
