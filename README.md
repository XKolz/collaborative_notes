# Complete Setup Guide: Real-Time Collaborative Notes

This guide walks you through creating and running the collaborative notes project from scratch.

## Prerequisites

Before starting, ensure you have:

- **Flutter SDK** (3.10.0 or higher)
- **Dart SDK** (3.0.0 or higher)
- **Git** for version control
- **VS Code** or **Android Studio** with Flutter extensions
- **Node.js** (for Firebase CLI)
- **Google account** (for Firebase)

### Check Your Flutter Installation

```bash
flutter doctor
```

Make sure you see green checkmarks for Flutter, Dart, and at least one platform (Android/iOS/Web).

## Step 1: Create the Flutter Project

```bash
# Create a new Flutter project
flutter create collaborative_notes

# Navigate to the project directory
cd collaborative_notes

# Test that the base project works
flutter run
```

You should see the default Flutter counter app running.

## Step 2: Set Up Firebase

### 2.1 Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click "Create a project"
3. Enter project name: `collaborative-notes-demo`
4. Disable Google Analytics (optional for this demo)
5. Click "Create project"

### 2.2 Enable Firestore

1. In your Firebase project console, click "Firestore Database"
2. Click "Create database"
3. Choose "Start in test mode" (for development)
4. Select a location (choose closest to you)
5. Click "Done"

### 2.3 Configure Firestore Rules

In the Firestore console, go to "Rules" tab and replace with:

```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /documents/{document} {
      allow read, write: if true;
    }
  }
}
```

Click "Publish" to save the rules.

### 2.4 Install Firebase CLI

```bash
# Install Firebase CLI globally
npm install -g firebase-tools

# Login to Firebase
firebase login

# Install FlutterFire CLI
dart pub global activate flutterfire_cli
```

### 2.5 Configure FlutterFire

```bash
# In your project directory
flutterfire configure

# Select your Firebase project when prompted
# Choose platforms: Android, iOS, Web (select all you want to support)
```

This will generate `lib/firebase_options.dart` with your configuration.

## Step 3: Update Dependencies

Replace the contents of `pubspec.yaml`:

```yaml
name: collaborative_notes
description: A real-time collaborative notes app with Flutter, Riverpod, and Firebase
version: 1.0.0+1

environment:
  sdk: ">=3.0.0 <4.0.0"
  flutter: ">=3.10.0"

dependencies:
  flutter:
    sdk: flutter

  # State Management
  flutter_riverpod: ^2.4.9

  # Firebase
  firebase_core: ^2.24.2
  cloud_firestore: ^4.13.6

  # Code Generation
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1

  # UI
  cupertino_icons: ^1.0.2

dev_dependencies:
  flutter_test:
    sdk: flutter

  # Code Generation
  build_runner: ^2.4.7
  freezed: ^2.4.6
  json_serializable: ^6.7.1

  # Linting
  flutter_lints: ^3.0.0

flutter:
  uses-material-design: true
```

Install dependencies:

```bash
flutter pub get
```

## Step 4: Create Project Structure

Create the following directory structure:

```bash
mkdir -p lib/models
mkdir -p lib/state
mkdir -p lib/services
mkdir -p lib/providers
mkdir -p lib/widgets
mkdir -p lib/screens
mkdir -p test
```

## Step 5: Add the Source Code

Now you need to create all the source files. Here's the order to create them:

### 5.1 Data Models

Create `lib/models/document.dart` - copy from the "Document Data Model" artifact above.

### 5.2 State Definitions

Create `lib/state/editor_state.dart` - copy from the "Editor State Management" artifact above.

### 5.3 Services

Create `lib/services/diff_merge_service.dart` - copy from the "Diff-Merge Service" artifact above.

Create `lib/services/firebase_service.dart` - copy from the "Firebase Service" artifact above.

### 5.4 Providers

Create `lib/providers/editor_notifier.dart` - copy from the "Editor State Notifier" artifact above.

Create `lib/providers/providers.dart` - copy from the "Riverpod Providers" artifact above.

