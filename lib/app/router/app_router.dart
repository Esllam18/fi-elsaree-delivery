import 'package:go_router/go_router.dart';

import '../../features/first_run/presentation/language_screen.dart';
import '../../features/first_run/presentation/theme_selection_screen.dart';
import '../../features/onboarding/presentation/onboarding_screen.dart';
import '../../features/session/presentation/session_gate_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';
import 'app_routes.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: <RouteBase>[
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.language,
      builder: (context, state) => const LanguageScreen(),
    ),
    GoRoute(
      path: AppRoutes.themeSelection,
      builder: (context, state) => const ThemeSelectionScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: AppRoutes.sessionGate,
      builder: (context, state) => const SessionGateScreen(),
    ),
  ],
);
