import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3));
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.teal),
      body: Center(
        child: FlutterLogo(size:80),
    ),
    );
  }
}
