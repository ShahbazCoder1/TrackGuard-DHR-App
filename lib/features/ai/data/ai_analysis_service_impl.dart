import 'dart:io';

import '../../../core/errors/app_exception.dart';
import '../../../shared/models/ai_analysis_result.dart';
import '../../../shared/models/ai_provider.dart';
import '../../../shared/models/app_language.dart';
import '../../../shared/models/geo_location.dart';
import '../domain/ai_analysis_service.dart';
import '../domain/ai_settings.dart';
import 'heuristic_ai_provider.dart';
import 'litert_gemma_provider.dart';
import 'manual_ai_provider.dart';
import 'openrouter_ai_provider.dart';

class AiAnalysisServiceImpl implements AiAnalysisService {
  final LitertGemmaProvider _litertGemma;
  final OnlineGeminiProvider _onlineGemini;
  final ManualAiProvider _manualAi;

  AiAnalysisServiceImpl({
    LitertGemmaProvider? litertGemma,
    LitertGemmaProvider? cactusGemma,
    OnlineGeminiProvider? onlineGemini,
    HeuristicAiProvider? heuristicAi,
    ManualAiProvider? manualAi,
  }) : _litertGemma = litertGemma ?? cactusGemma ?? LitertGemmaProvider(),
       _onlineGemini = onlineGemini ?? OnlineGeminiProvider(),
       _manualAi = manualAi ?? ManualAiProvider();

  @override
  Future<bool> isOfflineModelAvailable() async {
    return _litertGemma.isModelInstalled();
  }

  @override
  Future<bool> isOnlineProviderAvailable() async {
    return _onlineGemini.isAvailable();
  }

  @override
  Future<void> initializeOfflineModel() async {
    await _litertGemma.initialize();
  }

  @override
  LitertGemmaState get offlineModelState => _litertGemma.state;

  @override
  Stream<LitertGemmaState> watchOfflineModelState() => _litertGemma.stateStream;

  @override
  Future<AiAnalysisResult> analyze({
    required File image,
    required GeoLocation location,
    required AppLanguage language,
    AiMode? requestedMode,
    void Function(AiProvider)? onProviderChanged,
  }) async {
    final mode = requestedMode ?? AiMode.automatic;
    if (mode == AiMode.manual) {
      onProviderChanged?.call(AiProvider.manual);
      return (await _manualAi.analyze(
        location: location,
        language: language,
      )).copyWith(requestedProvider: AiProvider.manual);
    }

    final requested = mode == AiMode.onlineGemini
        ? AiProvider.onlineGemini
        : AiProvider.offlineGemma;
    final providers = mode == AiMode.onlineGemini
        ? [AiProvider.onlineGemini, AiProvider.offlineGemma]
        : [AiProvider.offlineGemma, AiProvider.onlineGemini];
    Object? lastError;
    for (final provider in providers) {
      try {
        final available = provider == AiProvider.offlineGemma
            ? (_litertGemma.isReady || await _litertGemma.isModelInstalled())
            : await _onlineGemini.isAvailable();
        if (!available) continue;
        onProviderChanged?.call(provider);
        final result = provider == AiProvider.offlineGemma
            ? await _litertGemma.analyze(
                image: image,
                location: location,
                language: language,
              )
            : await _onlineGemini.analyze(
                image: image,
                location: location,
                language: language,
              );
        return result.copyWith(
          requestedProvider: requested,
          fallbackReason: provider != requested
              ? (requested == AiProvider.onlineGemini
                    ? 'Online Gemini unavailable; using Offline Gemma.'
                    : 'Offline Gemma unavailable; using Online Gemini.')
              : null,
        );
      } catch (error) {
        lastError = error;
      }
    }
    if (lastError != null) throw lastError;
    throw const AiUnavailableException(
      'No AI model is available. Use manual classification.',
    );
  }
}
