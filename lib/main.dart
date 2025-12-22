import 'package:flutter/material.dart';
import 'package:quiz_app/router.dart/app_router.dart';
import 'package:quiz_app/screens/start_screen.dart';

// var kColorScheme = ColorScheme.fromSeed(seedColor: Colors.purpleAccent);

// var kDarkColorScheme= ColorScheme.fromSeed(
//   brightness: Brightness.dark,
//   seedColor: Colors.purpleAccent);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        //colorScheme: kColorScheme,
        scaffoldBackgroundColor: Colors.deepPurple, //all scaffolds in this app will take same bg color.
      ),
      routerConfig:appRouter
    );
  }
}
