# TrackGuard DHR

![TrackGuard DHR app icon](android/app/src/main/res/drawable-xxxhdpi/splash_icon.png)

[![Flutter](https://img.shields.io/badge/Flutter-mobile-02569B?logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-3.13.7%2B-0175C2?logo=dart&logoColor=white)](https://dart.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Languages](https://img.shields.io/badge/Languages-English%20%7C%20Hindi%20%7C%20Bengali%20%7C%20Nepali-7A4E9D)](#localization)

TrackGuard DHR is an offline-first inspection app for permanent-way staff working along the Darjeeling Himalayan Railway. Staff can record a trackside hazard with a photo, location, severity, and notes, then review and save the report on the device. AI can suggest a hazard classification and observation, while the staff member remains responsible for confirming the report.

## Features

- Capture inspection photos and location details, including the nearest DHR waypoint and kilometre marker.
- Create and review reports when network access is unavailable. Reports are stored locally and can sync when connectivity returns.
- Use offline Gemma 4 E2B or configured online vision analysis for advisory suggestions. Manual classification is available as a fallback.
- Review and edit the suggested hazard, severity, and note before saving.
- View report synchronization state and report details.
- Sign in with Google through Supabase and provide role-based gangman and admin screens when the project backend is configured.
- Use the interface in English, Hindi, Bengali, or Nepali.

## Supported report details

Hazard categories include landslips, rockfalls, blocked drains, damaged retaining walls, track defects, vegetation, and other hazards. Severity ranges from low to critical. Reports include inspection and synchronization states, location source, and AI provider and model metadata where available.

AI output is advisory. The user reviews and confirms the final hazard, severity, and note.

## Technology

- Flutter and Dart
- Riverpod for application state
- SQLite for local reports and drafts
- Supabase for authentication, remote reports, media, and synchronization
- LiteRT-LM with Gemma for on-device AI
- OpenRouter for configured online vision AI
- Flutter localization with ARB files

## Requirements

- Flutter SDK with Dart 3.13.7 or later
- Android Studio and an Android SDK for Android builds
- Xcode for iOS builds on macOS
- Supabase project configuration for online authentication and synchronization
- Optional model and online AI configuration for AI features

## Getting started

1. Clone the repository and enter the project directory.

   ```bash
   git clone https://github.com/ShahbazCoder1/TrackGuard-DHR-App.git
   cd TrackGuard-DHR-App
   ```

2. Install dependencies.

   ```bash
   flutter pub get
   ```

3. Create a local environment file from the example.

   PowerShell:

   ```powershell
   Copy-Item .env.example .env
   ```

   macOS or Linux:

   ```bash
   cp .env.example .env
   ```

4. Set the values required for your development environment in `.env`:

   ```dotenv
   SUPABASE_URL=https://your-project.supabase.co
   SUPABASE_ANON_KEY=your-supabase-publishable-key
   OPENROUTER_API_KEY=your-openrouter-key
   OPENROUTER_MODEL=nvidia/nemotron-3.5-super-vl:free
   ```

   Supabase values are needed for online authentication and synchronization. OpenRouter values are optional and enable online AI. The offline and manual reporting paths do not require OpenRouter. Do not commit `.env` or private credentials. A key included in a mobile application should not be treated as secret; production deployments should route paid or privileged AI requests through a secured backend.

5. Configure Google OAuth and the redirect URL in Supabase and the platform settings before testing Google sign-in. The Android callback used by the app is `io.supabase.trackguard://login-callback/`.

6. Run on a connected device or emulator.

   ```bash
   flutter run
   ```

## Localization

The application supports English, Hindi, Bengali, and Nepali. Source strings are in `lib/l10n/app_en.arb`; translations are in `app_hi.arb`, `app_bn.arb`, and `app_ne.arb`.

After changing localization resources, regenerate the Dart localization files:

```bash
flutter gen-l10n
```

## Development checks

```bash
flutter analyze
flutter test
```

## Project structure

```text
lib/
  app/                 App shell, routing, and theme
  core/                Configuration, connectivity, localization, storage, and utilities
  features/             Authentication, reporting, AI, profile, and admin screens
  l10n/                 English, Hindi, Bengali, and Nepali resources
  shared/               Domain models and reusable widgets
assets/                 Branding and splash assets
android/                Android application and platform resources
ios/                     iOS application resources
test/                    Unit and widget tests
```

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE).
