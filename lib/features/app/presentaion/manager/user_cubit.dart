import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkyou_task/features/app/data/repos/user_repository.dart';
import 'package:linkyou_task/features/app/presentaion/manager/user_state.dart';
import 'package:linkyou_task/core/errors/failure.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepository _userRepository;

  UserCubit(this._userRepository) : super(UserInitial());

  Future<void> createUser(String name, String email) async {
    emit(UserLoading());
    final result = await _userRepository.createUser(name, email);

    result.fold(
      (failure) => emit(UserError(_mapFailureToMessage(failure))),
      (_) => fetchUsers(),
    );
  }

  Future<void> fetchUsers() async {
    emit(UserLoading());
    final result = await _userRepository.fetchUsers();

    result.fold(
      (failure) => emit(UserError(_mapFailureToMessage(failure))),
      (users) => emit(UserLoaded(users)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.errorMessage;
  }
}
