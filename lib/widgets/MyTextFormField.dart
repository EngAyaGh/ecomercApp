
import 'package:ecomtest/AllConsts.dart';
import 'package:flutter/material.dart';
import 'package:ecomtest/services/Validating.dart';
class CustomTextField extends StatefulWidget {
 final String hint;
  final IconData icon;
  final TextEditingController con;
  String mode;

  CustomTextField(
      { required this.icon,
        required this.hint,
        required this.con,
required this.mode,


      } );
  @override
  State<StatefulWidget> createState() =>
      _myCustomState( );
}

class _myCustomState extends State<CustomTextField>{

  String _errorMessage(String str) {

    switch (widget.hint) {
      case 'Enter your name':
        return 'Name is empty !';
      case 'Enter your email':
        return 'Email is empty !';
      case 'Enter your password':
        return 'Password is empty !';
      default:  return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return   Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: TextFormField(

            validator: (val) => validating().validAll(widget.mode,val!),
            controller: widget.con,
            decoration: InputDecoration(
              hintText:widget. hint,
              prefixIcon: Icon(
                widget.icon,
                color: kMainColor,
              ),
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
            ),
          ),


    );
}}


