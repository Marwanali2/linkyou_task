import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkyou_task/core/networking/functions/functions.dart';
import 'package:linkyou_task/features/app/presentaion/manager/user_cubit.dart';
import 'package:linkyou_task/features/app/presentaion/manager/user_state.dart';
import 'package:linkyou_task/features/app/presentaion/views/users_list_screen.dart';
import 'package:linkyou_task/features/app/presentaion/views/widgets/login_button.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
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
          } else if (state is UserLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Loading...',
                  style: TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.lightBlue,
              ),
            );
          }
        },
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.2,
            ),
            child: LoginButton(
              onPressed: () => handleSignIn(context),
              text: 'Login with Google',
            ),
          ),
        ));
  }
}
