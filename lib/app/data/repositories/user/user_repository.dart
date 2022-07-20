import 'dart:io';

import 'package:kopa_app/app/core/data/base_repository.dart';
import 'package:kopa_app/app/data/models/external/auth/user.model.dart';

abstract class UserRepository extends BaseRepository {
  Future<UserModel?> getUserData(String uid);
  Future<String> uploadUserPhoto(String uid, File file, String name);
  Future<void> updateUser(String uid, Map<String, Object> data);
}
