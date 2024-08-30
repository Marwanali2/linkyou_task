
import 'package:linkyou_task/features/home/data/api_services/home_api_service.dart';
import 'package:linkyou_task/features/home/data/models/user_model.dart';

class HomeRepository {
  final HomeApiService _apiService = HomeApiService();

  Future<List<UserModel>> fetchUsers(int page) {
    return _apiService.fetchUsers(page);
  }
}
