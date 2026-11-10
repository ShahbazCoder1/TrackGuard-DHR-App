import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ne.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bn'),
    Locale('en'),
    Locale('hi'),
    Locale('ne'),
  ];

  /// The title of the application
  ///
  /// In en, this message translates to:
  /// **'TrackGuard DHR'**
  String get appTitle;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Darjeeling Himalayan Railway Alignment Inspection'**
  String get tagline;

  /// No description provided for @gangman.
  ///
  /// In en, this message translates to:
  /// **'Gangman'**
  String get gangman;

  /// No description provided for @admin.
  ///
  /// In en, this message translates to:
  /// **'Supervisor / Admin'**
  String get admin;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'TrackGuard DHR Sign In'**
  String get signInTitle;

  /// No description provided for @signInSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Permanent-Way Inspection & Hazard Reporting'**
  String get signInSubtitle;

  /// No description provided for @signInGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign In with Google'**
  String get signInGoogle;

  /// No description provided for @offlineFieldLogin.
  ///
  /// In en, this message translates to:
  /// **'Field Inspection (Offline Mode)'**
  String get offlineFieldLogin;

  /// No description provided for @offlineFieldLoginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Use on-device Gemma AI • No internet required'**
  String get offlineFieldLoginSubtitle;

  /// No description provided for @offlineModeBadge.
  ///
  /// In en, this message translates to:
  /// **'Offline Mode (No Internet)'**
  String get offlineModeBadge;

  /// No description provided for @onlineModeBadge.
  ///
  /// In en, this message translates to:
  /// **'Online (Cloud Sync Ready)'**
  String get onlineModeBadge;

  /// No description provided for @devSignInGangman.
  ///
  /// In en, this message translates to:
  /// **'Developer Sign In (Gangman)'**
  String get devSignInGangman;

  /// No description provided for @devSignInAdmin.
  ///
  /// In en, this message translates to:
  /// **'Developer Sign In (Admin)'**
  String get devSignInAdmin;

  /// No description provided for @signingIn.
  ///
  /// In en, this message translates to:
  /// **'Signing in...'**
  String get signingIn;

  /// No description provided for @signOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get signOut;

  /// No description provided for @signedInAs.
  ///
  /// In en, this message translates to:
  /// **'Signed in as {name}'**
  String signedInAs(String name);

  /// No description provided for @pendingAccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Access Approval Pending'**
  String get pendingAccessTitle;

  /// No description provided for @pendingAccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Your account has been registered. An authorized permanent-way supervisor must approve your profile before you can access field tools.'**
  String get pendingAccessMessage;

  /// No description provided for @inactiveAccountMessage.
  ///
  /// In en, this message translates to:
  /// **'Your account is marked inactive. Please contact your section engineer.'**
  String get inactiveAccountMessage;

  /// No description provided for @checkStatus.
  ///
  /// In en, this message translates to:
  /// **'Check Status'**
  String get checkStatus;

  /// No description provided for @homeTitle.
  ///
  /// In en, this message translates to:
  /// **'Inspection Dashboard'**
  String get homeTitle;

  /// No description provided for @newReport.
  ///
  /// In en, this message translates to:
  /// **'New Report'**
  String get newReport;

  /// No description provided for @myReports.
  ///
  /// In en, this message translates to:
  /// **'My Reports'**
  String get myReports;

  /// No description provided for @pendingQueue.
  ///
  /// In en, this message translates to:
  /// **'Pending Sync Queue'**
  String get pendingQueue;

  /// No description provided for @pendingReportsCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 reports pending} =1{1 report pending} other{{count} reports pending}}'**
  String pendingReportsCount(int count);

  /// No description provided for @assignedSection.
  ///
  /// In en, this message translates to:
  /// **'Assigned Section: {section}'**
  String assignedSection(String section);

  /// No description provided for @unassignedSection.
  ///
  /// In en, this message translates to:
  /// **'No section assigned'**
  String get unassignedSection;

  /// No description provided for @onlineStatus.
  ///
  /// In en, this message translates to:
  /// **'Online - Cloud Sync Ready'**
  String get onlineStatus;

  /// No description provided for @offlineStatus.
  ///
  /// In en, this message translates to:
  /// **'Offline - Local Queue Active'**
  String get offlineStatus;

  /// No description provided for @aiStatusReady.
  ///
  /// In en, this message translates to:
  /// **'AI Analysis: Ready (Offline)'**
  String get aiStatusReady;

  /// No description provided for @aiStatusHeuristic.
  ///
  /// In en, this message translates to:
  /// **'AI Analysis: Heuristic Fallback'**
  String get aiStatusHeuristic;

  /// No description provided for @aiStatusUnavailable.
  ///
  /// In en, this message translates to:
  /// **'AI Analysis: Manual Only'**
  String get aiStatusUnavailable;

  /// No description provided for @offlineExplanation.
  ///
  /// In en, this message translates to:
  /// **'All inspection reports are saved to your device immediately. When you reach a station with connectivity, queued reports will sync automatically.'**
  String get offlineExplanation;

  /// No description provided for @captureTitle.
  ///
  /// In en, this message translates to:
  /// **'Capture Hazard Photo'**
  String get captureTitle;

  /// No description provided for @cameraPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Camera Permission Required'**
  String get cameraPermissionTitle;

  /// No description provided for @cameraPermissionMessage.
  ///
  /// In en, this message translates to:
  /// **'TrackGuard needs camera access to capture track hazards and retaining wall defects.'**
  String get cameraPermissionMessage;

  /// No description provided for @locationPermissionTitle.
  ///
  /// In en, this message translates to:
  /// **'Location Permission Required'**
  String get locationPermissionTitle;

  /// No description provided for @locationPermissionMessage.
  ///
  /// In en, this message translates to:
  /// **'Precise GPS location is needed to estimate alignment kilometre markers and track sections.'**
  String get locationPermissionMessage;

  /// No description provided for @grantPermission.
  ///
  /// In en, this message translates to:
  /// **'Grant Permission'**
  String get grantPermission;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Capture Photo'**
  String get takePhoto;

  /// No description provided for @retake.
  ///
  /// In en, this message translates to:
  /// **'Retake'**
  String get retake;

  /// No description provided for @confirmPhoto.
  ///
  /// In en, this message translates to:
  /// **'Use Photo'**
  String get confirmPhoto;

  /// No description provided for @switchCamera.
  ///
  /// In en, this message translates to:
  /// **'Switch Camera'**
  String get switchCamera;

  /// No description provided for @galleryFallback.
  ///
  /// In en, this message translates to:
  /// **'Select from Gallery'**
  String get galleryFallback;

  /// No description provided for @cameraUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Camera unavailable. Please use gallery fallback.'**
  String get cameraUnavailable;

  /// No description provided for @processingImage.
  ///
  /// In en, this message translates to:
  /// **'Processing image...'**
  String get processingImage;

  /// No description provided for @locationTitle.
  ///
  /// In en, this message translates to:
  /// **'Location & Alignment'**
  String get locationTitle;

  /// No description provided for @gpsAcquiring.
  ///
  /// In en, this message translates to:
  /// **'Acquiring GPS fix...'**
  String get gpsAcquiring;

  /// No description provided for @gpsLocked.
  ///
  /// In en, this message translates to:
  /// **'GPS Locked (±{accuracy}m)'**
  String gpsLocked(String accuracy);

  /// No description provided for @gpsUnavailable.
  ///
  /// In en, this message translates to:
  /// **'GPS Signal Unavailable'**
  String get gpsUnavailable;

  /// No description provided for @locationSourceGps.
  ///
  /// In en, this message translates to:
  /// **'Source: Real GPS'**
  String get locationSourceGps;

  /// No description provided for @locationSourceManual.
  ///
  /// In en, this message translates to:
  /// **'Source: Manual Selection'**
  String get locationSourceManual;

  /// No description provided for @locationSourceFallback.
  ///
  /// In en, this message translates to:
  /// **'Source: Estimated Fallback'**
  String get locationSourceFallback;

  /// No description provided for @kmMarker.
  ///
  /// In en, this message translates to:
  /// **'Km {marker}'**
  String kmMarker(String marker);

  /// No description provided for @nearestStation.
  ///
  /// In en, this message translates to:
  /// **'Nearest Station: {station}'**
  String nearestStation(String station);

  /// No description provided for @selectWaypoint.
  ///
  /// In en, this message translates to:
  /// **'Select Nearest DHR Station / Waypoint'**
  String get selectWaypoint;

  /// No description provided for @stationName.
  ///
  /// In en, this message translates to:
  /// **'{stationId, select, kurseong {Kurseong Station} tung {Tung Station} dilaram {Dilaram Point} sonada {Sonada Station} rongbull {Rongbull Loop} jorebungalow {Jorebungalow} ghum {Ghum Station} batasia {Batasia Loop} darjeeling {Darjeeling Station} other {stationId}}'**
  String stationName(String stationId);

  /// No description provided for @editKm.
  ///
  /// In en, this message translates to:
  /// **'Edit Km Marker'**
  String get editKm;

  /// No description provided for @manualLocationNotice.
  ///
  /// In en, this message translates to:
  /// **'Warning: Fallback coordinates are estimated. Adjust km marker manually if needed.'**
  String get manualLocationNotice;

  /// No description provided for @reviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Review & Confirm Report'**
  String get reviewTitle;

  /// No description provided for @aiSuggestionTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Advisory Suggestion'**
  String get aiSuggestionTitle;

  /// No description provided for @aiDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'AI suggestions are advisory only. Permanent-way staff must inspect and confirm the actual hazard and severity before saving.'**
  String get aiDisclaimer;

  /// No description provided for @aiAnalyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing image with on-device intelligence...'**
  String get aiAnalyzing;

  /// No description provided for @aiSuggestedHazard.
  ///
  /// In en, this message translates to:
  /// **'Suggested Hazard: {hazard}'**
  String aiSuggestedHazard(String hazard);

  /// No description provided for @aiSuggestedSeverity.
  ///
  /// In en, this message translates to:
  /// **'Suggested Severity: {severity}'**
  String aiSuggestedSeverity(String severity);

  /// No description provided for @aiNote.
  ///
  /// In en, this message translates to:
  /// **'AI Observation: {note}'**
  String aiNote(String note);

  /// No description provided for @humanConfirmationTitle.
  ///
  /// In en, this message translates to:
  /// **'Human Confirmation (Required)'**
  String get humanConfirmationTitle;

  /// No description provided for @hazardType.
  ///
  /// In en, this message translates to:
  /// **'Hazard Type'**
  String get hazardType;

  /// No description provided for @severity.
  ///
  /// In en, this message translates to:
  /// **'Severity'**
  String get severity;

  /// No description provided for @gangmanNote.
  ///
  /// In en, this message translates to:
  /// **'Gangman\'s Field Note'**
  String get gangmanNote;

  /// No description provided for @gangmanNoteHint.
  ///
  /// In en, this message translates to:
  /// **'Describe obstruction, track clearance, or slope movement...'**
  String get gangmanNoteHint;

  /// No description provided for @saveAndQueue.
  ///
  /// In en, this message translates to:
  /// **'Confirm & Save Locally'**
  String get saveAndQueue;

  /// No description provided for @saving.
  ///
  /// In en, this message translates to:
  /// **'Saving report locally...'**
  String get saving;

  /// No description provided for @savedSuccessTitle.
  ///
  /// In en, this message translates to:
  /// **'Report Saved Locally!'**
  String get savedSuccessTitle;

  /// No description provided for @savedSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Report saved with ID: {id}. It has been added to the local queue and will sync when station connectivity is reached.'**
  String savedSuccessMessage(String id);

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @viewQueue.
  ///
  /// In en, this message translates to:
  /// **'View Queue'**
  String get viewQueue;

  /// No description provided for @hazardSlip.
  ///
  /// In en, this message translates to:
  /// **'Landslip / Mudslide'**
  String get hazardSlip;

  /// No description provided for @hazardRockfall.
  ///
  /// In en, this message translates to:
  /// **'Rockfall / Fallen Debris'**
  String get hazardRockfall;

  /// No description provided for @hazardBlockedDrain.
  ///
  /// In en, this message translates to:
  /// **'Blocked Catchwater Drain'**
  String get hazardBlockedDrain;

  /// No description provided for @hazardDamagedWall.
  ///
  /// In en, this message translates to:
  /// **'Damaged Retaining Wall'**
  String get hazardDamagedWall;

  /// No description provided for @hazardTrackDefect.
  ///
  /// In en, this message translates to:
  /// **'Track Defect / Gauge Spread'**
  String get hazardTrackDefect;

  /// No description provided for @hazardVegetation.
  ///
  /// In en, this message translates to:
  /// **'Vegetation Overgrowth'**
  String get hazardVegetation;

  /// No description provided for @hazardOther.
  ///
  /// In en, this message translates to:
  /// **'Other Hazard'**
  String get hazardOther;

  /// No description provided for @severityLow.
  ///
  /// In en, this message translates to:
  /// **'Low - Monitor'**
  String get severityLow;

  /// No description provided for @severityMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium - Maintenance Needed'**
  String get severityMedium;

  /// No description provided for @severityHigh.
  ///
  /// In en, this message translates to:
  /// **'High - Speed Restriction Required'**
  String get severityHigh;

  /// No description provided for @severityCritical.
  ///
  /// In en, this message translates to:
  /// **'Critical - Track Obstruction / Danger'**
  String get severityCritical;

  /// No description provided for @statusOpen.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get statusOpen;

  /// No description provided for @statusAcknowledged.
  ///
  /// In en, this message translates to:
  /// **'Acknowledged'**
  String get statusAcknowledged;

  /// No description provided for @statusInspectionRequired.
  ///
  /// In en, this message translates to:
  /// **'Inspection Required'**
  String get statusInspectionRequired;

  /// No description provided for @statusResolved.
  ///
  /// In en, this message translates to:
  /// **'Resolved'**
  String get statusResolved;

  /// No description provided for @syncDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get syncDraft;

  /// No description provided for @syncPending.
  ///
  /// In en, this message translates to:
  /// **'Pending Sync'**
  String get syncPending;

  /// No description provided for @syncSyncing.
  ///
  /// In en, this message translates to:
  /// **'Syncing...'**
  String get syncSyncing;

  /// No description provided for @syncSynced.
  ///
  /// In en, this message translates to:
  /// **'Synced to Server'**
  String get syncSynced;

  /// No description provided for @syncFailed.
  ///
  /// In en, this message translates to:
  /// **'Sync Failed'**
  String get syncFailed;

  /// No description provided for @syncConflict.
  ///
  /// In en, this message translates to:
  /// **'Conflict'**
  String get syncConflict;

  /// No description provided for @syncStatusDraft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get syncStatusDraft;

  /// No description provided for @syncStatusPending.
  ///
  /// In en, this message translates to:
  /// **'Pending Sync'**
  String get syncStatusPending;

  /// No description provided for @syncStatusSyncing.
  ///
  /// In en, this message translates to:
  /// **'Syncing...'**
  String get syncStatusSyncing;

  /// No description provided for @syncStatusSynced.
  ///
  /// In en, this message translates to:
  /// **'Synced'**
  String get syncStatusSynced;

  /// No description provided for @syncStatusFailed.
  ///
  /// In en, this message translates to:
  /// **'Sync Failed'**
  String get syncStatusFailed;

  /// No description provided for @syncStatusConflict.
  ///
  /// In en, this message translates to:
  /// **'Conflict'**
  String get syncStatusConflict;

  /// No description provided for @syncSummaryTitle.
  ///
  /// In en, this message translates to:
  /// **'Sync Summary'**
  String get syncSummaryTitle;

  /// No description provided for @syncPendingReports.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 reports waiting} =1{1 report waiting to sync} other{{count} reports waiting to sync}}'**
  String syncPendingReports(int count);

  /// No description provided for @syncFailedReports.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{0 reports failed} =1{1 report failed} other{{count} reports failed}}'**
  String syncFailedReports(int count);

  /// No description provided for @syncReportsSyncing.
  ///
  /// In en, this message translates to:
  /// **'Syncing reports...'**
  String get syncReportsSyncing;

  /// No description provided for @syncAllReportsSynced.
  ///
  /// In en, this message translates to:
  /// **'All reports synced'**
  String get syncAllReportsSynced;

  /// No description provided for @syncLastSuccessful.
  ///
  /// In en, this message translates to:
  /// **'Last synced: {time}'**
  String syncLastSuccessful(String time);

  /// No description provided for @syncNoSuccessfulSync.
  ///
  /// In en, this message translates to:
  /// **'Not synced yet'**
  String get syncNoSuccessfulSync;

  /// No description provided for @syncOfflineSafe.
  ///
  /// In en, this message translates to:
  /// **'Offline — reports remain safely stored on this device.'**
  String get syncOfflineSafe;

  /// No description provided for @syncWaitingForSignal.
  ///
  /// In en, this message translates to:
  /// **'Offline — waiting for station signal'**
  String get syncWaitingForSignal;

  /// No description provided for @syncStationSignalAvailable.
  ///
  /// In en, this message translates to:
  /// **'Station signal available'**
  String get syncStationSignalAvailable;

  /// No description provided for @syncSavedLocally.
  ///
  /// In en, this message translates to:
  /// **'Saved locally on this device'**
  String get syncSavedLocally;

  /// No description provided for @syncSavedAndSynced.
  ///
  /// In en, this message translates to:
  /// **'Saved and synced to server'**
  String get syncSavedAndSynced;

  /// No description provided for @syncFailedButSafe.
  ///
  /// In en, this message translates to:
  /// **'Some reports could not sync. They remain safe locally.'**
  String get syncFailedButSafe;

  /// No description provided for @syncNeedsAttention.
  ///
  /// In en, this message translates to:
  /// **'This report needs attention'**
  String get syncNeedsAttention;

  /// No description provided for @syncErrorOffline.
  ///
  /// In en, this message translates to:
  /// **'No network connection. The report is safely stored on this device.'**
  String get syncErrorOffline;

  /// No description provided for @syncErrorTimeout.
  ///
  /// In en, this message translates to:
  /// **'The station connection took too long. The report remains saved locally.'**
  String get syncErrorTimeout;

  /// No description provided for @syncErrorServerUnavailable.
  ///
  /// In en, this message translates to:
  /// **'The control service is temporarily unavailable. Please try again later.'**
  String get syncErrorServerUnavailable;

  /// No description provided for @syncErrorUnauthorized.
  ///
  /// In en, this message translates to:
  /// **'Your access has expired or is unauthorized. Sign in again when connectivity is available.'**
  String get syncErrorUnauthorized;

  /// No description provided for @syncErrorMediaUpload.
  ///
  /// In en, this message translates to:
  /// **'The report details were prepared, but the photo could not be uploaded yet.'**
  String get syncErrorMediaUpload;

  /// No description provided for @syncErrorConflict.
  ///
  /// In en, this message translates to:
  /// **'This report was changed elsewhere and needs review.'**
  String get syncErrorConflict;

  /// No description provided for @syncErrorUnknown.
  ///
  /// In en, this message translates to:
  /// **'The report could not be synchronized. It remains safely stored locally.'**
  String get syncErrorUnknown;

  /// No description provided for @aiProviderOfflineGemma.
  ///
  /// In en, this message translates to:
  /// **'Offline Gemma'**
  String get aiProviderOfflineGemma;

  /// No description provided for @aiProviderHeuristic.
  ///
  /// In en, this message translates to:
  /// **'Heuristic Rules'**
  String get aiProviderHeuristic;

  /// No description provided for @aiProviderManual.
  ///
  /// In en, this message translates to:
  /// **'Manual Classification'**
  String get aiProviderManual;

  /// No description provided for @aiProviderOnlineGemini.
  ///
  /// In en, this message translates to:
  /// **'Online Gemini'**
  String get aiProviderOnlineGemini;

  /// No description provided for @aiModelLabel.
  ///
  /// In en, this message translates to:
  /// **'AI Model'**
  String get aiModelLabel;

  /// No description provided for @aiProviderLabel.
  ///
  /// In en, this message translates to:
  /// **'AI Provider'**
  String get aiProviderLabel;

  /// No description provided for @aiLanguageLabel.
  ///
  /// In en, this message translates to:
  /// **'AI Language'**
  String get aiLanguageLabel;

  /// No description provided for @aiConfidenceLabel.
  ///
  /// In en, this message translates to:
  /// **'Confidence'**
  String get aiConfidenceLabel;

  /// No description provided for @aiAdvisoryNotice.
  ///
  /// In en, this message translates to:
  /// **'AI suggestion is advisory only. Gangman inspection confirmed.'**
  String get aiAdvisoryNotice;

  /// No description provided for @syncNow.
  ///
  /// In en, this message translates to:
  /// **'Sync Now'**
  String get syncNow;

  /// No description provided for @syncSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Synchronization completed successfully'**
  String get syncSuccessMessage;

  /// No description provided for @retrySync.
  ///
  /// In en, this message translates to:
  /// **'Retry Sync'**
  String get retrySync;

  /// No description provided for @viewSyncDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewSyncDetails;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get yesterday;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @allFilter.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get allFilter;

  /// No description provided for @noReportsMatchFilter.
  ///
  /// In en, this message translates to:
  /// **'No reports match the selected filter.'**
  String get noReportsMatchFilter;

  /// No description provided for @profileTitle.
  ///
  /// In en, this message translates to:
  /// **'User Profile'**
  String get profileTitle;

  /// No description provided for @profileName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get profileName;

  /// No description provided for @profileEmail.
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get profileEmail;

  /// No description provided for @profileRole.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get profileRole;

  /// No description provided for @profileAssignedSection.
  ///
  /// In en, this message translates to:
  /// **'Assigned Section'**
  String get profileAssignedSection;

  /// No description provided for @profileLanguage.
  ///
  /// In en, this message translates to:
  /// **'Preferred Language'**
  String get profileLanguage;

  /// No description provided for @profileAccountStatus.
  ///
  /// In en, this message translates to:
  /// **'Account Status'**
  String get profileAccountStatus;

  /// No description provided for @profileActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get profileActive;

  /// No description provided for @profileInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get profileInactive;

  /// No description provided for @profileBackToHome.
  ///
  /// In en, this message translates to:
  /// **'Return to Dashboard'**
  String get profileBackToHome;

  /// No description provided for @roleGangman.
  ///
  /// In en, this message translates to:
  /// **'Gangman'**
  String get roleGangman;

  /// No description provided for @roleAdmin.
  ///
  /// In en, this message translates to:
  /// **'Supervisor / Admin'**
  String get roleAdmin;

  /// No description provided for @navigationHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navigationHome;

  /// No description provided for @navigationMyReports.
  ///
  /// In en, this message translates to:
  /// **'My Reports'**
  String get navigationMyReports;

  /// No description provided for @navigationDashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get navigationDashboard;

  /// No description provided for @navigationProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navigationProfile;

  /// No description provided for @navigationLogout.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get navigationLogout;

  /// No description provided for @navigationReports.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get navigationReports;

  /// No description provided for @navigationUsers.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get navigationUsers;

  /// No description provided for @navigationBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get navigationBack;

  /// No description provided for @navigationRefresh.
  ///
  /// In en, this message translates to:
  /// **'Refresh'**
  String get navigationRefresh;

  /// No description provided for @logoutTitle.
  ///
  /// In en, this message translates to:
  /// **'Confirm Sign Out'**
  String get logoutTitle;

  /// No description provided for @logoutConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to sign out of your account?'**
  String get logoutConfirmation;

  /// No description provided for @logoutConfirm.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get logoutConfirm;

  /// No description provided for @logoutCancel.
  ///
  /// In en, this message translates to:
  /// **'Stay Signed In'**
  String get logoutCancel;

  /// No description provided for @logoutSigningOut.
  ///
  /// In en, this message translates to:
  /// **'Signing out...'**
  String get logoutSigningOut;

  /// No description provided for @logoutSuccess.
  ///
  /// In en, this message translates to:
  /// **'Signed out successfully'**
  String get logoutSuccess;

  /// No description provided for @logoutError.
  ///
  /// In en, this message translates to:
  /// **'Failed to sign out. Please try again.'**
  String get logoutError;

  /// No description provided for @logoutPendingReportsWarning.
  ///
  /// In en, this message translates to:
  /// **'You have {count, plural, =1{1 pending report} other{{count} pending reports}} waiting to synchronize.'**
  String logoutPendingReportsWarning(int count);

  /// No description provided for @logoutReportsRemainOnDevice.
  ///
  /// In en, this message translates to:
  /// **'Unsynced reports remain safely stored on this device and will not be lost.'**
  String get logoutReportsRemainOnDevice;

  /// No description provided for @routeAccessDenied.
  ///
  /// In en, this message translates to:
  /// **'Access denied for your role.'**
  String get routeAccessDenied;

  /// No description provided for @routeSessionRequired.
  ///
  /// In en, this message translates to:
  /// **'Please sign in to continue.'**
  String get routeSessionRequired;

  /// No description provided for @routeProfilePending.
  ///
  /// In en, this message translates to:
  /// **'Your profile is pending supervisor approval.'**
  String get routeProfilePending;

  /// No description provided for @routeInactiveAccount.
  ///
  /// In en, this message translates to:
  /// **'Your account is currently inactive.'**
  String get routeInactiveAccount;

  /// No description provided for @reportDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Inspection Detail'**
  String get reportDetailTitle;

  /// No description provided for @reportDetailLocation.
  ///
  /// In en, this message translates to:
  /// **'Location & Track Alignment'**
  String get reportDetailLocation;

  /// No description provided for @reportDetailCreated.
  ///
  /// In en, this message translates to:
  /// **'Created: {time}'**
  String reportDetailCreated(String time);

  /// No description provided for @reportDetailUpdated.
  ///
  /// In en, this message translates to:
  /// **'Updated: {time}'**
  String reportDetailUpdated(String time);

  /// No description provided for @reportDetailInspectionStatus.
  ///
  /// In en, this message translates to:
  /// **'Inspection Status'**
  String get reportDetailInspectionStatus;

  /// No description provided for @reportDetailSyncStatus.
  ///
  /// In en, this message translates to:
  /// **'Sync Status'**
  String get reportDetailSyncStatus;

  /// No description provided for @reportDetailAiInformation.
  ///
  /// In en, this message translates to:
  /// **'AI Suggestion (Advisory)'**
  String get reportDetailAiInformation;

  /// No description provided for @reportDetailHumanConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed by Inspector'**
  String get reportDetailHumanConfirmed;

  /// No description provided for @reportDetailViewImage.
  ///
  /// In en, this message translates to:
  /// **'View Full Image'**
  String get reportDetailViewImage;

  /// No description provided for @reportDetailRetrySync.
  ///
  /// In en, this message translates to:
  /// **'Retry Synchronization'**
  String get reportDetailRetrySync;

  /// No description provided for @reportDetailUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Report not found or unavailable.'**
  String get reportDetailUnavailable;

  /// No description provided for @aiSettingsTitle.
  ///
  /// In en, this message translates to:
  /// **'AI & Model Settings'**
  String get aiSettingsTitle;

  /// No description provided for @aiModeAutomatic.
  ///
  /// In en, this message translates to:
  /// **'Automatic (Offline-First)'**
  String get aiModeAutomatic;

  /// No description provided for @aiModeOfflineGemma.
  ///
  /// In en, this message translates to:
  /// **'Offline Gemma 4 E2B'**
  String get aiModeOfflineGemma;

  /// No description provided for @aiModeOnlineGemini.
  ///
  /// In en, this message translates to:
  /// **'Online Gemini Cloud'**
  String get aiModeOnlineGemini;

  /// No description provided for @aiModeManual.
  ///
  /// In en, this message translates to:
  /// **'Manual Classification Only'**
  String get aiModeManual;

  /// No description provided for @aiOfflineGemma.
  ///
  /// In en, this message translates to:
  /// **'Offline Gemma Engine'**
  String get aiOfflineGemma;

  /// No description provided for @aiGemmaModelName.
  ///
  /// In en, this message translates to:
  /// **'Gemma 4 E2B'**
  String get aiGemmaModelName;

  /// No description provided for @aiGemmaReady.
  ///
  /// In en, this message translates to:
  /// **'Model Ready (On-Device)'**
  String get aiGemmaReady;

  /// No description provided for @aiGemmaLoading.
  ///
  /// In en, this message translates to:
  /// **'Initializing Gemma Model...'**
  String get aiGemmaLoading;

  /// No description provided for @aiGemmaUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Offline Model Unavailable'**
  String get aiGemmaUnavailable;

  /// No description provided for @aiGemmaFailed.
  ///
  /// In en, this message translates to:
  /// **'Offline Model Initialization Failed'**
  String get aiGemmaFailed;

  /// No description provided for @aiGemini.
  ///
  /// In en, this message translates to:
  /// **'Gemini Cloud Reasoning'**
  String get aiGemini;

  /// No description provided for @aiGeminiRequiresNetwork.
  ///
  /// In en, this message translates to:
  /// **'Online Gemini requires active station or cellular network'**
  String get aiGeminiRequiresNetwork;

  /// No description provided for @aiGeminiUnavailable.
  ///
  /// In en, this message translates to:
  /// **'Online Gemini service unavailable'**
  String get aiGeminiUnavailable;

  /// No description provided for @aiProviderUsed.
  ///
  /// In en, this message translates to:
  /// **'Actual Provider'**
  String get aiProviderUsed;

  /// No description provided for @aiRequestedProvider.
  ///
  /// In en, this message translates to:
  /// **'Requested Provider'**
  String get aiRequestedProvider;

  /// No description provided for @aiModelName.
  ///
  /// In en, this message translates to:
  /// **'Model Name'**
  String get aiModelName;

  /// No description provided for @aiPromptLanguage.
  ///
  /// In en, this message translates to:
  /// **'Prompt Language'**
  String get aiPromptLanguage;

  /// No description provided for @aiConfidence.
  ///
  /// In en, this message translates to:
  /// **'Model Confidence'**
  String get aiConfidence;

  /// No description provided for @aiFallbackReason.
  ///
  /// In en, this message translates to:
  /// **'Fallback Reason'**
  String get aiFallbackReason;

  /// No description provided for @aiHumanConfirmationRequired.
  ///
  /// In en, this message translates to:
  /// **'Human Confirmation Mandatory'**
  String get aiHumanConfirmationRequired;

  /// No description provided for @aiAnalyzingOffline.
  ///
  /// In en, this message translates to:
  /// **'Analyzing with Offline Gemma 4 E2B...'**
  String get aiAnalyzingOffline;

  /// No description provided for @aiAnalyzingOnline.
  ///
  /// In en, this message translates to:
  /// **'Analyzing with Online Gemini Cloud...'**
  String get aiAnalyzingOnline;

  /// No description provided for @aiManualClassification.
  ///
  /// In en, this message translates to:
  /// **'AI bypassed. Manual field inspection values applied.'**
  String get aiManualClassification;

  /// No description provided for @aiInvalidResult.
  ///
  /// In en, this message translates to:
  /// **'The AI result could not be verified. Please review the fields manually.'**
  String get aiInvalidResult;

  /// No description provided for @aiValidationFailed.
  ///
  /// In en, this message translates to:
  /// **'AI output failed safety or schema validation.'**
  String get aiValidationFailed;

  /// No description provided for @aiModelInitializationFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to initialize offline Gemma runtime.'**
  String get aiModelInitializationFailed;

  /// No description provided for @aiInferenceFailed.
  ///
  /// In en, this message translates to:
  /// **'AI model inference execution failed.'**
  String get aiInferenceFailed;

  /// No description provided for @aiOnlineRequestFailed.
  ///
  /// In en, this message translates to:
  /// **'Online AI backend request failed.'**
  String get aiOnlineRequestFailed;

  /// No description provided for @aiRateLimited.
  ///
  /// In en, this message translates to:
  /// **'AI service rate limit reached. Please retry later.'**
  String get aiRateLimited;

  /// No description provided for @aiTimeout.
  ///
  /// In en, this message translates to:
  /// **'AI analysis timed out. Your report will be classified manually.'**
  String get aiTimeout;

  /// No description provided for @aiImageTooLarge.
  ///
  /// In en, this message translates to:
  /// **'The image is too large for analysis. A compressed version will be used.'**
  String get aiImageTooLarge;

  /// No description provided for @aiPrivacyNotice.
  ///
  /// In en, this message translates to:
  /// **'On-device Gemma models process images locally without uploading data to external cloud servers.'**
  String get aiPrivacyNotice;

  /// No description provided for @aiOfflineFirstNotice.
  ///
  /// In en, this message translates to:
  /// **'Uses private on-device Gemma when available, cloud Gemini when connected, or heuristic rules.'**
  String get aiOfflineFirstNotice;

  /// No description provided for @aiRetryAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Retry Analysis'**
  String get aiRetryAnalysis;

  /// No description provided for @aiUseManualClassification.
  ///
  /// In en, this message translates to:
  /// **'Switch to Manual'**
  String get aiUseManualClassification;

  /// No description provided for @aiActualProvider.
  ///
  /// In en, this message translates to:
  /// **'Active Provider'**
  String get aiActualProvider;

  /// No description provided for @offlineModelDownloadTitle.
  ///
  /// In en, this message translates to:
  /// **'Gemma 4 E2B Download'**
  String get offlineModelDownloadTitle;

  /// No description provided for @offlineModelDownload.
  ///
  /// In en, this message translates to:
  /// **'Download Model'**
  String get offlineModelDownload;

  /// No description provided for @offlineModelNotDownloaded.
  ///
  /// In en, this message translates to:
  /// **'Model is not downloaded'**
  String get offlineModelNotDownloaded;

  /// No description provided for @offlineModelDownloading.
  ///
  /// In en, this message translates to:
  /// **'Downloading Gemma 4 E2B'**
  String get offlineModelDownloading;

  /// No description provided for @offlineModelDownloaded.
  ///
  /// In en, this message translates to:
  /// **'Gemma 4 E2B downloaded'**
  String get offlineModelDownloaded;

  /// No description provided for @offlineModelReady.
  ///
  /// In en, this message translates to:
  /// **'Gemma 4 E2B Ready'**
  String get offlineModelReady;

  /// No description provided for @offlineModelInitializing.
  ///
  /// In en, this message translates to:
  /// **'Initializing model runtime...'**
  String get offlineModelInitializing;

  /// No description provided for @offlineModelFailed.
  ///
  /// In en, this message translates to:
  /// **'Model download failed'**
  String get offlineModelFailed;

  /// No description provided for @offlineModelUnsupported.
  ///
  /// In en, this message translates to:
  /// **'Device does not support local model execution'**
  String get offlineModelUnsupported;

  /// No description provided for @offlineModelApproximateSize.
  ///
  /// In en, this message translates to:
  /// **'Approximate download size: {size}'**
  String offlineModelApproximateSize(String size);

  /// No description provided for @offlineModelStorageRequired.
  ///
  /// In en, this message translates to:
  /// **'Required free storage: {size}'**
  String offlineModelStorageRequired(String size);

  /// No description provided for @offlineModelStorageAvailable.
  ///
  /// In en, this message translates to:
  /// **'Available storage: {size}'**
  String offlineModelStorageAvailable(String size);

  /// No description provided for @offlineModelDownloadProgress.
  ///
  /// In en, this message translates to:
  /// **'{downloaded} of {total} ({percent}%)'**
  String offlineModelDownloadProgress(
    String downloaded,
    String total,
    int percent,
  );

  /// No description provided for @offlineModelDownloadComplete.
  ///
  /// In en, this message translates to:
  /// **'Download completed successfully'**
  String get offlineModelDownloadComplete;

  /// No description provided for @offlineModelDownloadFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to download model files'**
  String get offlineModelDownloadFailed;

  /// No description provided for @offlineModelInsufficientStorage.
  ///
  /// In en, this message translates to:
  /// **'Not enough storage to download the offline model. Free additional space and try again.'**
  String get offlineModelInsufficientStorage;

  /// No description provided for @offlineModelNetworkRequired.
  ///
  /// In en, this message translates to:
  /// **'Network connection required to download the model'**
  String get offlineModelNetworkRequired;

  /// No description provided for @offlineModelWifiOnly.
  ///
  /// In en, this message translates to:
  /// **'Download over Wi-Fi only'**
  String get offlineModelWifiOnly;

  /// No description provided for @offlineModelAllowMobileData.
  ///
  /// In en, this message translates to:
  /// **'Allow cellular data download'**
  String get offlineModelAllowMobileData;

  /// No description provided for @offlineModelMobileDataWarning.
  ///
  /// In en, this message translates to:
  /// **'Downloading ~2.6 GB over mobile data may incur carrier charges or consume data limits.'**
  String get offlineModelMobileDataWarning;

  /// No description provided for @offlineModelCancelDownload.
  ///
  /// In en, this message translates to:
  /// **'Cancel Download'**
  String get offlineModelCancelDownload;

  /// No description provided for @offlineModelRetryDownload.
  ///
  /// In en, this message translates to:
  /// **'Retry Download'**
  String get offlineModelRetryDownload;

  /// No description provided for @offlineModelActivate.
  ///
  /// In en, this message translates to:
  /// **'Activate Offline AI'**
  String get offlineModelActivate;

  /// No description provided for @offlineModelDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete Model'**
  String get offlineModelDelete;

  /// No description provided for @offlineModelDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Gemma 4 E2B?'**
  String get offlineModelDeleteTitle;

  /// No description provided for @offlineModelDeleteConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Offline AI will no longer be available until the model is downloaded again. Reports and saved photos will not be deleted.'**
  String get offlineModelDeleteConfirmation;

  /// No description provided for @offlineModelDeleted.
  ///
  /// In en, this message translates to:
  /// **'Offline model deleted from storage'**
  String get offlineModelDeleted;

  /// No description provided for @offlineModelPrivacyNotice.
  ///
  /// In en, this message translates to:
  /// **'Runs 100% locally on your phone. No track photos or inspection notes leave your device when using offline Gemma.'**
  String get offlineModelPrivacyNotice;

  /// No description provided for @offlineModelOfflineNotice.
  ///
  /// In en, this message translates to:
  /// **'Once downloaded, offline Gemma functions with zero mobile connectivity along deep forest track sections.'**
  String get offlineModelOfflineNotice;

  /// No description provided for @offlineModelReportsRemainSafe.
  ///
  /// In en, this message translates to:
  /// **'Saved reports, photos, and drafts will not be affected by model deletion.'**
  String get offlineModelReportsRemainSafe;

  /// No description provided for @offlineModelUseManualFallback.
  ///
  /// In en, this message translates to:
  /// **'Use manual classification if model is unavailable.'**
  String get offlineModelUseManualFallback;

  /// No description provided for @offlineModelDownloadInProgress.
  ///
  /// In en, this message translates to:
  /// **'Model download is currently in progress. Please do not close the app.'**
  String get offlineModelDownloadInProgress;

  /// No description provided for @offlineModelAlreadyDownloading.
  ///
  /// In en, this message translates to:
  /// **'A download is already in progress.'**
  String get offlineModelAlreadyDownloading;

  /// No description provided for @offlineModelCorrupted.
  ///
  /// In en, this message translates to:
  /// **'Model files appear damaged. Please re-download the model.'**
  String get offlineModelCorrupted;

  /// No description provided for @offlineModelVersion.
  ///
  /// In en, this message translates to:
  /// **'Version: {version}'**
  String offlineModelVersion(String version);

  /// No description provided for @offlineModelDownloadedAt.
  ///
  /// In en, this message translates to:
  /// **'Downloaded: {date}'**
  String offlineModelDownloadedAt(String date);

  /// No description provided for @offlineModelDownloadCancelled.
  ///
  /// In en, this message translates to:
  /// **'Model download was cancelled.'**
  String get offlineModelDownloadCancelled;

  /// No description provided for @locationAccuracyPromptTitle.
  ///
  /// In en, this message translates to:
  /// **'Improve Location Accuracy'**
  String get locationAccuracyPromptTitle;

  /// No description provided for @locationAccuracyPromptMessage.
  ///
  /// In en, this message translates to:
  /// **'TrackGuard works best when your device provides precise location information.'**
  String get locationAccuracyPromptMessage;

  /// No description provided for @locationAccuracyPromptSettingsHeading.
  ///
  /// In en, this message translates to:
  /// **'Check your location settings:'**
  String get locationAccuracyPromptSettingsHeading;

  /// No description provided for @locationAccuracyPromptDeviceLocation.
  ///
  /// In en, this message translates to:
  /// **'1. Turn on Device Location.'**
  String get locationAccuracyPromptDeviceLocation;

  /// No description provided for @locationAccuracyPromptLocationAccuracy.
  ///
  /// In en, this message translates to:
  /// **'2. Enable Google Location Accuracy, if available.'**
  String get locationAccuracyPromptLocationAccuracy;

  /// No description provided for @locationAccuracyPromptExplanation.
  ///
  /// In en, this message translates to:
  /// **'This helps TrackGuard capture more accurate locations when reporting hazards.'**
  String get locationAccuracyPromptExplanation;

  /// No description provided for @locationAccuracyPromptManageSettingsOr.
  ///
  /// In en, this message translates to:
  /// **'You can manage these settings in your device\'s Location settings.'**
  String get locationAccuracyPromptManageSettingsOr;

  /// No description provided for @locationAccuracyPromptNoThanks.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get locationAccuracyPromptNoThanks;

  /// No description provided for @locationAccuracyPromptTurnOn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get locationAccuracyPromptTurnOn;

  /// No description provided for @reportTrackHazardDescription.
  ///
  /// In en, this message translates to:
  /// **'Take a photo of a slip, rockfall, drain, or track issue'**
  String get reportTrackHazardDescription;

  /// No description provided for @sendNow.
  ///
  /// In en, this message translates to:
  /// **'Send Now'**
  String get sendNow;

  /// No description provided for @viewMyReports.
  ///
  /// In en, this message translates to:
  /// **'View My Reports'**
  String get viewMyReports;

  /// No description provided for @willSendAtNextStation.
  ///
  /// In en, this message translates to:
  /// **'Will send automatically at next station signal'**
  String get willSendAtNextStation;

  /// No description provided for @allReportsSentToSupervisor.
  ///
  /// In en, this message translates to:
  /// **'Your latest reports have reached the supervisor.'**
  String get allReportsSentToSupervisor;

  /// No description provided for @gpsLockedStatus.
  ///
  /// In en, this message translates to:
  /// **'GPS locked'**
  String get gpsLockedStatus;

  /// No description provided for @setManually.
  ///
  /// In en, this message translates to:
  /// **'Set manually'**
  String get setManually;

  /// No description provided for @startingCamera.
  ///
  /// In en, this message translates to:
  /// **'Starting camera…'**
  String get startingCamera;

  /// No description provided for @retryCamera.
  ///
  /// In en, this message translates to:
  /// **'Retry Camera'**
  String get retryCamera;

  /// No description provided for @dhrAlignment.
  ///
  /// In en, this message translates to:
  /// **'DHR alignment'**
  String get dhrAlignment;

  /// No description provided for @savesSafelyOnPhoneFirst.
  ///
  /// In en, this message translates to:
  /// **'Saves safely on your phone first.'**
  String get savesSafelyOnPhoneFirst;

  /// No description provided for @draftMissing.
  ///
  /// In en, this message translates to:
  /// **'Draft Missing'**
  String get draftMissing;

  /// No description provided for @inspectionDraftCouldNotBeLoaded.
  ///
  /// In en, this message translates to:
  /// **'Inspection draft could not be loaded.'**
  String get inspectionDraftCouldNotBeLoaded;

  /// No description provided for @statusStepSent.
  ///
  /// In en, this message translates to:
  /// **'Sent'**
  String get statusStepSent;

  /// No description provided for @statusStepSeenBySupervisor.
  ///
  /// In en, this message translates to:
  /// **'Seen by Supervisor'**
  String get statusStepSeenBySupervisor;

  /// No description provided for @statusStepResolved.
  ///
  /// In en, this message translates to:
  /// **'Resolved'**
  String get statusStepResolved;

  /// No description provided for @technicalAndAiAuditDetails.
  ///
  /// In en, this message translates to:
  /// **'Technical & AI Audit Details'**
  String get technicalAndAiAuditDetails;

  /// No description provided for @reportAuditInformation.
  ///
  /// In en, this message translates to:
  /// **'REPORT AUDIT INFORMATION'**
  String get reportAuditInformation;

  /// No description provided for @noPhotoAttached.
  ///
  /// In en, this message translates to:
  /// **'No Photo Attached'**
  String get noPhotoAttached;

  /// No description provided for @photoNotFoundOnDevice.
  ///
  /// In en, this message translates to:
  /// **'Photo not found on device'**
  String get photoNotFoundOnDevice;

  /// No description provided for @reportSource.
  ///
  /// In en, this message translates to:
  /// **'Source: {source} {accuracy}'**
  String reportSource(String source, String accuracy);

  /// No description provided for @reportIdLabel.
  ///
  /// In en, this message translates to:
  /// **'Report ID: {id}'**
  String reportIdLabel(String id);

  /// No description provided for @nearestWaypointBadge.
  ///
  /// In en, this message translates to:
  /// **'Nearest'**
  String get nearestWaypointBadge;

  /// No description provided for @allDhrAlignment.
  ///
  /// In en, this message translates to:
  /// **'All DHR Alignment'**
  String get allDhrAlignment;

  /// No description provided for @profileIdentifier.
  ///
  /// In en, this message translates to:
  /// **'Profile Identifier'**
  String get profileIdentifier;

  /// No description provided for @appAlignmentTitle.
  ///
  /// In en, this message translates to:
  /// **'TrackGuard DHR Alignment'**
  String get appAlignmentTitle;

  /// No description provided for @appEditionVersion.
  ///
  /// In en, this message translates to:
  /// **'Version 1.0.0 • Field Operations Edition'**
  String get appEditionVersion;

  /// No description provided for @adminDashboardTitle.
  ///
  /// In en, this message translates to:
  /// **'TrackGuard Admin'**
  String get adminDashboardTitle;

  /// No description provided for @adminOverviewTab.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get adminOverviewTab;

  /// No description provided for @adminReportsTab.
  ///
  /// In en, this message translates to:
  /// **'Reports'**
  String get adminReportsTab;

  /// No description provided for @adminUsersTab.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get adminUsersTab;

  /// No description provided for @adminReportOverview.
  ///
  /// In en, this message translates to:
  /// **'REPORT OVERVIEW'**
  String get adminReportOverview;

  /// No description provided for @adminSectionSummary.
  ///
  /// In en, this message translates to:
  /// **'SECTION SUMMARY'**
  String get adminSectionSummary;

  /// No description provided for @adminLatestReports.
  ///
  /// In en, this message translates to:
  /// **'LATEST REPORTS'**
  String get adminLatestReports;

  /// No description provided for @adminTotalReports.
  ///
  /// In en, this message translates to:
  /// **'Total reports'**
  String get adminTotalReports;

  /// No description provided for @adminNoRemoteReportsFound.
  ///
  /// In en, this message translates to:
  /// **'No remote reports found.'**
  String get adminNoRemoteReportsFound;

  /// No description provided for @adminNoProfilesFound.
  ///
  /// In en, this message translates to:
  /// **'No profiles found.'**
  String get adminNoProfilesFound;

  /// No description provided for @adminProfileUpdated.
  ///
  /// In en, this message translates to:
  /// **'Profile updated'**
  String get adminProfileUpdated;

  /// No description provided for @adminUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Update failed: {error}'**
  String adminUpdateFailed(String error);

  /// No description provided for @adminRoleLabel.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get adminRoleLabel;

  /// No description provided for @adminAssignedSection.
  ///
  /// In en, this message translates to:
  /// **'Assigned section'**
  String get adminAssignedSection;

  /// No description provided for @adminStatusUpdated.
  ///
  /// In en, this message translates to:
  /// **'Status updated. Check audit history below.'**
  String get adminStatusUpdated;

  /// No description provided for @adminStatusUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Status update failed: {error}'**
  String adminStatusUpdateFailed(String error);

  /// No description provided for @adminReportDetailTitle.
  ///
  /// In en, this message translates to:
  /// **'Admin report detail'**
  String get adminReportDetailTitle;

  /// No description provided for @adminReportNotFound.
  ///
  /// In en, this message translates to:
  /// **'Report not found or access denied.'**
  String get adminReportNotFound;

  /// No description provided for @adminSeverityLabel.
  ///
  /// In en, this message translates to:
  /// **'Severity: {severity}'**
  String adminSeverityLabel(String severity);

  /// No description provided for @adminSectionLabel.
  ///
  /// In en, this message translates to:
  /// **'Section: {section}'**
  String adminSectionLabel(String section);

  /// No description provided for @adminStationLabel.
  ///
  /// In en, this message translates to:
  /// **'Station: {station}'**
  String adminStationLabel(String station);

  /// No description provided for @adminKmMarkerLabel.
  ///
  /// In en, this message translates to:
  /// **'Km marker: {km}'**
  String adminKmMarkerLabel(String km);

  /// No description provided for @adminCreatedLabel.
  ///
  /// In en, this message translates to:
  /// **'Created: {created}'**
  String adminCreatedLabel(String created);

  /// No description provided for @adminGpsLabel.
  ///
  /// In en, this message translates to:
  /// **'GPS: {lat}, {lng}'**
  String adminGpsLabel(String lat, String lng);

  /// No description provided for @adminUpdateStatusHeading.
  ///
  /// In en, this message translates to:
  /// **'UPDATE STATUS'**
  String get adminUpdateStatusHeading;

  /// No description provided for @adminInspectionStatusLabel.
  ///
  /// In en, this message translates to:
  /// **'Inspection status'**
  String get adminInspectionStatusLabel;

  /// No description provided for @adminSaveStatusButton.
  ///
  /// In en, this message translates to:
  /// **'Save status'**
  String get adminSaveStatusButton;

  /// No description provided for @adminSavingStatus.
  ///
  /// In en, this message translates to:
  /// **'Saving…'**
  String get adminSavingStatus;

  /// No description provided for @adminAuditHistoryHeading.
  ///
  /// In en, this message translates to:
  /// **'AUDIT HISTORY'**
  String get adminAuditHistoryHeading;

  /// No description provided for @adminCouldNotLoadHistory.
  ///
  /// In en, this message translates to:
  /// **'Could not load history: {error}'**
  String adminCouldNotLoadHistory(String error);

  /// No description provided for @adminNoStatusChangesYet.
  ///
  /// In en, this message translates to:
  /// **'No status changes recorded yet.'**
  String get adminNoStatusChangesYet;

  /// No description provided for @adminLoadingPhoto.
  ///
  /// In en, this message translates to:
  /// **'Loading inspection photo...'**
  String get adminLoadingPhoto;

  /// No description provided for @adminNoPhotoAvailable.
  ///
  /// In en, this message translates to:
  /// **'No inspection photo available for this report'**
  String get adminNoPhotoAvailable;

  /// No description provided for @adminFailedToLoadImage.
  ///
  /// In en, this message translates to:
  /// **'Failed to load image from storage'**
  String get adminFailedToLoadImage;

  /// No description provided for @adminTapToEnlarge.
  ///
  /// In en, this message translates to:
  /// **'Tap to enlarge'**
  String get adminTapToEnlarge;

  /// No description provided for @adminInspectionPhotoBadge.
  ///
  /// In en, this message translates to:
  /// **'INSPECTION PHOTO'**
  String get adminInspectionPhotoBadge;

  /// No description provided for @adminHazardPhotoTitle.
  ///
  /// In en, this message translates to:
  /// **'Hazard Photo'**
  String get adminHazardPhotoTitle;

  /// No description provided for @adminFailedToLoadFullImage.
  ///
  /// In en, this message translates to:
  /// **'Failed to load full image'**
  String get adminFailedToLoadFullImage;

  /// No description provided for @adminNotSpecified.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get adminNotSpecified;

  /// No description provided for @adminActiveStatus.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE'**
  String get adminActiveStatus;

  /// No description provided for @adminInactiveStatus.
  ///
  /// In en, this message translates to:
  /// **'INACTIVE'**
  String get adminInactiveStatus;

  /// No description provided for @adminChangedBy.
  ///
  /// In en, this message translates to:
  /// **'Changed by {user}'**
  String adminChangedBy(String user);

  /// No description provided for @smartPhotoHelperTitle.
  ///
  /// In en, this message translates to:
  /// **'Smart Photo Helper'**
  String get smartPhotoHelperTitle;

  /// No description provided for @aiModeAutomaticHelper.
  ///
  /// In en, this message translates to:
  /// **'Automatic Photo Helper (Recommended)'**
  String get aiModeAutomaticHelper;

  /// No description provided for @aiModeAutomaticHelperDesc.
  ///
  /// In en, this message translates to:
  /// **'Suggests a hazard type and note from your photo, online or offline.'**
  String get aiModeAutomaticHelperDesc;

  /// No description provided for @aiModeOnlineHelper.
  ///
  /// In en, this message translates to:
  /// **'Online Photo Helper'**
  String get aiModeOnlineHelper;

  /// No description provided for @aiModeOnlineHelperDesc.
  ///
  /// In en, this message translates to:
  /// **'Use the connected online vision model; needs a network connection.'**
  String get aiModeOnlineHelperDesc;

  /// No description provided for @aiModeOfflineHelper.
  ///
  /// In en, this message translates to:
  /// **'Offline Photo Helper'**
  String get aiModeOfflineHelper;

  /// No description provided for @aiModeOfflineHelperDesc.
  ///
  /// In en, this message translates to:
  /// **'Use the downloaded Gemma model without a network connection.'**
  String get aiModeOfflineHelperDesc;

  /// No description provided for @aiModeManualOnly.
  ///
  /// In en, this message translates to:
  /// **'Manual Only'**
  String get aiModeManualOnly;

  /// No description provided for @aiModeManualOnlyDesc.
  ///
  /// In en, this message translates to:
  /// **'Turn off photo suggestions; I will choose the hazard myself.'**
  String get aiModeManualOnlyDesc;

  /// No description provided for @offlinePhotoHelperPackTitle.
  ///
  /// In en, this message translates to:
  /// **'Offline Photo Helper Pack'**
  String get offlinePhotoHelperPackTitle;

  /// No description provided for @offlinePhotoHelperPackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Download once on Wi-Fi so the app can suggest hazards from your photos when there is no mobile signal.'**
  String get offlinePhotoHelperPackSubtitle;

  /// No description provided for @downloadOnWifiButton.
  ///
  /// In en, this message translates to:
  /// **'Download on Wi-Fi'**
  String get downloadOnWifiButton;

  /// No description provided for @stayOnPage.
  ///
  /// In en, this message translates to:
  /// **'Stay on Page'**
  String get stayOnPage;

  /// No description provided for @cancelDownloadAndLeave.
  ///
  /// In en, this message translates to:
  /// **'Cancel Download & Leave'**
  String get cancelDownloadAndLeave;

  /// No description provided for @cancelDownloadConfirmation.
  ///
  /// In en, this message translates to:
  /// **'Leaving this page will cancel the current model download. Are you sure you want to cancel and leave?'**
  String get cancelDownloadConfirmation;

  /// No description provided for @downloadPreferencesHeading.
  ///
  /// In en, this message translates to:
  /// **'DOWNLOAD PREFERENCES'**
  String get downloadPreferencesHeading;

  /// No description provided for @preventsCellularUsage.
  ///
  /// In en, this message translates to:
  /// **'Prevents cellular data usage'**
  String get preventsCellularUsage;

  /// No description provided for @modelStatusAndActionsHeading.
  ///
  /// In en, this message translates to:
  /// **'MODEL STATUS & ACTIONS'**
  String get modelStatusAndActionsHeading;

  /// No description provided for @onlineReadyStatus.
  ///
  /// In en, this message translates to:
  /// **'Online Ready'**
  String get onlineReadyStatus;

  /// No description provided for @networkRequiredStatus.
  ///
  /// In en, this message translates to:
  /// **'Network Required'**
  String get networkRequiredStatus;

  /// No description provided for @installedDateLabel.
  ///
  /// In en, this message translates to:
  /// **'Installed Date'**
  String get installedDateLabel;

  /// No description provided for @sourceLabel.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get sourceLabel;

  /// No description provided for @integrationLabel.
  ///
  /// In en, this message translates to:
  /// **'Integration'**
  String get integrationLabel;

  /// No description provided for @aiInferenceError.
  ///
  /// In en, this message translates to:
  /// **'AI Inference Error'**
  String get aiInferenceError;

  /// No description provided for @aiAdvisoryMetadataHeading.
  ///
  /// In en, this message translates to:
  /// **'AI ADVISORY METADATA'**
  String get aiAdvisoryMetadataHeading;

  /// No description provided for @accountInactive.
  ///
  /// In en, this message translates to:
  /// **'Account Inactive'**
  String get accountInactive;

  /// No description provided for @permanentWayStaff.
  ///
  /// In en, this message translates to:
  /// **'Permanent-Way Staff'**
  String get permanentWayStaff;

  /// No description provided for @reportLeaveTitle.
  ///
  /// In en, this message translates to:
  /// **'Leave report?'**
  String get reportLeaveTitle;

  /// No description provided for @reportLeaveMessage.
  ///
  /// In en, this message translates to:
  /// **'You have an unfinished report. Would you like to discard it?'**
  String get reportLeaveMessage;

  /// No description provided for @reportDiscardAction.
  ///
  /// In en, this message translates to:
  /// **'Discard Report'**
  String get reportDiscardAction;

  /// No description provided for @reportKeepEditing.
  ///
  /// In en, this message translates to:
  /// **'Keep Editing'**
  String get reportKeepEditing;

  /// No description provided for @reportSaveDraft.
  ///
  /// In en, this message translates to:
  /// **'Save as Draft'**
  String get reportSaveDraft;

  /// No description provided for @reportDiscardFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not discard report. Please try again.'**
  String get reportDiscardFailed;

  /// No description provided for @reportReviewTitle.
  ///
  /// In en, this message translates to:
  /// **'Review & Confirm Report'**
  String get reportReviewTitle;

  /// No description provided for @reportSaveLocalReassurance.
  ///
  /// In en, this message translates to:
  /// **'Saves safely on your phone first.'**
  String get reportSaveLocalReassurance;

  /// No description provided for @reportConfirmSaveLocal.
  ///
  /// In en, this message translates to:
  /// **'Confirm & Save Locally'**
  String get reportConfirmSaveLocal;

  /// No description provided for @reportFieldVerification.
  ///
  /// In en, this message translates to:
  /// **'Field Verification'**
  String get reportFieldVerification;

  /// No description provided for @reportHazardClassification.
  ///
  /// In en, this message translates to:
  /// **'1. HAZARD CLASSIFICATION'**
  String get reportHazardClassification;

  /// No description provided for @reportSeverityTier.
  ///
  /// In en, this message translates to:
  /// **'2. VERIFIED SEVERITY TIER'**
  String get reportSeverityTier;

  /// No description provided for @reportKmMarkerStep.
  ///
  /// In en, this message translates to:
  /// **'3. KILOMETER MARKER'**
  String get reportKmMarkerStep;

  /// No description provided for @reportGpsAutoMatched.
  ///
  /// In en, this message translates to:
  /// **'AUTO-MATCHED GPS'**
  String get reportGpsAutoMatched;

  /// No description provided for @reportFieldNoteStep.
  ///
  /// In en, this message translates to:
  /// **'4. FIELD OBSERVATION NOTE'**
  String get reportFieldNoteStep;

  /// No description provided for @reportNoteExample.
  ///
  /// In en, this message translates to:
  /// **'e.g. Outer bolt missing, 2 sleepers loose, track clear...'**
  String get reportNoteExample;

  /// No description provided for @aiManualInput.
  ///
  /// In en, this message translates to:
  /// **'Manual Input'**
  String get aiManualInput;

  /// No description provided for @aiSwitchToManual.
  ///
  /// In en, this message translates to:
  /// **'Switch to Manual'**
  String get aiSwitchToManual;

  /// No description provided for @aiInferenceUnavailable.
  ///
  /// In en, this message translates to:
  /// **'AI Inference Unavailable'**
  String get aiInferenceUnavailable;

  /// No description provided for @searchUsersHint.
  ///
  /// In en, this message translates to:
  /// **'Search users by name or email'**
  String get searchUsersHint;

  /// No description provided for @adminInspectionStatus.
  ///
  /// In en, this message translates to:
  /// **'Inspection Status'**
  String get adminInspectionStatus;

  /// No description provided for @homeEmergencyControlRoom.
  ///
  /// In en, this message translates to:
  /// **'Emergency Control Room'**
  String get homeEmergencyControlRoom;

  /// No description provided for @homeEmergencyLinesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'DHR Permanent-Way Emergency Lines'**
  String get homeEmergencyLinesSubtitle;

  /// No description provided for @homeDhrControlOffice.
  ///
  /// In en, this message translates to:
  /// **'DHR Division Control Office'**
  String get homeDhrControlOffice;

  /// No description provided for @homeOperationsControl.
  ///
  /// In en, this message translates to:
  /// **'Kurseong / Katihar Operations Control'**
  String get homeOperationsControl;

  /// No description provided for @homeRailwaysHelpline.
  ///
  /// In en, this message translates to:
  /// **'Indian Railways Helpline'**
  String get homeRailwaysHelpline;

  /// No description provided for @homeRailwayEmergencySupport.
  ///
  /// In en, this message translates to:
  /// **'All-India Railway Emergency & Support'**
  String get homeRailwayEmergencySupport;

  /// No description provided for @homeNationalEmergency.
  ///
  /// In en, this message translates to:
  /// **'National Emergency Service'**
  String get homeNationalEmergency;

  /// No description provided for @homePoliceMedicalDisaster.
  ///
  /// In en, this message translates to:
  /// **'Police, Medical & Disaster Management'**
  String get homePoliceMedicalDisaster;

  /// No description provided for @commonClose.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get commonClose;

  /// No description provided for @authContinueGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get authContinueGoogle;

  /// No description provided for @authContinueTerms.
  ///
  /// In en, this message translates to:
  /// **'By continuing, you agree to our'**
  String get authContinueTerms;

  /// No description provided for @authPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get authPrivacyPolicy;

  /// No description provided for @authTermsConditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & Conditions'**
  String get authTermsConditions;

  /// No description provided for @navigationMenu.
  ///
  /// In en, this message translates to:
  /// **'Menu'**
  String get navigationMenu;

  /// No description provided for @reportLeaveWithDraftMessage.
  ///
  /// In en, this message translates to:
  /// **'You have a captured photo that has not been saved yet. Would you like to save it as a draft or discard it?'**
  String get reportLeaveWithDraftMessage;

  /// No description provided for @cameraGallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get cameraGallery;

  /// No description provided for @cameraSwitch.
  ///
  /// In en, this message translates to:
  /// **'Switch'**
  String get cameraSwitch;

  /// No description provided for @cameraUnavailableTitle.
  ///
  /// In en, this message translates to:
  /// **'Camera Unavailable'**
  String get cameraUnavailableTitle;

  /// No description provided for @cameraUnavailableSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please use the gallery fallback or retry the\ncamera.'**
  String get cameraUnavailableSubtitle;

  /// No description provided for @waypointUseSelectedLocation.
  ///
  /// In en, this message translates to:
  /// **'Use Selected Location'**
  String get waypointUseSelectedLocation;

  /// No description provided for @fieldVerificationRequired.
  ///
  /// In en, this message translates to:
  /// **'REQUIRED'**
  String get fieldVerificationRequired;

  /// No description provided for @adminUnnamedUser.
  ///
  /// In en, this message translates to:
  /// **'Unnamed user'**
  String get adminUnnamedUser;

  /// No description provided for @adminAssignedSectionDropdown.
  ///
  /// In en, this message translates to:
  /// **'Assigned Section'**
  String get adminAssignedSectionDropdown;

  /// No description provided for @adminAllSections.
  ///
  /// In en, this message translates to:
  /// **'All sections'**
  String get adminAllSections;

  /// No description provided for @adminGangmanNoteTitle.
  ///
  /// In en, this message translates to:
  /// **'Gangman Note'**
  String get adminGangmanNoteTitle;

  /// No description provided for @adminAiSuggestionTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Suggestion'**
  String get adminAiSuggestionTitle;

  /// No description provided for @adminAuditHistoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Audit History'**
  String get adminAuditHistoryTitle;

  /// No description provided for @adminReportDetails.
  ///
  /// In en, this message translates to:
  /// **'Report Details'**
  String get adminReportDetails;

  /// No description provided for @adminSection.
  ///
  /// In en, this message translates to:
  /// **'Section'**
  String get adminSection;

  /// No description provided for @adminStation.
  ///
  /// In en, this message translates to:
  /// **'Station'**
  String get adminStation;

  /// No description provided for @adminKmMarker.
  ///
  /// In en, this message translates to:
  /// **'Km Marker'**
  String get adminKmMarker;

  /// No description provided for @adminCreated.
  ///
  /// In en, this message translates to:
  /// **'Created'**
  String get adminCreated;

  /// No description provided for @adminGps.
  ///
  /// In en, this message translates to:
  /// **'GPS'**
  String get adminGps;

  /// No description provided for @adminReportId.
  ///
  /// In en, this message translates to:
  /// **'Report ID'**
  String get adminReportId;

  /// No description provided for @adminNotCaptured.
  ///
  /// In en, this message translates to:
  /// **'Not captured'**
  String get adminNotCaptured;

  /// No description provided for @adminNoMatchingUsers.
  ///
  /// In en, this message translates to:
  /// **'No users matching \"{query}\"'**
  String adminNoMatchingUsers(String query);

  /// No description provided for @adminNoInspectionPhoto.
  ///
  /// In en, this message translates to:
  /// **'No inspection photo for this report'**
  String get adminNoInspectionPhoto;

  /// No description provided for @adminRoleHeading.
  ///
  /// In en, this message translates to:
  /// **'Role'**
  String get adminRoleHeading;

  /// No description provided for @adminRoleOptionAdmin.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get adminRoleOptionAdmin;

  /// No description provided for @photoLoadFailedRemote.
  ///
  /// In en, this message translates to:
  /// **'Photo could not be loaded from remote server'**
  String get photoLoadFailedRemote;

  /// No description provided for @photoLoadFailedDevice.
  ///
  /// In en, this message translates to:
  /// **'Photo could not be loaded from device'**
  String get photoLoadFailedDevice;

  /// No description provided for @recentReportsTitle.
  ///
  /// In en, this message translates to:
  /// **'Recent Reports'**
  String get recentReportsTitle;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @noReportsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No reports available.'**
  String get noReportsAvailable;

  /// No description provided for @offlineModelDownloadSize.
  ///
  /// In en, this message translates to:
  /// **'Download Size'**
  String get offlineModelDownloadSize;

  /// No description provided for @offlineModelRequiredFreeSpace.
  ///
  /// In en, this message translates to:
  /// **'Required Free Space'**
  String get offlineModelRequiredFreeSpace;

  /// No description provided for @offlineModelInitFailed.
  ///
  /// In en, this message translates to:
  /// **'Initialization failed: {error}'**
  String offlineModelInitFailed(String error);

  /// No description provided for @offlineModelDownloadError.
  ///
  /// In en, this message translates to:
  /// **'Download error: {error}'**
  String offlineModelDownloadError(String error);

  /// No description provided for @offlineModelDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed to delete model: {error}'**
  String offlineModelDeleteFailed(String error);

  /// No description provided for @aiAdvisoryNoticeAction.
  ///
  /// In en, this message translates to:
  /// **'AI suggestions are advisory only. Permanent-way staff must inspect and confirm the actual hazard and required action.'**
  String get aiAdvisoryNoticeAction;

  /// No description provided for @mainNavigationHeading.
  ///
  /// In en, this message translates to:
  /// **'MAIN NAVIGATION'**
  String get mainNavigationHeading;

  /// No description provided for @homePrimaryControlBadge.
  ///
  /// In en, this message translates to:
  /// **'Primary Control'**
  String get homePrimaryControlBadge;

  /// No description provided for @homeTollFreeBadge.
  ///
  /// In en, this message translates to:
  /// **'Toll-Free'**
  String get homeTollFreeBadge;

  /// No description provided for @homeEmergencyBadge.
  ///
  /// In en, this message translates to:
  /// **'Emergency'**
  String get homeEmergencyBadge;

  /// No description provided for @filterAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get filterAll;

  /// No description provided for @filterPending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get filterPending;

  /// No description provided for @filterFailed.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get filterFailed;

  /// No description provided for @filterSynced.
  ///
  /// In en, this message translates to:
  /// **'Synced'**
  String get filterSynced;

  /// No description provided for @hazardTitleTrackDefectRailGap.
  ///
  /// In en, this message translates to:
  /// **'Track Defect / Rail Gap'**
  String get hazardTitleTrackDefectRailGap;

  /// No description provided for @hazardTitleDamagedWall.
  ///
  /// In en, this message translates to:
  /// **'Damaged Retaining Wall'**
  String get hazardTitleDamagedWall;

  /// No description provided for @hazardTitleRockfall.
  ///
  /// In en, this message translates to:
  /// **'Rockfall / Fallen Debris'**
  String get hazardTitleRockfall;

  /// No description provided for @hazardTitleLandslip.
  ///
  /// In en, this message translates to:
  /// **'Landslip / Mudslide'**
  String get hazardTitleLandslip;

  /// No description provided for @hazardTitleBlockedDrain.
  ///
  /// In en, this message translates to:
  /// **'Blocked Catchwater Drain'**
  String get hazardTitleBlockedDrain;

  /// No description provided for @hazardTitleVegetation.
  ///
  /// In en, this message translates to:
  /// **'Vegetation'**
  String get hazardTitleVegetation;

  /// No description provided for @hazardTitleOther.
  ///
  /// In en, this message translates to:
  /// **'Track Issue / Other Hazard'**
  String get hazardTitleOther;

  /// No description provided for @kmUnit.
  ///
  /// In en, this message translates to:
  /// **'Km'**
  String get kmUnit;

  /// No description provided for @stationLabel.
  ///
  /// In en, this message translates to:
  /// **'Station'**
  String get stationLabel;

  /// No description provided for @modelNameLabel.
  ///
  /// In en, this message translates to:
  /// **'Model Name'**
  String get modelNameLabel;

  /// No description provided for @modelNotReady.
  ///
  /// In en, this message translates to:
  /// **'Not Ready'**
  String get modelNotReady;

  /// No description provided for @modelReady.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get modelReady;

  /// No description provided for @modelChecking.
  ///
  /// In en, this message translates to:
  /// **'Checking'**
  String get modelChecking;

  /// No description provided for @modelActivating.
  ///
  /// In en, this message translates to:
  /// **'Activating'**
  String get modelActivating;

  /// No description provided for @modelCorruptedLabel.
  ///
  /// In en, this message translates to:
  /// **'Corrupted'**
  String get modelCorruptedLabel;

  /// No description provided for @modelFailedLabel.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get modelFailedLabel;

  /// No description provided for @reportStatusTitle.
  ///
  /// In en, this message translates to:
  /// **'Report Status'**
  String get reportStatusTitle;

  /// No description provided for @locationTrackAlignmentTitle.
  ///
  /// In en, this message translates to:
  /// **'Location & Track Alignment'**
  String get locationTrackAlignmentTitle;

  /// No description provided for @assignedSectionLabel.
  ///
  /// In en, this message translates to:
  /// **'Assigned Section'**
  String get assignedSectionLabel;

  /// No description provided for @sourceGpsLabel.
  ///
  /// In en, this message translates to:
  /// **'Source: GPS'**
  String get sourceGpsLabel;

  /// No description provided for @technicalAiAuditDetails.
  ///
  /// In en, this message translates to:
  /// **'Technical & AI Audit Details'**
  String get technicalAiAuditDetails;

  /// No description provided for @aiProviderValue.
  ///
  /// In en, this message translates to:
  /// **'AI Provider'**
  String get aiProviderValue;

  /// No description provided for @aiModelValue.
  ///
  /// In en, this message translates to:
  /// **'AI Model'**
  String get aiModelValue;

  /// No description provided for @aiLanguageValue.
  ///
  /// In en, this message translates to:
  /// **'AI Language'**
  String get aiLanguageValue;

  /// No description provided for @confidenceLabel.
  ///
  /// In en, this message translates to:
  /// **'Confidence'**
  String get confidenceLabel;

  /// No description provided for @auditOriginalSubmission.
  ///
  /// In en, this message translates to:
  /// **'Audit: Original submission (Unmodified)'**
  String get auditOriginalSubmission;

  /// No description provided for @reportIdValue.
  ///
  /// In en, this message translates to:
  /// **'Report ID: {id}'**
  String reportIdValue(String id);

  /// No description provided for @sourceGangmanMobile.
  ///
  /// In en, this message translates to:
  /// **'Source: Gangman Mobile Unit ({source})'**
  String sourceGangmanMobile(String source);

  /// No description provided for @selectNearestWaypoint.
  ///
  /// In en, this message translates to:
  /// **'Select Nearest DHR Station / Waypoint'**
  String get selectNearestWaypoint;

  /// No description provided for @nearest.
  ///
  /// In en, this message translates to:
  /// **'Nearest'**
  String get nearest;

  /// No description provided for @homeTrackObstruction.
  ///
  /// In en, this message translates to:
  /// **'Track Obstruction'**
  String get homeTrackObstruction;

  /// No description provided for @homeTrackDamage.
  ///
  /// In en, this message translates to:
  /// **'Track Damage'**
  String get homeTrackDamage;

  /// No description provided for @homeLandslideRockfall.
  ///
  /// In en, this message translates to:
  /// **'Landslide / Rockfall'**
  String get homeLandslideRockfall;

  /// No description provided for @homeBlockedDrain.
  ///
  /// In en, this message translates to:
  /// **'Blocked Drain'**
  String get homeBlockedDrain;

  /// No description provided for @homeDamagedWall.
  ///
  /// In en, this message translates to:
  /// **'Damaged Wall'**
  String get homeDamagedWall;

  /// No description provided for @homeAlignmentHazard.
  ///
  /// In en, this message translates to:
  /// **'Alignment Hazard'**
  String get homeAlignmentHazard;

  /// No description provided for @emergencyHelpline.
  ///
  /// In en, this message translates to:
  /// **'Helpline'**
  String get emergencyHelpline;

  /// No description provided for @activeStatus.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get activeStatus;

  /// No description provided for @inactiveStatus.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get inactiveStatus;

  /// No description provided for @hazardPhotoTitle.
  ///
  /// In en, this message translates to:
  /// **'{hazard} Photo'**
  String hazardPhotoTitle(String hazard);

  /// No description provided for @syncQueuedAtStation.
  ///
  /// In en, this message translates to:
  /// **'Queued locally for automatic sync at next station.'**
  String get syncQueuedAtStation;

  /// No description provided for @syncVerifiedCurrent.
  ///
  /// In en, this message translates to:
  /// **'Cloud sync verified • Up to date with server'**
  String get syncVerifiedCurrent;

  /// No description provided for @syncFailedRetry.
  ///
  /// In en, this message translates to:
  /// **'Sync failed. Tap to retry.'**
  String get syncFailedRetry;

  /// No description provided for @syncErrorValue.
  ///
  /// In en, this message translates to:
  /// **'Error: {error}'**
  String syncErrorValue(String error);

  /// No description provided for @syncPendingCloudAtStation.
  ///
  /// In en, this message translates to:
  /// **'Pending cloud sync at next station'**
  String get syncPendingCloudAtStation;

  /// No description provided for @offlineModelReadyDescription.
  ///
  /// In en, this message translates to:
  /// **'On-device AI is active. You can inspect tracks and get hazard suggestions without an internet connection.'**
  String get offlineModelReadyDescription;

  /// No description provided for @offlineModelDownloadedDescription.
  ///
  /// In en, this message translates to:
  /// **'Model files are downloaded on this phone. Tap below to activate offline photo analysis.'**
  String get offlineModelDownloadedDescription;

  /// No description provided for @offlineModelDownloadingDescription.
  ///
  /// In en, this message translates to:
  /// **'Downloading offline AI files. Please keep the app open until download completes.'**
  String get offlineModelDownloadingDescription;

  /// No description provided for @offlineModelActivatingDescription.
  ///
  /// In en, this message translates to:
  /// **'Activating offline model... this will take a moment.'**
  String get offlineModelActivatingDescription;

  /// No description provided for @offlineModelFailedDescription.
  ///
  /// In en, this message translates to:
  /// **'Download failed. Please check your connection and tap retry below.'**
  String get offlineModelFailedDescription;

  /// No description provided for @offlineModelCorruptedDescription.
  ///
  /// In en, this message translates to:
  /// **'Model files appear corrupted. Please delete and re-download.'**
  String get offlineModelCorruptedDescription;

  /// No description provided for @offlineModelCheckingDescription.
  ///
  /// In en, this message translates to:
  /// **'Checking model status...'**
  String get offlineModelCheckingDescription;

  /// No description provided for @offlineModelNotDownloadedDescription.
  ///
  /// In en, this message translates to:
  /// **'Download the offline model (~1.2 GB) once to enable track defect suggestions without network coverage.'**
  String get offlineModelNotDownloadedDescription;

  /// No description provided for @statusOpenShort.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get statusOpenShort;

  /// No description provided for @statusInspectShort.
  ///
  /// In en, this message translates to:
  /// **'Inspect'**
  String get statusInspectShort;

  /// No description provided for @severityLowShort.
  ///
  /// In en, this message translates to:
  /// **'Low'**
  String get severityLowShort;

  /// No description provided for @severityMediumShort.
  ///
  /// In en, this message translates to:
  /// **'Medium'**
  String get severityMediumShort;

  /// No description provided for @severityHighShort.
  ///
  /// In en, this message translates to:
  /// **'High'**
  String get severityHighShort;

  /// No description provided for @severityCriticalShort.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get severityCriticalShort;

  /// No description provided for @networkErrorLabel.
  ///
  /// In en, this message translates to:
  /// **'Network error'**
  String get networkErrorLabel;

  /// No description provided for @selectorHazardSlip.
  ///
  /// In en, this message translates to:
  /// **'Landslide /\nSlip'**
  String get selectorHazardSlip;

  /// No description provided for @selectorHazardRockfall.
  ///
  /// In en, this message translates to:
  /// **'Boulder /\nRockfall'**
  String get selectorHazardRockfall;

  /// No description provided for @selectorHazardDrain.
  ///
  /// In en, this message translates to:
  /// **'Blocked\nDrain'**
  String get selectorHazardDrain;

  /// No description provided for @selectorHazardWall.
  ///
  /// In en, this message translates to:
  /// **'Retaining\nWall'**
  String get selectorHazardWall;

  /// No description provided for @selectorHazardTrack.
  ///
  /// In en, this message translates to:
  /// **'Track Defect /\nJoint'**
  String get selectorHazardTrack;

  /// No description provided for @selectorHazardVegetation.
  ///
  /// In en, this message translates to:
  /// **'Vegetation\nOvergrowth'**
  String get selectorHazardVegetation;

  /// No description provided for @selectorHazardOther.
  ///
  /// In en, this message translates to:
  /// **'Other Defect / Hazard'**
  String get selectorHazardOther;

  /// No description provided for @severityMonitor.
  ///
  /// In en, this message translates to:
  /// **'Monitor'**
  String get severityMonitor;

  /// No description provided for @severityMaintain.
  ///
  /// In en, this message translates to:
  /// **'Maintain'**
  String get severityMaintain;

  /// No description provided for @severityUrgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent'**
  String get severityUrgent;

  /// No description provided for @severityTierCritical.
  ///
  /// In en, this message translates to:
  /// **'Critical'**
  String get severityTierCritical;

  /// No description provided for @lastModifiedValue.
  ///
  /// In en, this message translates to:
  /// **'Last Modified: {date}'**
  String lastModifiedValue(Object date);

  /// No description provided for @homeReportProblem.
  ///
  /// In en, this message translates to:
  /// **'Report a Problem'**
  String get homeReportProblem;

  /// No description provided for @homeReportProblemDescription.
  ///
  /// In en, this message translates to:
  /// **'Take a photo and tell us\nwhat is wrong on the track.'**
  String get homeReportProblemDescription;

  /// No description provided for @syncStatusSemantic.
  ///
  /// In en, this message translates to:
  /// **'Sync Status: {status}'**
  String syncStatusSemantic(Object status);

  /// No description provided for @adminLoadReportsFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load reports: {error}'**
  String adminLoadReportsFailed(String error);

  /// No description provided for @adminLoadUsersFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load users: {error}'**
  String adminLoadUsersFailed(String error);

  /// No description provided for @adminLoadReportFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not load report: {error}'**
  String adminLoadReportFailed(String error);

  /// No description provided for @statusInitial.
  ///
  /// In en, this message translates to:
  /// **'Initial'**
  String get statusInitial;

  /// No description provided for @offlineShortStatus.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offlineShortStatus;

  /// No description provided for @profileAccountDetails.
  ///
  /// In en, this message translates to:
  /// **'Account Details'**
  String get profileAccountDetails;

  /// No description provided for @adminProfileUpdateFailed.
  ///
  /// In en, this message translates to:
  /// **'Update failed: {error}'**
  String adminProfileUpdateFailed(String error);

  /// No description provided for @adminStatusUpdateFailedToast.
  ///
  /// In en, this message translates to:
  /// **'Status update failed: {error}'**
  String adminStatusUpdateFailedToast(String error);

  /// No description provided for @offlineModelTitle.
  ///
  /// In en, this message translates to:
  /// **'Offline Model'**
  String get offlineModelTitle;

  /// No description provided for @aiProviderHeuristicShort.
  ///
  /// In en, this message translates to:
  /// **'Heuristic'**
  String get aiProviderHeuristicShort;

  /// No description provided for @aiRetryAnalysisLabel.
  ///
  /// In en, this message translates to:
  /// **'Retry AI Analysis'**
  String get aiRetryAnalysisLabel;

  /// No description provided for @heuristicModelName.
  ///
  /// In en, this message translates to:
  /// **'Rule-based Heuristics'**
  String get heuristicModelName;

  /// No description provided for @aiProviderHeuristicDisplay.
  ///
  /// In en, this message translates to:
  /// **'Heuristic Fallback'**
  String get aiProviderHeuristicDisplay;

  /// No description provided for @aiProviderManualDisplay.
  ///
  /// In en, this message translates to:
  /// **'Manual Inspection'**
  String get aiProviderManualDisplay;

  /// No description provided for @supervisorName.
  ///
  /// In en, this message translates to:
  /// **'Supervisor'**
  String get supervisorName;

  /// No description provided for @syncPendingShort.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get syncPendingShort;

  /// No description provided for @syncFailedShort.
  ///
  /// In en, this message translates to:
  /// **'Failed'**
  String get syncFailedShort;

  /// No description provided for @syncSyncedShort.
  ///
  /// In en, this message translates to:
  /// **'Synced'**
  String get syncSyncedShort;

  /// No description provided for @syncDraftShort.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get syncDraftShort;

  /// No description provided for @syncRetryAttempts.
  ///
  /// In en, this message translates to:
  /// **'Retry attempts: {count}'**
  String syncRetryAttempts(int count);

  /// No description provided for @syncReferenceCode.
  ///
  /// In en, this message translates to:
  /// **'Ref: {code}'**
  String syncReferenceCode(String code);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bn', 'en', 'hi', 'ne'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn':
      return AppLocalizationsBn();
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'ne':
      return AppLocalizationsNe();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
