import 'package:flutter/material.dart';

class CustomLogo extends StatelessWidget {
  const CustomLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        height: MediaQuery.of(context).size.height* .2,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image(image: AssetImage('images/icons/buy.png')),
            Positioned(
                bottom: 0,
                child: Text(
                  'ecommerce',
                  style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: 'Pacifico'),))
          ],
        ),
      ),
    );
  }
}

