import 'package:flutter/material.dart';
import 'package:lcadp/pages/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Arrecadador",
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
