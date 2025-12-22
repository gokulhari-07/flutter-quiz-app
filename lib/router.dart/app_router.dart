import 'package:go_router/go_router.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: "/",
      name: "start",
      builder: (context, state) => const StartScreen(),
    ),
    GoRoute(
      path: "/questions",
      name: "questions",
      builder: (context, state) => const QuestionsScreen(), 
    ),
    GoRoute(
      path: "/results",
      name: "results",
      builder: (context, state) => const ResultsScreen(),
    ),
  ],
);
