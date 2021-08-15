import 'dart:html';

import 'package:ecomtest/services/auth.dart';
import 'package:ecomtest/screens/AuthScreen/register.dart';
import 'package:ecomtest/screens/splash.dart';
import 'package:ecomtest/widgets/MyLogo.dart';
import 'package:flutter/material.dart';

import '../../AllConsts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailUser = TextEditingController();
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool _secure=true;
  final _globalKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    return Scaffold(

      appBar: AppBar(
        title: Text('aya'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _globalKey,
          child: ListView(
            children: [
              CustomLogo(),
             SizedBox (height: height*0.1),
              Padding(
                padding: const EdgeInsets.all(50),
                child: TextFormField(

                  controller: _userName,
                  decoration: InputDecoration(
                   border: OutlineInputBorder(
                     borderSide: BorderSide(style: BorderStyle.solid,),
                   ),
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
                    suffixIcon: IconButton(
                      color: kMainColor,
                      onPressed: (){
                        setState(() {
                          _secure=!_secure;
                        });
                      },
                      icon: Icon(_secure?Icons.remove_red_eye:Icons.visibility_off),
                    ),
                    prefixIcon: Icon(Icons.lock,   color: kMainColor,),
                  ),
                  obscureText: _secure,
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
                    prefixIcon: Icon(Icons.email,color: Colors.teal,),
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
                        borderRadius: BorderRadius.circular(10)
                       ),
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
              SizedBox(height: height * 0.5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have account ? ',style: TextStyle(color: Colors.white,fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()),
                              );
                    },
                    child: Text('SignUp',style: TextStyle(fontSize: 16,color: Colors.black),

                  ),)
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
  void _validateForm(BuildContext context) async{


  }
}
