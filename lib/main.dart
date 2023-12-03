import 'package:flutter/material.dart';
import './modules/splashScreen/screen.dart';
import './modules/homeScreen/screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 94, 1, 255)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
