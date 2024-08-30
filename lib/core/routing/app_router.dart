import 'package:flutter/material.dart';
import 'package:linkyou_task/core/routing/routes.dart';
import 'package:linkyou_task/features/home/presentation/views/home_view.dart';
import '../../features/Auth/Presentation/views/login_view.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    // This arguments to be passed in any screen like this: (arguments as ClassName).
    // ignore: unused_local_variable
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.kMain:
        return MaterialPageRoute(
          builder: (_) => const LoginView(),
        );
      case Routes.kHome:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
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
