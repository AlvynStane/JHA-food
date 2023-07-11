import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testing/pages/front_page/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashScreenDelay = 3;

  void navigationToNextPage() {
    Timer(Duration(seconds: splashScreenDelay), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Login(),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    navigationToNextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('logo.png'),
              width: 200,
              height: 200,
            ),
            Text('JHA FOOD',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            SizedBox(height: 24),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
