abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String? displayName;
  final String? email;
  final String? photoURL;

  LoginSuccess({this.displayName, this.email, this.photoURL});
}

class LoginFailure extends LoginState {
  final String errorMessage;

  LoginFailure(this.errorMessage);
}
