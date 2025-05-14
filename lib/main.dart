import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meditator/models/meditation_model.dart';
import 'package:meditator/models/mindfull_exercise_model.dart';
import 'package:meditator/models/sleep_content_model.dart';
import 'package:meditator/router/router.dart';

import 'package:provider/provider.dart';
import 'package:meditator/providers/filter_provider.dart';
import 'package:meditator/providers/meditation_provider.dart';
import 'package:meditator/providers/mindfull_exercise_provider.dart';
import 'package:meditator/providers/sleep_content_provider.dart';

void main() async {
  await Hive.initFlutter();
  //register the adapters
  Hive.registerAdapter(MeditationContentAdapter());
  Hive.registerAdapter(MindfulnessExerciseAdapter());
  Hive.registerAdapter(SleepContentAdapter());

  // Open Hive box
  await Hive.openBox('meditations_data');
  await Hive.openBox('mindfull_exercises');
  await Hive.openBox('sleep_contents');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MindfullExerciseProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MeditationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SleepContentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => FilterdDataprovider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Meditate App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      routerConfig: RouterClass().router,
    );
  }
}
