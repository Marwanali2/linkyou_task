import 'package:linkyou_task/core/errors/failure.dart';

import '../models/user_model.dart';
import 'package:dartz/dartz.dart';
abstract class UserRepository {
  Future<Either<Failure, void>>  createUser(String name, String email);
  Future <Either<Failure, List<UserModel>>> fetchUsers();
}
