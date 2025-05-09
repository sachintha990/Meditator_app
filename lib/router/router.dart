import 'dart:convert';

import 'package:go_router/go_router.dart';
import 'package:meditator/models/mindfull_exercise_model.dart';
import 'package:meditator/pages/main_screen.dart';
import 'package:meditator/pages/mindfull_exercise_details_page.dart';
import 'package:meditator/router/route_names.dart';

class RouterClass {
  final router = GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        name: RouteNames.mainPage,
        builder: (context, state) {
          return const MainScreen();
        },
      ),
      GoRoute(
        name: RouteNames.mindFullExercise,
        path: "/mindfullExerciseDetail",
        builder: (context, state) {
          final mindfullExerciseJson =
              state.uri.queryParameters['mindfullExercise'];
          final mindfullExercise =
              MindfulnessExercise.fromJson(jsonDecode(mindfullExerciseJson!));

          return MidfullExerciseDetailsPage(
            mindfullExercise: mindfullExercise,
          );
        },
      ),
    ],
  );
}
