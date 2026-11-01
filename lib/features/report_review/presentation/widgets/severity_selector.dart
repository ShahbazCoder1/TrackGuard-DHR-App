import 'package:flutter/material.dart';
import 'package:trackguard_dhr/app/theme.dart';
import 'package:trackguard_dhr/l10n/app_localizations.dart';
import 'package:trackguard_dhr/shared/models/severity.dart';

class SeveritySelector extends StatelessWidget {
  final Severity selectedSeverity;
  final ValueChanged<Severity> onSelected;

  const SeveritySelector({
    super.key,
    required this.selectedSeverity,
    required this.onSelected,
  });

  Color _severityColor(Severity severity) => switch (severity) {
    Severity.low => AppTheme.statusGreen,
    Severity.medium => AppTheme.statusAmber,
    Severity.high => AppTheme.statusOrange,
    Severity.critical => AppTheme.statusRed,
  };

  String _severityLabel(BuildContext context, Severity severity) {
    final l10n = AppLocalizations.of(context);
    return switch (severity) {
      Severity.low => l10n?.severityLow ?? 'Low',
      Severity.medium => l10n?.severityMedium ?? 'Medium',
      Severity.high => l10n?.severityHigh ?? 'High',
      Severity.critical => l10n?.severityCritical ?? 'Critical',
    };
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = (constraints.maxWidth - 10) / 2;
        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: Severity.values.map((severity) {
            final selected = severity == selectedSeverity;
            final color = _severityColor(severity);
            return SizedBox(
              width: width,
              height: 90,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => onSelected(severity),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: selected
                        ? color.withValues(alpha: 0.12)
                        : AppTheme.surfaceDark,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: selected ? color : AppTheme.borderDark,
                      width: selected ? 2.0 : 1.5,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 14,
                            height: 14,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Text(
                                _severityLabel(context, severity),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  height: 1.25,
                                  fontWeight: selected
                                      ? FontWeight.w700
                                      : FontWeight.w600,
                                  color: AppTheme.textPrimary,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (selected)
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Icon(Icons.check_circle, size: 16, color: color),
                        ),
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
