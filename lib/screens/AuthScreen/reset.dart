import 'package:ecomtest/provider/auth.dart';
import 'package:ecomtest/screens/AuthScreen/login.dart';
import 'package:flutter/material.dart';


class ResetPage extends StatefulWidget {
  @override
  _ResetPageState createState() => _ResetPageState();
}
class _ResetPageState extends State<ResetPage> {

  bool isLoading=false;
  TextEditingController _email=TextEditingController();
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           title: Text('Reset Password'),

         ),
         body: isLoading==false ? Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               TextFormField(
                 controller: _email,
                 decoration: InputDecoration(
                   hintText: "Enter Email"
                 ),
               ),
               const SizedBox(height:30,
               ),
               FlatButton(onPressed: (){setState(() {
                 isLoading=true;
               });
                 AuthClass().restPassword(email: _email.text.trim(),)
                     .then((value) {
                   if (value == "Email sent") {
                     setState(() {
                       isLoading = false;
                     });
                     Navigator.pushAndRemoveUntil(
                         context,
                         MaterialPageRoute(
                             builder: (context) => LoginPage()),
                             (route) => false);
                   } else {
                     setState(() {
                       isLoading = false;
                     });
                     ScaffoldMessenger.of(context)
                         .showSnackBar(SnackBar(content: Text(value)));
                   }
                 });
               },
                   child: Text("Reset account")),
               SizedBox(
                 height: 20,
               ),
               GestureDetector(
                 onTap: () {
                   Navigator.push(context,
                       MaterialPageRoute(builder: (context) => LoginPage()));
                 },
                 child: Text("Already have an account? Login "),
               ),
             ],
           ),
         )
             : Center(child: CircularProgressIndicator()),
       );
     }
   }














