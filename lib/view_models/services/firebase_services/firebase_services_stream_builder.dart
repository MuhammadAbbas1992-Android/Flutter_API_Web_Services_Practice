import 'package:firebase_database/firebase_database.dart';

import '../../../res/constants/app_constants.dart';

class FirebaseServicesStreamBuilder {
  // Get Firebase or realtime database path for Stream Builder
  static Future<DatabaseReference?> getFirebaseDBPath() async {
    try {
      final DatabaseReference databaseReference =
          FirebaseDatabase.instance.ref(AppConstants.firebaseDBName);
      return databaseReference;
    } catch (e) {
      return null;
    }
  }
}
