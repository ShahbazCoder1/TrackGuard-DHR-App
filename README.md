# TrackGuard DHR

![TrackGuard DHR app icon](android/app/src/main/res/drawable-xxxhdpi/splash_icon.png)

[![Flutter](https://img.shields.io/badge/Flutter-mobile-02569B?logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.13.7%2B-0175C2?logo=dart&logoColor=white)](https://dart.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Languages](https://img.shields.io/badge/Languages-English%20%7C%20Hindi%20%7C%20Bengali%20%7C%20Nepali-7A4E9D)](#localization)

TrackGuard DHR is an offline-first railway inspection and hazard-reporting application designed for field staff working along the Darjeeling Himalayan Railway.

The application helps field workers capture railway hazards with photographs, location data, kilometre markers, severity, and notes. Reports can be created without internet connectivity, reviewed on the device, analyzed with optional AI assistance, and synchronized with supervisors when connectivity becomes available.

## Problem

Railway inspection teams may work in mountainous and remote areas where mobile connectivity is unreliable. Hazard reports can be delayed, incomplete, or difficult to track when field observations depend on paper-based processes or continuous internet access.

TrackGuard DHR addresses this by providing:

- Offline-first report capture
- Structured railway hazard reporting
- Location and waypoint identification
- Optional AI-assisted hazard analysis
- Local report storage and later synchronization
- Supervisor and administrator review workflows
- Multilingual support for field users

## Core workflow

```text
Observe hazard
     ↓
Capture photo and location
     ↓
Select or confirm station and railway section
     ↓
Add hazard type, severity, and notes
     ↓
Receive optional AI assistance
     ↓
Review and confirm the report
     ↓
Save locally or synchronize when online
     ↓
Supervisor reviews and tracks action
```

## Features

### Offline-first reporting

- Capture reports without an active internet connection.
- Store reports and drafts locally on the device.
- Continue field work in remote areas.
- Synchronize reports when connectivity returns.
- Display report synchronization states such as draft, pending, syncing, synced, failed, and conflict.

### Railway location capture

- Capture GPS coordinates.
- Identify the nearest DHR waypoint or station.
- Estimate the relevant railway section.
- Record kilometre markers.
- Preserve stable station and section identifiers while displaying localized names.

### Hazard reporting

Reports can include:

- Inspection photographs
- Hazard category
- Severity level
- Location and railway section
- Kilometre marker
- Field notes
- Location source
- AI provider and model metadata, when available
- Synchronization status

Supported hazard categories include:

- Landslips
- Rockfalls
- Blocked drains
- Damaged retaining walls
- Track defects
- Vegetation and overgrowth
- Other hazards

Supported severity levels include:

- Low
- Medium
- High
- Critical

### AI-assisted inspection

The application can provide optional AI assistance through:

- Offline Gemma 4 E2B inference using LiteRT-LM
- Configured online vision AI through OpenRouter
- Manual classification when AI is unavailable

AI may suggest:

- Hazard category
- Observation
- Severity
- Inspection notes

AI output is advisory. The field worker or supervisor remains responsible for reviewing and confirming the final report.

### Supervisor and administrator review

Administrators can:

- Review submitted reports
- Filter reports by status
- Inspect report details
- Review hazard and severity information
- View location and AI metadata
- Manage user access
- Assign railway sections
- Review audit information
- Monitor report activity

### Authentication and roles

The application supports Google authentication through Supabase.

Supported user roles include:

- **Gangman / Field Staff** — capture, review, and submit railway inspection reports.
- **Administrator / Supervisor** — review reports, manage users, assign sections, and monitor inspection activity.

### Multilingual interface

The application supports:

- English
- Hindi
- Bengali
- Nepali

Static interface text and dynamic railway display values such as station names, section names, statuses, hazards, severity, and AI language metadata are localized through Flutter ARB resources.

## Technology stack

- Flutter
- Dart
- Riverpod
- GoRouter
- Material 3
- SQLite and Sqflite
- Supabase Authentication
- Supabase database and storage
- Connectivity Plus
- Geolocator
- Camera
- Image Picker
- LiteRT-LM
- Gemma 4 E2B
- OpenRouter
- Flutter localization with ARB files

## Project structure

```text
lib/
  app/
    app.dart
    router.dart
    theme.dart

  core/
    config/
    constants/
    connectivity/
    errors/
    localization/
    permissions/
    storage/
    supabase/
    sync/
    utils/

  features/
    admin_dashboard/
    ai/
    auth/
    home/
    profile/
    report_capture/
    report_detail/
    report_queue/
    report_review/
    reports/

  l10n/
    app_en.arb
    app_hi.arb
    app_bn.arb
    app_ne.arb
    generated localization files

  shared/
    models/
    widgets/

assets/
  branding/

android/
ios/

test/
```

## Requirements

- Flutter SDK
- Dart SDK 3.13.7 or later
- Android Studio and Android SDK for Android development
- Xcode for iOS development on macOS
- A configured Supabase project for authentication and synchronization
- Optional OpenRouter configuration for online AI
- A compatible device or emulator

## Getting started

### 1. Clone the repository

```bash
git clone https://github.com/ShahbazCoder1/TrackGuard-DHR-App.git
cd TrackGuard-DHR-App
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Create the environment file

PowerShell:

```powershell
Copy-Item .env.example .env
```

macOS or Linux:

```bash
cp .env.example .env
```

### 4. Configure environment variables

Update `.env`:

```dotenv
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-supabase-publishable-key

OPENROUTER_API_KEY=your-openrouter-api-key
OPENROUTER_MODEL=nvidia/nemotron-3.5-super-vl:free
```

Supabase configuration enables authentication and online synchronization.

OpenRouter configuration is optional. Offline reporting and manual hazard classification do not require OpenRouter.

Do not commit `.env` or private credentials to the repository.

> A key included in a mobile application should not be treated as a server-side secret. Production deployments should route privileged or paid AI requests through a secure backend.

### 5. Configure Google authentication

Configure Google OAuth in Supabase and add the required platform redirect settings.

The Android callback used by the application is:

```text
io.supabase.trackguard://login-callback/
```

### 6. Run the application

```bash
flutter run
```

## Offline AI model

The application supports offline AI through LiteRT-LM and Gemma 4 E2B.

The offline model can be downloaded and managed from the AI settings screen. Model initialization is deferred so the application can display its interface quickly without blocking the first Flutter frame.

Offline AI requires:

- A compatible Android device
- Sufficient storage for the model
- Sufficient available memory
- A successful model download and initialization

If the offline model is unavailable, the application can fall back to online AI, manual classification, or standard report capture depending on configuration and connectivity.

## Localization

Localization source files are stored in:

```text
lib/l10n/
```

The English source catalog is:

```text
lib/l10n/app_en.arb
```

Supported translation catalogs are:

```text
lib/l10n/app_hi.arb
lib/l10n/app_bn.arb
lib/l10n/app_ne.arb
```

After changing localization resources, regenerate the localization Dart files:

```bash
flutter gen-l10n
```

Localized railway display helpers are located at:

```text
lib/core/localization/railway_display_names.dart
```

These helpers localize known station names, section names, waypoint names, and language names without changing stored database identifiers.

## Development checks

Run static analysis:

```bash
flutter analyze
```

Run the test suite:

```bash
flutter test
```

Run a specific localization test:

```bash
flutter test test/unit/railway_display_names_test.dart
```

## Configuration behavior

TrackGuard DHR can start without valid Supabase configuration. In that case:

- The application can still launch.
- Offline reporting features remain available.
- Online authentication and synchronization are disabled.
- The application logs a configuration notice for development.

The application also starts its background services after the first Flutter frame so that initial UI rendering is not delayed by environment loading, database setup, network initialization, or offline AI readiness checks.

## Data and privacy notes

- Reports may contain photographs, GPS coordinates, station information, notes, and user metadata.
- Local reports are stored on the device until synchronization is available.
- Supabase stores remote authentication and report data when configured.
- AI providers may receive report images or text when online AI is enabled.
- Review production privacy, retention, access-control, and consent requirements before deployment.

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).
