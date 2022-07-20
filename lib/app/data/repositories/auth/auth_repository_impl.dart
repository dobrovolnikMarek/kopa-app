import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kopa_app/app/data/models/external/auth/user.model.dart';
import 'package:kopa_app/app/data/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final firestoreUserData = FirebaseFirestore.instance.collection('users');

  @override
  Future<void> createUser(UserModel user) async {
    firestoreUserData.doc(user.id).set(user.toJson());
  }
}
