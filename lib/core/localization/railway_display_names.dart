import '../../l10n/app_localizations.dart';
import '../../shared/models/app_language.dart';
import '../constants/dhr_waypoints.dart';

/// Converts a known station ID or English display name to its localized label.
/// Unknown values are returned unchanged so stored or future station names stay
/// visible without changing the underlying report data.
String localizedStationName(AppLocalizations l10n, String stationIdOrName) {
  final normalized = stationIdOrName.trim().toLowerCase();
  const stationIds = {
    'kurseong': 'kurseong',
    'kurseong station': 'kurseong',
    'tung': 'tung',
    'tung station': 'tung',
    'dilaram': 'dilaram',
    'dilaram point': 'dilaram',
    'sonada': 'sonada',
    'sonada station': 'sonada',
    'rongbull': 'rongbull',
    'rongbull loop': 'rongbull',
    'jorebungalow': 'jorebungalow',
    'ghum': 'ghum',
    'ghum station': 'ghum',
    'batasia': 'batasia',
    'batasia loop': 'batasia',
    'darjeeling': 'darjeeling',
    'darjeeling station': 'darjeeling',
  };
  final stationId = stationIds[normalized];
  return stationId == null ? stationIdOrName : l10n.stationName(stationId);
}

/// Converts a known section ID or English display name to its localized label.
String localizedSectionName(AppLocalizations l10n, String sectionIdOrName) {
  final normalized = sectionIdOrName.trim().toLowerCase();
  return switch (normalized) {
    'kurseong-ghum' || 'kurseong → ghum' => l10n.sectionKurseongGhum,
    'ghum-darjeeling' || 'ghum → darjeeling' => l10n.sectionGhumDarjeeling,
    _ => sectionIdOrName,
  };
}

/// Uses the waypoint ID as the stable key while leaving waypoint data intact.
String localizedWaypointName(AppLocalizations l10n, DhrWaypoint waypoint) =>
    localizedStationName(l10n, waypoint.id);

String localizedLanguageName(AppLocalizations l10n, AppLanguage language) {
  return switch (language) {
    AppLanguage.en => l10n.languageNameEnglish,
    AppLanguage.hi => l10n.languageNameHindi,
    AppLanguage.bn => l10n.languageNameBengali,
    AppLanguage.ne => l10n.languageNameNepali,
  };
}
