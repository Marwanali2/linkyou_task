import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkyou_task/features/Auth/Presentation/views/manager/login_cubit.dart';
import 'package:linkyou_task/features/Auth/Presentation/views/manager/login_state.dart';
import 'package:linkyou_task/features/Auth/Presentation/views/widgets/custom_button.dart';
import 'package:linkyou_task/features/home/presentation/views/users_list_screen.dart'; 
class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => UsersListScreen()),
          );
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.errorMessage}')),
          );
        }
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).width * 0.15.w,
          ),
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return const CircularProgressIndicator();
              } else if (state is LoginSuccess) {
                return _userInfo(state.displayName, state.email, state.photoURL);
              } else {
                return _googleSignIn(context);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _googleSignIn(BuildContext context) {
    return CustomButton(
      text: 'Sign in with Google',
      onPressed: () {
        context.read<LoginCubit>().signInWithGoogle(context);
      },
    );
  }

  Widget _userInfo(String? displayName, String? email, String? photoURL) {
    return SizedBox(
      child: Column(
        children: [
          Text('User: $displayName'),
          Text('Email: $email'),
          if (photoURL != null)
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(photoURL),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
