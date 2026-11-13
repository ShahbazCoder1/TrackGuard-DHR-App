import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trackguard_dhr/core/connectivity/connectivity_provider.dart';
import 'package:trackguard_dhr/features/report_detail/presentation/gangman_report_detail_screen.dart';
import 'package:trackguard_dhr/features/reports/data/temporary_report_repository.dart';
import 'package:trackguard_dhr/features/reports/domain/report_repository_provider.dart';
import 'package:trackguard_dhr/l10n/app_localizations.dart';
import 'package:trackguard_dhr/shared/models/hazard_report.dart';
import 'package:trackguard_dhr/shared/models/hazard_type.dart';
import 'package:trackguard_dhr/shared/models/severity.dart';
import 'package:trackguard_dhr/shared/models/sync_status.dart';

void main() {
  for (final online in [false, true]) {
    testWidgets(
      'Inspection detail hides technical sync errors when online is $online',
      (tester) async {
        final repo = TemporaryReportRepository();
        await repo.saveReport(
          HazardReport(
            id: 'report',
            createdBy: 'owner',
            createdAt: DateTime(2026),
            updatedAt: DateTime(2026),
            sectionId: 'kurseong-ghum',
            confirmedHazardType: HazardType.other,
            confirmedSeverity: Severity.medium,
            userNote: '',
            syncStatus: SyncStatus.failed,
            lastSyncError:
                'SocketException: Failed host lookup: secret.example',
          ),
        );
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              reportRepositoryProvider.overrideWithValue(repo),
              reportSyncServiceProvider.overrideWithValue(null),
              isOnlineProvider.overrideWith((ref) => Stream.value(online)),
            ],
            child: const MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: GangmanReportDetailScreen(reportId: 'report'),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(find.textContaining('SocketException'), findsNothing);
        expect(find.textContaining('secret.example'), findsNothing);
        if (online) {
          expect(
            find.text('Queued locally for automatic sync at next station.'),
            findsOneWidget,
          );
          expect(find.text('Failed'), findsNothing);
        } else {
          expect(
            find.text('Offline — reports remain safely stored on this device.'),
            findsOneWidget,
          );
          expect(find.text('Failed'), findsNothing);
        }
      },
    );
  }
}
