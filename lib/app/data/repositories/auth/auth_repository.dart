import 'package:kopa_app/app/core/data/base_repository.dart';
import 'package:kopa_app/app/data/models/external/auth/user.model.dart';

abstract class AuthRepository extends BaseRepository {
  Future<void> createUser(UserModel user);
}

