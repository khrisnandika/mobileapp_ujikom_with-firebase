import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:latihan_ujikom/Component/constant.dart';
import 'package:latihan_ujikom/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen(
        splash: 'assets/digitalent.png',
          splashIconSize: 200,
          duration: 3000,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: kDigitalent,
          nextScreen: LoginScreen(),
      ),
    );
  }
}