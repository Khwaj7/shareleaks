import 'package:firebase_database/firebase_database.dart';

class SetsDatabase {
  static Future<Set> read({required String setId}) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref('sets/$setId');
      final snapshot = await ref.get();

      if (snapshot.exists) {
        Map<String, dynamic> snapshotValue =
            Map<String, dynamic>.from(snapshot.value as Map);
        return snapshotValue['name'] ?? '';
      } else {
        return {};
      }
    } catch (e) {
      rethrow;
    }
  }
}
