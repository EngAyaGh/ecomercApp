import 'package:ecomtest/AllConsts.dart';
import 'package:ecomtest/provider/modhud.dart';
import 'package:ecomtest/provider/products.dart';
import 'package:ecomtest/View/AuthScreen/login.dart';
import 'package:ecomtest/View/AuthScreen/register.dart';
import 'package:ecomtest/View/home.dart';
import 'package:ecomtest/View/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'View/home.dart';
import 'services/auth.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<modprogress>(create: (_) => modprogress()),
    ChangeNotifierProvider<ProductProvider>(create:(_)=>ProductProvider())
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  bool isUserLoggedIn = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            //Center(child: CircularProgressIndicator(),)
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: Text('Loading....'),
                ),
              ),
            );
          } else {
            isUserLoggedIn =
            snapshot.data!.getBool(kKeepMeLoggedIn) ?? false;

            return MaterialApp
              (
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                backgroundColor: Colors.teal,
              ),
              home: isUserLoggedIn ? HomePage() : HomePage(),
            );
          }
        }
    );
  }
}