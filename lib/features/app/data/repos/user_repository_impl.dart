import 'package:linkyou_task/features/app/data/repos/user_repository.dart';
import 'package:linkyou_task/features/app/data/services/api_service.dart';

import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiService _apiService;

  UserRepositoryImpl(this._apiService);

  @override
  Future<void> createUser(String name, String email) async {
    await _apiService.createUser(name, email);
  }

  @override
  Future<List<UserModel>> fetchUsers() async {
    return await _apiService.fetchUsers();
  }
}
