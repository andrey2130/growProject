import 'package:go_router/go_router.dart';
import 'package:growproject/screens/sing_up_screen.dart';
import 'package:growproject/screens/welcomeApp_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const WelcomeAppScreen(),
    ),
    GoRoute(
      path: '/SingUpScreen',
      builder: (context, state) => const SingUpScreen(),
    )
  ],
);
