import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkyou_task/features/Auth/data/api_services/login_api_services.dart';
import 'package:linkyou_task/features/home/data/api_services/home_api_service.dart';
import 'package:linkyou_task/features/home/data/models/user_model.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final HomeApiService _homeApiService;
  final LoginApiServices _loginApiServices;

  UserCubit(this._homeApiService, this._loginApiServices) : super(UserInitial());

  Future<void> createUser(String name, String email) async {
    emit(UserLoading());
    try {
      await _loginApiServices.createUser(name, email);
      fetchAllUsers(); 
    } catch (e) {
      emit(UserError('Failed to create user: $e'));
    }
  }

  Future<void> fetchAllUsers() async {
    emit(UserLoading());
    List<UserModel> allUsers = [];
    int page = 1;

    try {
      while (true) {
        final users = await _homeApiService.fetchUsers(page);
        if (users.isEmpty) break;
        allUsers.addAll(users);
        page++;
      }
      emit(UserLoaded(allUsers));
    } catch (e) {
      emit(UserError('Failed to fetch users: $e'));
    }
  }
}
