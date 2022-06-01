import 'package:flutter/material.dart';
import 'home_screen/home_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primaryColorDark: Colors.amber,
        colorScheme: const ColorScheme.light(
          primary: Colors.amber,
          secondary: Colors.amberAccent,
        ),
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/logo.png'),
        splashTransition: SplashTransition.rotationTransition,
        nextScreen: const HomeScreen(),
      ),
    );
  }
}
