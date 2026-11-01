import 'package:flutter/material.dart';

import '../../core/permissions/permission_service.dart';
import '../../l10n/app_localizations.dart';

class LocationAccuracyPrompt extends StatefulWidget {
  final Widget child;

  const LocationAccuracyPrompt({required this.child, super.key});

  @override
  State<LocationAccuracyPrompt> createState() => _LocationAccuracyPromptState();
}

class _LocationAccuracyPromptState extends State<LocationAccuracyPrompt> {
  final PermissionService _permissionService = DefaultPermissionService();
  static bool _hasPromptedThisSession = false;

  @override
  void initState() {
    super.initState();
    if (_hasPromptedThisSession) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _checkAndShowPrompt();
      }
    });
  }

  Future<void> _checkAndShowPrompt() async {
    if (_hasPromptedThisSession) return;

    // First check if location service is already enabled and permission is granted
    try {
      final serviceEnabled =
          await _permissionService.isLocationServiceEnabled();
      final permissionGranted =
          await _permissionService.checkLocationPermission();

      // If location is already active and permission granted, never bother the user
      if (serviceEnabled && permissionGranted) {
        _hasPromptedThisSession = true;
        return;
      }
    } catch (_) {
      // Ignore checks if platform channel fails
    }

    _hasPromptedThisSession = true;
    if (!mounted) return;

    await _showPrompt();
  }

  Future<void> _showPrompt() async {
    final l10n = AppLocalizations.of(context);
    if (l10n == null) return;

    final shouldTurnOn = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(l10n.locationAccuracyPromptTitle),
        content: SingleChildScrollView(
          child: Text.rich(
            TextSpan(
              style: Theme.of(context).textTheme.bodyMedium,
              children: [
                TextSpan(text: '${l10n.locationAccuracyPromptMessage}\n\n'),
                TextSpan(
                  text: '${l10n.locationAccuracyPromptSettingsHeading}\n',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      '${l10n.locationAccuracyPromptDeviceLocation}\n'
                      '${l10n.locationAccuracyPromptLocationAccuracy}\n\n',
                ),
                TextSpan(
                  text:
                      '${l10n.locationAccuracyPromptExplanation}\n\n'
                      '${l10n.locationAccuracyPromptManageSettingsOr}',
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(l10n.locationAccuracyPromptNoThanks),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(l10n.locationAccuracyPromptTurnOn),
          ),
        ],
      ),
    );

    if (shouldTurnOn != true || !mounted) return;

    final permissionGranted =
        await _permissionService.requestLocationPermission();
    if (!mounted) return;

    final serviceEnabled =
        await _permissionService.isLocationServiceEnabled();
    if (!permissionGranted || !serviceEnabled) {
      await _permissionService.openLocationSettings();
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
