# Complete Setup Guide: Real-Time Collaborative Notes

A Flutter application demonstrating real-time collaborative text editing using Riverpod state management and Firebase Firestore. Multiple users can edit the same document simultaneously with changes synchronizing live across all instances.

## Features

- **Real-time synchronization**: Changes appear instantly across all connected editors
- **Conflict resolution**: Intelligent merge algorithm handles simultaneous edits
- **Cursor preservation**: User cursor position is maintained during remote updates when possible
- **Connection status**: Visual indicators show connection state and save status
- **Version tracking**: Document versioning to handle concurrent modifications
- **Simulated multi-user**: Side-by-side editors demonstrate collaboration in a single app

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
4. Disable Google Analytics
5. Click "Create project"

### 2.2 Enable Firestore

1. In your Firebase project console, click "Firestore Database"
2. Click "Create database"
3. Choose "Start in test mode"
4. Select a location
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
flutterfire configure

```

This will generate `lib/firebase_options.dart` with your configuration.

## Step 3: Update Dependencies

I added the necessary packages to .yaml file

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
```

### 5 Tests

Create `test/diff_merge_service_test.dart`

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

**Run Tests**:

```bash
flutter test
```

Or test that particular file

```bash
flutter test test/diff_merge_service_test.dart
```

# Also, i added this when i ran into errors

# Update Podfile

sed -i '' 's/platform :ios, '\''12.0'\''/platform :ios, '\''13.0'\''/' ios/Podfile

# Update Xcode project

sed -i '' 's/IPHONEOS_DEPLOYMENT_TARGET = 12.0/IPHONEOS_DEPLOYMENT_TARGET = 13.0/g' ios/Runner.xcodeproj/project.pbxproj

# Update Gradle wrapper version, Change the distributionUrl:

distributionUrl=https\://services.gradle.org/distributions/gradle-8.4-all.zip

# Fix the Android Gradle Plugin version:

id "com.android.application" version "8.3.0" apply false

# Standard style across all your Dart files (indentation, spacing, line breaks).

1. Format a single file:
   dart format lib/main.dart
2. Format the whole project:
   dart format .
