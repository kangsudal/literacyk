import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:literacyk/constants/firebase_constants.dart';
import 'package:literacyk/models/app_user.dart';
import 'package:literacyk/repositories/handle_exception.dart';

class AppUserRepository {
  Future<AppUser> getProfile({required String uid}) async {
    try {
      final DocumentSnapshot appUserDoc = await usersCollection.doc(uid).get();
      if (appUserDoc.exists) {
        final appUser = AppUser.fromDoc(appUserDoc);
        return appUser;
      }
      throw 'User not found';
    } catch (e) {
      throw handleException(e);
    }
  }
}
