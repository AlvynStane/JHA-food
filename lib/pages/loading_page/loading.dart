import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testing/pages/front_page/login/login.dart';

void main() {
  runApp(Loading());
}

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
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
          builder: (context) => Login(),
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
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('JHA FOOD',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 50,
                    fontWeight: FontWeight.bold)),
            SizedBox(height: 24),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
