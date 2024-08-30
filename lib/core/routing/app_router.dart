import 'package:flutter/material.dart';
import 'package:linkyou_task/core/routing/routes.dart';
import 'package:linkyou_task/features/app/presentaion/views/login_screen.dart';
import 'package:linkyou_task/features/app/presentaion/views/users_list_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.kMain:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case Routes.kUsersList:
        return MaterialPageRoute(
          builder: (_) => const UsersListScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
    }
  }
}

/* import 'package:go_router/go_router.dart';
import 'package:marovies/core/routing/routes.dart';
import 'package:marovies/features/home/presentation/views/home_view.dart';
import 'package:marovies/splash_view.dart';
abstract class AppRouter {
  

  static final router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: Routes.kMain,
      builder: (context, state) {
        return const SplashView();
      },
    ),
    GoRoute(
      path: Routes.kHome,
      builder: (context, state) {
        return const HomeView();
      },
    ),
  
  ]);
}
 */