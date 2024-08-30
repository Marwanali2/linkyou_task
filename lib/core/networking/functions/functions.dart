import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:linkyou_task/view_models/user_cubit.dart';
import 'package:linkyou_task/view_models/user_state.dart';

Future<void> handleSignIn(BuildContext context) async {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  try {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final name = googleUser.displayName ?? '';
      final email = googleUser.email;

      if (context.mounted) {
        context.read<UserCubit>().createUser(name, email);
      }
    }
  } catch (e) {
    log('Google sign-in error: $e');
    if (context.mounted) {
      context.read<UserCubit>().emit(UserError('Google sign-in error: $e'));
    }
  }
}
