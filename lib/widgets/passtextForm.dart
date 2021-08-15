import 'package:ecomtest/services/Validating.dart';
import 'package:ecomtest/widgets/MyTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:ecomtest/widgets/MyTextFormField.dart';

import '../AllConsts.dart';
// ignore: must_be_immutable
class PasswordFieldTextForm extends  StatefulWidget  {
  final String hint;
  final IconData icon;
  TextEditingController con;

  PasswordFieldTextForm(
      {required this.hint,required this.icon, required this.con});

  @override
  State<StatefulWidget> createState() =>
      _myfieldPassState();
}
class _myfieldPassState extends State<PasswordFieldTextForm>{
  bool _secure=true;
  @override
  Widget build(BuildContext context) {
    //super.build(context);
  return  Padding(
padding: const EdgeInsets.symmetric(horizontal: 30),
    child: TextFormField(
      validator: (val) => validating().validAll('p',val!),
      controller: widget.con,
      decoration: InputDecoration(
        filled: true,
        fillColor: kSecondaryColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.white)),
      hintText: widget.hint,
      suffixIcon: IconButton(
      color: kMainColor,
      onPressed: (){
      setState(() {
      _secure=!_secure;
      });
      },
      icon: Icon(_secure?Icons.remove_red_eye:Icons.visibility_off),
      ),
      prefixIcon: Icon(widget.icon,   color: kMainColor,),
      ),
      obscureText: _secure,

    ),
  );
  }
  }

