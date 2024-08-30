import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkyou_task/features/app/data/repos/user_repository.dart';
import 'package:linkyou_task/features/app/presentaion/manager/user_state.dart';


class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;

  UserCubit(this._userRepository) : super(UserInitial());

  Future<void> createUser(String name, String email) async {
    try {
      emit(UserLoading());
      await _userRepository.createUser(name, email);
      fetchUsers();
    } catch (e) {
      emit(UserError('Failed to create user: ${e.toString()}'));
    }
  }

  Future<void> fetchUsers() async {
    try {
      emit(UserLoading());
      final users = await _userRepository.fetchUsers();
      emit(UserLoaded(users));
    } catch (e) {
      emit(UserError('Failed to fetch users: ${e.toString()}'));
    }
  }
}
