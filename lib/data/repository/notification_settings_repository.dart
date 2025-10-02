import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationSettingsRepository {
  final _firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> getSettings(String userId) async {
    final doc = await _firestore
        .collection("users")
        .doc(userId)
        .collection("settings")
        .doc("notifications")
        .get();

    if (doc.exists) {
      return doc.data()!;
    } else {
      return {
        "general": true,
        "sound": true,
        "vibrate": false,
      };
    }
  }

  Future<void> updateSetting(String userId, String field, bool value) async {
    await _firestore
        .collection("users")
        .doc(userId)
        .collection("settings")
        .doc("notifications")
        .set(
      {field: value},
      SetOptions(merge: true),
    );
  }
}
