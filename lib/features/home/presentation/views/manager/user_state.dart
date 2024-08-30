import 'package:linkyou_task/features/home/data/models/user_model.dart';

abstract class UsersState {}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {
  final List<UserModel> users;
  final bool hasReachedMax;

  UsersLoaded({required this.users, required this.hasReachedMax});
}

class UsersError extends UsersState {
  final String message;

  UsersError(this.message);
}
