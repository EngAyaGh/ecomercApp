import 'package:ecomtest/services/auth.dart';
import 'package:ecomtest/provider/modhud.dart';
import 'package:ecomtest/View/AuthScreen/login.dart';
import 'package:flutter/material.dart';
import 'package:ecomtest/widgets/MyLogo.dart';
import 'package:ecomtest/widgets/MyTextFormField.dart';
import 'package:ecomtest/widgets/passtextForm.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../splash.dart';
class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> MyKey=GlobalKey<FormState>();
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailUser = TextEditingController();
  TextEditingController _userName = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;

    return Scaffold(
      //backgroundColor: Colors.cyan,
      appBar: AppBar(backgroundColor: Colors.teal, title: Text('register'),),
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<modprogress>(context).isLoading,
        child: Form(
          key:widget.MyKey ,
          child: ListView(
            children: [
              CustomLogo(),
              SizedBox(height: height* .2,),
              CustomTextField(
                mode: 'u',
                  icon: Icons.account_box,
                  hint: "Enter your name",
                  con: _userName),
              SizedBox(height: height* .2,),
              CustomTextField(
                  mode: 'e',
                  icon: Icons.email,
                  hint: "Enter your email",
                  con: _emailUser),
              SizedBox(height: height* .2,),
              PasswordFieldTextForm(
                  icon: Icons.lock,
                  hint: "Enter your password",
                  con: _password
              ),
              SizedBox(height: height* .2,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FlatButton(
                  textColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          color: Colors.teal,
                          style: BorderStyle.solid,
                          width: 2.0)
                    ),
                    color: Colors.teal,
                    onPressed: () async {
                    Provider.of<modprogress>(context,listen: false).changeLoad(true);
                    if(widget.MyKey.currentState!.validate()){
                      String ss=_userName.text.trim();
                      print('before $ss');
                      widget.MyKey.currentState!.save();
                      ss=_userName.text.trim();
                      print('after $ss');

                      await AuthClass()
                          .createAccount(
                          email: _emailUser.text.trim(),
                          Pass: _password.text.trim())
                          .then((value) async {
                        if (value == 'Done') {
                          SharedPreferences preferences  = await SharedPreferences.getInstance();
                        preferences.setBool('loginstate', true);
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
                    }
else{
  Provider.of<modprogress>(context,listen: false).changeLoad(false);
                    }
Provider.of<modprogress>(context,listen: false).changeLoad(false);
                    },

                    child:Text('Sign Up')),
              ),
              SizedBox(height: height* .2,),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You Have account ? '),
                    GestureDetector(
                        onTap: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                        MaterialPageRoute(
                            builder: (context)=> LoginPage()), (route) => false
                          );
                        },
                        child: Text('Login')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
