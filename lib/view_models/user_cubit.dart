import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkyou_task/services/api_service.dart';
import 'package:linkyou_task/view_models/user_state.dart';

class UserCubit extends Cubit<UserState> {
  final ApiService _apiService;

  UserCubit(this._apiService) : super(UserInitial());

  Future<void> createUser(String name, String email) async {
    try {
      emit(UserLoading());
      await _apiService.createUser(name, email);
      fetchUsers();
    } catch (e) {
      emit(UserError('Failed to create user: ${e.toString()}'));
    }
  }

  Future<void> fetchUsers() async {
    try {
      emit(UserLoading());
      final users = await _apiService.fetchUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError('Failed to fetch users: ${e.toString()}'));
    }
  }
}