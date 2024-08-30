import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkyou_task/features/home/data/models/user_model.dart';
import 'package:linkyou_task/features/home/data/repos/home_repository.dart';
import 'package:linkyou_task/features/home/presentation/views/manager/user_state.dart';
class UsersCubit extends Cubit<UsersState> {
  final HomeRepository _homeRepository;
  int _currentPage = 1;

  UsersCubit(this._homeRepository) : super(UsersInitial());

  void fetchUsers() async {
    if (state is UsersLoading || (state is UsersLoaded && (state as UsersLoaded).hasReachedMax)) {
      return;
    }

    final currentState = state;

    var oldUsers = <UserModel>[];
    if (currentState is UsersLoaded) {
      oldUsers = currentState.users;
    }

    emit(UsersLoading());

    try {
      final newUsers = await _homeRepository.fetchUsers(_currentPage);

      _currentPage++;

      final users = oldUsers + newUsers;
      emit(UsersLoaded(users: users, hasReachedMax: newUsers.isEmpty));
    } catch (e) {
      emit(UsersError(e.toString()));
    }
  }
}
