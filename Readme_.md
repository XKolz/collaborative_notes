# Real-Time Collaborative Notes

A Flutter application demonstrating real-time collaborative text editing using Riverpod state management and Firebase Firestore. Multiple users can edit the same document simultaneously with changes synchronizing live across all instances.

## Features

- **Real-time synchronization**: Changes appear instantly across all connected editors
- **Conflict resolution**: Intelligent merge algorithm handles simultaneous edits
- **Cursor preservation**: User cursor position is maintained during remote updates when possible
- **Connection status**: Visual indicators show connection state and save status
- **Version tracking**: Document versioning to handle concurrent modifications
- **Simulated multi-user**: Side-by-side editors demonstrate collaboration in a single app

## Architecture Overview

### Key Components

#### 1. Riverpod Providers

**StreamProvider.family<Document, String>**

```dart
final documentStreamProvider = StreamProvider.family<Document, String>((ref, documentId) {
  ref.keepAlive(); // Maintains connection even if widget is temporarily removed
  return FirebaseService.documentStream(documentId);
});
```

**StateNotifierProvider<EditorStateNotifier, EditorState>**

```dart
final editorStateProvider = StateNotifierProvider.family<EditorStateNotifier, EditorState, EditorParams>((ref, params) {
  final notifier = EditorStateNotifier(
    documentId: params.documentId,
    userId: params.userId,
  );

  // Listen to document stream and handle remote changes
  ref.listen(documentStreamProvider(params.documentId), (previous, next) {
    next.whenData((document) {
      notifier.handleRemoteChange(document);
    });
  });

  return notifier;
});
```

#### 2. State Management Flow

1. **Local Changes**: User types → `EditorStateNotifier.updateContent()` → Debounced save to Firebase
2. **Remote Changes**: Firebase stream → `StreamProvider` → `EditorStateNotifier.handleRemoteChange()` → Diff-merge → UI update
3. **Conflict Resolution**: `DiffMergeService.mergeChanges()` handles simultaneous edits

#### 3. Diff-Merge Strategy

The application implements a three-way merge algorithm:

1. **No Conflict Cases**:

   - If local == remote: No changes needed
   - If local == base: Accept remote changes
   - If remote == base: Keep local changes

2. **Conflict Resolution**:

   - Detect overlapping changes between local and remote edits
   - Apply simple conflict resolution strategy (prefer remote changes)
   - Preserve user cursor position when possible

3. **Selection Preservation**:
   - Adjust cursor position based on text changes
   - Handle edge cases like text insertion/deletion around cursor

## Setup Instructions

### Prerequisites

- Flutter SDK (>=3.10.0)
- Dart SDK (>=3.0.0)
- Firebase project with Firestore enabled
- IDE with Flutter support (VS Code, Android Studio, etc.)

### Firebase Configuration

1. **Create Firebase Project**:

   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project or use existing one
   - Enable Firestore Database

2. **Configure FlutterFire**:

   ```bash
   # Install FlutterFire CLI
   npm install -g firebase-tools
   dart pub global activate flutterfire_cli

   # Configure your project
   flutterfire configure
   ```

3. **Update Firebase Rules** (Firestore):
   ```javascript
   rules_version = '2';
   service cloud.firestore {
     match /databases/{database}/documents {
       match /documents/{document} {
         allow read, write: if true; // For demo purposes - restrict in production
       }
     }
   }
   ```

### Installation

1. **Clone the repository**:

   ```bash
   git clone <your-repo-url>
   cd collaborative_notes
   ```

2. **Install dependencies**:

   ```bash
   flutter pub get
   ```

3. **Generate code** (for Freezed models):

   ```bash
   dart run build_runner build
   ```

4. **Update Firebase configuration**:

   - Replace the placeholder values in `lib/firebase_options.dart` with your actual Firebase configuration
   - Or ensure `flutterfire configure` generated the correct file

5. **Run the application**:
   ```bash
   flutter run
   ```

## Project Structure

```
lib/
├── main.dart                          # App entry point
├── firebase_options.dart              # Firebase configuration
├── models/
│   └── document.dart                  # Document data model
├── state/
│   └── editor_state.dart              # Editor state definitions
├── services/
│   ├── firebase_service.dart          # Firebase Firestore operations
│   └── diff_merge_service.dart        # Text merging logic
├── providers/
│   ├── providers.dart                 # Riverpod providers
│   └── editor_notifier.dart           # Editor state management
├── widgets/
│   └── collaborative_editor.dart      # Reusable editor widget
└── screens/
    └── collaborative_editor_screen.dart # Main screen

test/
└── diff_merge_service_test.dart       # Unit tests for merge logic
```

## Key Implementation Details

### ref.keepAlive() Usage

The `StreamProvider.family` uses `ref.keepAlive()` to maintain the Firebase connection even when the editor widget is temporarily removed from the widget tree:

```dart
final documentStreamProvider = StreamProvider.family<Document, String>((ref, documentId) {
  ref.keepAlive(); // Critical for maintaining real-time connection
  return FirebaseService.documentStream(documentId);
});
```

### Debounced Saving

Local changes are debounced to prevent excessive Firebase writes:

```dart
void updateContent(String newContent, TextSelection? selection) {
  state = state.copyWith(content: newContent, selection: selection);

  _debounceTimer?.cancel();
  _debounceTimer = Timer(const Duration(milliseconds: 500), () {
    _saveToFirebase();
  });
}
```

### Three-Way Merge Logic

The diff-merge service implements a three-way merge considering:

- **Base content**: Last known common state
- **Local content**: User's current edits
- **Remote content**: Changes from other users

```dart
static MergeResult mergeChanges({
  required String localContent,
  required String remoteContent,
  required String baseContent,
  TextSelection? localSelection,
}) {
  // Implementation handles various conflict scenarios
}
```

## Testing

Run the unit tests:

```bash
flutter test
```

The test suite covers:

- Basic merge scenarios (no conflicts)
- Conflict resolution
- Selection preservation
- Edge cases (empty content, large diffs)

## Usage

1. **Launch the app** - You'll see two side-by-side editors
2. **Start typing** in either editor
3. **Observe real-time sync** - Changes appear instantly in the other editor
4. **Test conflict resolution** - Type simultaneously in both editors
5. **Monitor status** - Connection and save indicators show current state

## Production Considerations

For production deployment, consider:

1. **Authentication**: Add Firebase Auth for user management
2. **Security Rules**: Implement proper Firestore security rules
3. **Error Handling**: Add comprehensive error handling and retry logic
4. **Performance**: Implement text diffing libraries for large documents
5. **Offline Support**: Add offline editing capabilities
6. **User Presence**: Show which users are currently editing
7. **Document Management**: Add document creation, deletion, and listing

## Technologies Used

- **Flutter**: Cross-platform UI framework
- **Riverpod**: Reactive state management
- **Firebase Firestore**: Real-time NoSQL database
- **Freezed**: Code generation for immutable classes
- **FlutterFire**: Firebase plugins for Flutter

## License

This project is created for educational and assessment purposes.
