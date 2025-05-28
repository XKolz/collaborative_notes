// lib/services/firebase_service.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/document.dart';

class FirebaseService {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String _documentsCollection = 'documents';

  /// Stream of document changes
  static Stream<Document> documentStream(String documentId) {
    return _firestore
        .collection(_documentsCollection)
        .doc(documentId)
        .snapshots()
        .map((snapshot) {
      if (!snapshot.exists) {
        // Create default document if it doesn't exist
        _createDefaultDocument(documentId);
        return Document(
          id: documentId,
          content: '',
          lastModified: DateTime.now(),
        );
      }

      final data = snapshot.data()!;
      return Document(
        id: documentId,
        content: data['content'] ?? '',
        lastModified: (data['lastModified'] as Timestamp).toDate(),
        lastModifiedBy: data['lastModifiedBy'] ?? '',
        version: data['version'] ?? 0,
      );
    });
  }

  /// Update document content
  static Future<void> updateDocument({
    required String documentId,
    required String content,
    required String userId,
  }) async {
    final docRef = _firestore.collection(_documentsCollection).doc(documentId);
    
    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(docRef);
      final currentVersion = snapshot.exists ? (snapshot.data()?['version'] ?? 0) : 0;
      
      transaction.set(docRef, {
        'content': content,
        'lastModified': FieldValue.serverTimestamp(),
        'lastModifiedBy': userId,
        'version': currentVersion + 1,
      }, SetOptions(merge: true));
    });
  }

  /// Create a default document
  static Future<void> _createDefaultDocument(String documentId) async {
    final docRef = _firestore.collection(_documentsCollection).doc(documentId);
    
    await docRef.set({
      'content': 'Welcome to collaborative editing!\n\nStart typing to see real-time collaboration in action.',
      'lastModified': FieldValue.serverTimestamp(),
      'lastModifiedBy': 'system',
      'version': 1,
    });
  }

  /// Get document once
  static Future<Document?> getDocument(String documentId) async {
    final snapshot = await _firestore
        .collection(_documentsCollection)
        .doc(documentId)
        .get();

    if (!snapshot.exists) return null;

    final data = snapshot.data()!;
    return Document(
      id: documentId,
      content: data['content'] ?? '',
      lastModified: (data['lastModified'] as Timestamp).toDate(),
      lastModifiedBy: data['lastModifiedBy'] ?? '',
      version: data['version'] ?? 0,
    );
  }
}