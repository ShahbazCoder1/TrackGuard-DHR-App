import 'package:flutter/material.dart';

import '../../app/theme.dart';
import '../../l10n/app_localizations.dart';
import '../models/severity.dart';

class SeverityBadge extends StatelessWidget {
  final Severity severity;
  final bool isLarge;
  final bool useShortLabel;

  const SeverityBadge({
    super.key,
    required this.severity,
    this.isLarge = false,
    this.useShortLabel = true,
  });

  Color get _color {
    switch (severity) {
      case Severity.low:
        return AppTheme.statusGreen;
      case Severity.medium:
        return AppTheme.statusAmber;
      case Severity.high:
        return AppTheme.statusOrange;
      case Severity.critical:
        return AppTheme.statusRed;
    }
  }

  Color get _ink {
    switch (severity) {
      case Severity.low:
        return const Color(0xFF14532D);
      case Severity.medium:
        return const Color(0xFF78350F);
      case Severity.high:
        return const Color(0xFF7C2D12);
      case Severity.critical:
        return const Color(0xFF7F1D1D);
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _color;

    final l10n = AppLocalizations.of(context)!;
    final text = useShortLabel
        ? switch (severity) {
            Severity.low => l10n.severityLowShort,
            Severity.medium => l10n.severityMediumShort,
            Severity.high => l10n.severityHighShort,
            Severity.critical => l10n.severityCriticalShort,
          }
        : switch (severity) {
            Severity.low => l10n.severityLow,
            Severity.medium => l10n.severityMedium,
            Severity.high => l10n.severityHigh,
            Severity.critical => l10n.severityCritical,
          };

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isLarge ? 14 : 10,
        vertical: isLarge ? 6 : 4,
      ),
      decoration: BoxDecoration(
        color: switch (severity) {
          Severity.low => const Color(0xFFDCFCE7),
          Severity.medium => const Color(0xFFFEF3C7),
          Severity.high => const Color(0xFFFFEDD5),
          Severity.critical => const Color(0xFFFEE2E2),
        },
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withValues(alpha: 0.6), width: 1.0),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: _ink,
          fontSize: isLarge ? 14 : 12,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.3,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