### 5.5 Widgets

Create `lib/widgets/collaborative_editor.dart` - copy from the "Collaborative Editor Widget" artifact above.

### 5.6 Screens

Create `lib/screens/collaborative_editor_screen.dart` - copy from the "Main Collaborative Editor Screen" artifact above.

### 5.7 Main App

Replace `lib/main.dart` with the content from the "Flutter Collaborative Notes - Main App" artifact above.

### 5.8 Tests

Create `test/diff_merge_service_test.dart` - copy from the "Diff-Merge Unit Tests" artifact above.

## Step 6: Generate Code

Generate the Freezed models:

```bash
dart run build_runner build
```

If you get conflicts, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Step 7: Run the Application

```bash
flutter run
```

Choose your target device (web, Android emulator, iOS simulator, etc.).

## Step 8: Test the Collaborative Features

1. **Launch the app** - You should see two side-by-side text editors
2. **Type in the left editor** - Watch the text appear in the right editor
3. **Type in the right editor** - Watch the text appear in the left editor
4. **Try simultaneous typing** - Type in both editors at the same time to see conflict resolution

## Troubleshooting

### Common Issues

**1. Firebase Configuration Error**

```bash
# Make sure you ran flutterfire configure
flutterfire configure
```

**2. Build Runner Issues**

```bash
# Clean and rebuild
flutter clean
flutter pub get
dart run build_runner build --delete-conflicting-outputs
```

**3. Import Errors**
Make sure all files are in the correct directories and have the right import paths.

**4. Firestore Permission Denied**
Check that your Firestore rules allow read/write access (see Step 2.3).

### Verification Steps

1. **Check Firebase Connection**:

   - Open Firebase Console
   - Go to Firestore
   - You should see a "documents" collection appear when you start typing

2. **Check Real-time Sync**:

   - Type in one editor
   - The text should appear in the other editor within 1-2 seconds
   - Check the status indicators show "Connected" and "Saved"

3. **Run Tests**:
   ```bash
   flutter test
   ```

## Next Steps

Once you have the basic app running:

1. **Try on Multiple Devices**: Run the app on different devices/browsers to test real collaboration
2. **Experiment with Features**: Try the conflict resolution by typing simultaneously
3. **Check Firebase Console**: Watch the real-time updates in Firestore
4. **Modify and Extend**: Add new features like user authentication or document management

## Project Structure Overview

```
collaborative_notes/
├── lib/
│   ├── main.dart
│   ├── firebase_options.dart
│   ├── models/
│   │   └── document.dart
│   ├── state/
│   │   └── editor_state.dart
│   ├── services/
│   │   ├── firebase_service.dart
│   │   └── diff_merge_service.dart
│   ├── providers/
│   │   ├── providers.dart
│   │   └── editor_notifier.dart
│   ├── widgets/
│   │   └── collaborative_editor.dart
│   └── screens/
│       └── collaborative_editor_screen.dart
├── test/
│   └── diff_merge_service_test.dart
├── pubspec.yaml
└── README.md
```

The entire setup should take about 15-20 minutes, and you'll have a fully functional real-time collaborative text editor!

<!-- # collaborative_notes

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full åAPI reference. -->

# Update Podfile

sed -i '' 's/platform :ios, '\''12.0'\''/platform :ios, '\''13.0'\''/' ios/Podfile

# Update Xcode project

sed -i '' 's/IPHONEOS_DEPLOYMENT_TARGET = 12.0/IPHONEOS_DEPLOYMENT_TARGET = 13.0/g' ios/Runner.xcodeproj/project.pbxproj

# Update Gradle wrapper version, Change the distributionUrl line to:

- nano android/gradle/wrapper/gradle-wrapper.properties
  distributionUrl=https\://services.gradle.org/distributions/gradle-8.4-all.zip

# Fix the Android Gradle Plugin version there:

nano android/settings.gradle

- Look for a line like:
  id "com.android.application" version "8.1.0" apply false

- And update it to:
  id "com.android.application" version "8.3.0" apply false
