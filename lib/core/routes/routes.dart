import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes/app_routes.dart';
import 'package:masrofy/features/splash/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
  ],
);
