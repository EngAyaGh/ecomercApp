import 'package:ecomtest/provider/modhud.dart';
import 'package:ecomtest/screens/AuthScreen/login.dart';
import 'package:ecomtest/screens/AuthScreen/register.dart';
import 'package:ecomtest/screens/home.dart';
import 'package:ecomtest/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/auth.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<modprogress>(create: (_)=>modprogress()),
      ],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        backgroundColor: Colors.teal,
      ),
      home: HomePage(),
    );
  }
}
