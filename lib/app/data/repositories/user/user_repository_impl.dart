import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:kopa_app/app/core/utils/logger.dart';
import 'package:kopa_app/app/data/models/external/auth/user.model.dart';
import 'package:kopa_app/app/data/repositories/user/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final firestoreUserData = FirebaseFirestore.instance.collection('users');

  @override
  Future<UserModel?> getUserData(String uid) =>
      firestoreUserData.doc(uid).get().then((data) {
        if (!data.exists) return null;
        return UserModel.fromJson(data.data()!);
      });

  @override
  Future<String> uploadUserPhoto(String uid, File file, String name) async {
    try {
      UploadTask uploadTask = FirebaseStorage.instance
          .ref()
          .child('users')
          .child('$uid/profilePhoto/$name')
          .putFile(file);
      TaskSnapshot snapshot = await uploadTask;
      String profileImageUrl = await snapshot.ref.getDownloadURL();
      return profileImageUrl;
    } catch (e) {
      logger.e(e);
      rethrow;
    }
  }

  @override
  Future<void> updateUser(String uid, Map<String, Object> data) async{
    firestoreUserData.doc(uid).update(data);
  }
}
