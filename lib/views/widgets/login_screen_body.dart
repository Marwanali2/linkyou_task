import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkyou_task/core/networking/functions/functions.dart';
import 'package:linkyou_task/view_models/user_cubit.dart';
import 'package:linkyou_task/view_models/user_state.dart';
import 'package:linkyou_task/views/users_list_screen.dart';
import 'package:linkyou_task/views/widgets/login_button.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoaded) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UsersListScreen()),
          );
        } else if (state is UserError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      builder: (context, state) {
        if (state is UserLoading) {
          return const Center(
              child: CircularProgressIndicator(color: Colors.lightBlue));
        } else {
          return Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.2,
              ),
              child: LoginButton(
                onPressed: () => handleSignIn(context),
                text: 'Login with Google',
              ),
            ),
          );
        }
      },
    );
  }
}
