import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trackguard_dhr/core/localization/railway_display_names.dart';
import 'package:trackguard_dhr/l10n/app_localizations.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('Railway display localization', () {
    final expectedNames = {
      'en': ('Kurseong Station', 'Kurseong → Ghum'),
      'hi': ('कुर्सियांग स्टेशन', 'कुर्सियांग → घूम'),
      'bn': ('কার্শিয়াং স্টেশন', 'কার্শিয়াং → ঘুম'),
      'ne': ('कुर्सियाङ स्टेसन', 'कुर्सियाङ → घुम'),
    };

    for (final entry in expectedNames.entries) {
      test('localizes station and section values for ${entry.key}', () async {
        final l10n = await AppLocalizations.delegate.load(Locale(entry.key));

        expect(localizedStationName(l10n, 'kurseong'), entry.value.$1);
        expect(localizedStationName(l10n, 'Kurseong Station'), entry.value.$1);
        expect(localizedSectionName(l10n, 'kurseong-ghum'), entry.value.$2);
        expect(localizedSectionName(l10n, 'Kurseong → Ghum'), entry.value.$2);
      });
    }

    test('preserves unknown railway display values', () async {
      final l10n = await AppLocalizations.delegate.load(const Locale('en'));

      expect(localizedStationName(l10n, 'Future Station'), 'Future Station');
      expect(localizedSectionName(l10n, 'future-section'), 'future-section');
    });
  });
}
