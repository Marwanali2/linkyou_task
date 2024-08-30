import '../models/user_model.dart';

abstract class UserRepository {
  Future<void> createUser(String name, String email);
  Future<List<UserModel>> fetchUsers();
}
