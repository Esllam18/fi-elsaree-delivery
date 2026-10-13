import 'package:go_router/go_router.dart';

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
      path: AppRoutes.sessionGate,
      builder: (context, state) => const SessionGateScreen(),
    ),
  ],
);
