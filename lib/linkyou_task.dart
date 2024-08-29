import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:linkyou_task/core/routing/app_router.dart';
import 'package:linkyou_task/core/routing/routes.dart';

class LinkyouTask extends StatelessWidget {
  const LinkyouTask({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Linkyou Task',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRouter().generateRoute,
        initialRoute: Routes.kMain,
      ),
    );
  }
}
