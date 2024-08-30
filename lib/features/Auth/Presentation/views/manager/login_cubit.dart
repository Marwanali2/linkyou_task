import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkyou_task/features/Auth/Presentation/views/manager/login_state.dart';
import 'package:linkyou_task/features/home/presentation/views/users_list_screen.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth _auth;

  LoginCubit(this._auth) : super(LoginInitial()) {
    _auth.authStateChanges().listen((user) {
      if (user != null) {
        emit(LoginSuccess(
          displayName: user.displayName,
          email: user.email,
          photoURL: user.photoURL,
        ));
      } else {
        emit(LoginInitial());
      }
    });
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    emit(LoginLoading());
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      await _auth.signInWithProvider(googleAuthProvider);

      // بعد تسجيل الدخول الناجح، الانتقال إلى شاشة عرض المستخدمين
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => UsersListScreen()),
      );
    } catch (error) {
      emit(LoginFailure('Google sign-in error: $error'));
      log('Google sign-in error: $error');
    }
  }
}
