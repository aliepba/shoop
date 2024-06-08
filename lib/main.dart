import 'package:flutter/material.dart';
import 'package:shoop/pages/home/main_page.dart';
import 'package:shoop/pages/sign_in_page.dart';
import 'package:shoop/pages/sign_up_page.dart';
import 'package:shoop/pages/splash_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => SplashPage(),
        '/sign-in': (context) => SignInPage(),
        '/sign-up': (context) => SignUpPage(),
        '/home': (context) => MainPage()
      },
      // home: SplashPage(),
    );
  }
}
