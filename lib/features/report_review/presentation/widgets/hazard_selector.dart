import 'package:flutter/material.dart';
import 'package:trackguard_dhr/app/theme.dart';
import 'package:trackguard_dhr/shared/models/hazard_type.dart';
import 'package:trackguard_dhr/shared/widgets/hazard_icon.dart';

class HazardSelector extends StatelessWidget {
  final HazardType selectedHazard;
  final ValueChanged<HazardType> onSelected;

  const HazardSelector({
    super.key,
    required this.selectedHazard,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = (constraints.maxWidth - 10) / 2;
      return Wrap(
        spacing: 10,
        runSpacing: 10,
        children: HazardType.values.map((type) {
          final isSelected = type == selectedHazard;
          final isOther = type == HazardType.other;
          return SizedBox(
            width: isOther ? constraints.maxWidth : width,
            height: 72,
            child: Material(
              color: isSelected
                  ? AppTheme.primaryBlue
                  : AppTheme.surfaceDarkElevated,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: isSelected
                      ? AppTheme.primaryBlue
                      : AppTheme.borderDark,
                  width: 1.5,
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () => onSelected(type),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            HazardIcon(hazardType: type, size: 24),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                HazardIcon.getLocalizedLabel(context, type),
                                maxLines: 2,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: isSelected
                                      ? Colors.white
                                      : AppTheme.textPrimary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (isSelected)
                      const Positioned(
                        right: 6,
                        top: 6,
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      );
    });
  }
}
