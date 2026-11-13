import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trackguard_dhr/features/ai/data/litert_gemma_provider.dart';
import 'package:trackguard_dhr/features/ai/domain/ai_analysis_service.dart';
import 'package:trackguard_dhr/features/ai/domain/ai_service_provider.dart';
import 'package:trackguard_dhr/features/ai/domain/ai_settings.dart';
import 'package:trackguard_dhr/features/report_capture/presentation/report_capture_controller.dart';
import 'package:trackguard_dhr/features/report_review/presentation/report_review_controller.dart';
import 'package:trackguard_dhr/features/reports/data/temporary_report_repository.dart';
import 'package:trackguard_dhr/features/reports/domain/report_repository_provider.dart';
import 'package:trackguard_dhr/shared/models/ai_analysis_result.dart';
import 'package:trackguard_dhr/shared/models/ai_provider.dart';
import 'package:trackguard_dhr/shared/models/app_language.dart';
import 'package:trackguard_dhr/shared/models/geo_location.dart';
import 'package:trackguard_dhr/shared/models/hazard_type.dart';
import 'package:trackguard_dhr/shared/models/location_source.dart';
import 'package:trackguard_dhr/shared/models/report_draft.dart';
import 'package:trackguard_dhr/shared/models/severity.dart';

class _Capture extends ReportCaptureController {
  @override
  ReportCaptureState build() => ReportCaptureState(
    isCameraInitializing: false,
    capturedFile: File('old-photo.jpg'),
  );

  @override
  Future<void> resetCapture() async {
    state = state.copyWith(clearCapturedFile: true);
  }
}

class _PendingAi implements AiAnalysisService {
  final result = Completer<AiAnalysisResult>();

  @override
  Future<AiAnalysisResult> analyze({
    required File image,
    required GeoLocation location,
    required AppLanguage language,
    AiMode? requestedMode,
  }) => result.future;
  @override
  Future<void> initializeOfflineModel() async {}
  @override
  Future<bool> isOfflineModelAvailable() async => true;
  @override
  Future<bool> isOnlineProviderAvailable() async => false;
  @override
  LitertGemmaState get offlineModelState => LitertGemmaState.ready;
  @override
  Stream<LitertGemmaState> watchOfflineModelState() => const Stream.empty();
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Discard clears the saved draft and retained capture, and ignores a late AI result', () async {
    final repo = TemporaryReportRepository();
    await repo.saveDraft(
      ReportDraft(
        sessionId: 'session',
        photoPath: 'old-photo.jpg',
        createdAt: DateTime.now(),
        location: GeoLocation(
          source: LocationSource.manual,
          sectionId: 'kurseong-ghum',
          capturedAt: DateTime.now(),
        ),
      ),
    );
    final ai = _PendingAi();
    final container = ProviderContainer(
      overrides: [
        reportRepositoryProvider.overrideWithValue(repo),
        reportCaptureControllerProvider.overrideWith(_Capture.new),
        aiAnalysisServiceProvider.overrideWithValue(ai),
      ],
    );
    addTearDown(container.dispose);
    final controller = container.read(reportReviewControllerProvider.notifier);
    final pending = controller.loadDraftAndAnalyze();
    await Future<void>.delayed(Duration.zero);
    expect(
      container.read(reportCaptureControllerProvider).capturedFile,
      isNotNull,
    );
    expect(await controller.discardDraft(), isTrue);
    expect(await repo.getDraft(), isNull);
    expect(
      container.read(reportCaptureControllerProvider).capturedFile,
      isNull,
    );
    ai.result.complete(
      const AiAnalysisResult(provider: AiProvider.offlineGemma),
    );
    await pending;
    expect(container.read(reportReviewControllerProvider).draft, isNull);
  });

  test('Human edits made while AI is running are preserved', () async {
    final repo = TemporaryReportRepository();
    await repo.saveDraft(
      ReportDraft(
        sessionId: 'session',
        photoPath: 'photo.jpg',
        createdAt: DateTime.now(),
        location: GeoLocation(
          source: LocationSource.manual,
          sectionId: 'kurseong-ghum',
          capturedAt: DateTime.now(),
        ),
      ),
    );
    final ai = _PendingAi();
    final container = ProviderContainer(
      overrides: [
        reportRepositoryProvider.overrideWithValue(repo),
        aiAnalysisServiceProvider.overrideWithValue(ai),
      ],
    );
    addTearDown(container.dispose);
    final controller = container.read(reportReviewControllerProvider.notifier);
    final pending = controller.loadDraftAndAnalyze();
    await Future<void>.delayed(Duration.zero);
    controller.setConfirmedHazard(HazardType.blockedDrain);
    controller.setConfirmedSeverity(Severity.low);
    ai.result.complete(
      const AiAnalysisResult(
        provider: AiProvider.offlineGemma,
        hazardType: HazardType.rockfall,
        severity: Severity.high,
      ),
    );
    await pending;
    expect(
      container.read(reportReviewControllerProvider).confirmedHazard,
      HazardType.blockedDrain,
    );
    expect(
      container.read(reportReviewControllerProvider).confirmedSeverity,
      Severity.low,
    );
  });
}
