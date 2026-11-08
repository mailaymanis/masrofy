import 'package:go_router/go_router.dart';
import 'package:masrofy/core/routes/app_routes.dart';
import 'package:masrofy/features/auth/view/pages/welcome_auth_screen.dart';
import 'package:masrofy/features/debts/views/pages/debts_screen.dart';
import 'package:masrofy/features/expenses/view/pages/expenses_screen.dart';
import 'package:masrofy/features/goals/views/pages/goals_screen.dart';
import 'package:masrofy/features/home/view/pages/home_screen.dart';
import 'package:masrofy/features/income/view/pages/income_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.welcomeAuth,
  routes: [
    GoRoute(
      path: AppRoutes.welcomeAuth,
      builder: (context, state) => const WelcomeAuthScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),

    GoRoute(
      path: AppRoutes.goals,
      builder: (context, state) => const GoalsScreen(),
    ),
    GoRoute(
      path: AppRoutes.debts,
      builder: (context, state) => const DebtsScreen(),
    ),
    GoRoute(
      path: AppRoutes.income,
      builder: (context, state) => const IncomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.expenses,
      builder: (context, state) => const ExpensesScreen(),
    ),
  ],
);
