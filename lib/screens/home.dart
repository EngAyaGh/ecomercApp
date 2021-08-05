import 'package:ecomtest/provider/auth.dart';
import 'package:ecomtest/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //String? email =FirebaseAuth.instance.currentUser!.email;
  TextEditingController _emailUser = TextEditingController();
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        title: Text('aya'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(50),
                child: TextFormField(
                  controller: _userName,
                  decoration: InputDecoration(
                    hintText: 'Enter User Name',
                    prefixIcon: Icon(Icons.account_box),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: TextFormField(
                  controller: _password,
                  decoration: InputDecoration(
                    hintText: 'Enter Password',
                    prefixIcon: Icon(Icons.password),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50),
                child: TextFormField(
                  controller: _emailUser,
                  style: TextStyle(color: Colors.black),
                  cursorColor: Colors.teal,
                  decoration: InputDecoration(
                    hintText: 'Enter Email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                          color: Colors.teal,
                          width: 2.0,
                          style: BorderStyle.solid),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.teal,
                            style: BorderStyle.solid,
                            width: 2.0),
                        borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.black12,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.teal,
                            style: BorderStyle.solid,
                            width: 2.0)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),

                // ignore: deprecated_member_use
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: () async {

                    await AuthClass()
                        .createAccount(
                            email: _emailUser.text.trim(),
                            Pass: _password.text.trim())
                        .then((value) {
                      if (value == 'Done') {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Splash()),
                            (route) => false);
                      } else{
                        print(value);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(value),
                        ));
                      }
                    });
                  },
                  child: Text('Register'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.teal,
                  child: Text('login'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () async {
                    print(_emailUser.text);
                    await AuthClass()
                        .login(
                            email: _emailUser.text.trim(),
                            Pass: _password.text.trim())
                        .then((value) {
                      if (value == 'Done') {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Splash()),
                            (route) => false);
                      } else
                        {
                          print(value);

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(value),
                        ));
                        }
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
