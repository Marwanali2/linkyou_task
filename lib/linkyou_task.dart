import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkyou_task/core/Dependency_injection/service_locator.dart';
import 'package:linkyou_task/view_models/user_cubit.dart';
import 'package:linkyou_task/views/login_screen.dart';

class LinkyouTask extends StatelessWidget {
  const LinkyouTask({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>getIt<UserCubit>(),
          ),
        ],
        child: MaterialApp(
          title: 'Linkyou Task',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LoginScreen(),
        ),
      ),
    );
  }
}
