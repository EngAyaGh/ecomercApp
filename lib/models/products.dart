
import 'package:flutter/cupertino.dart';

class product {
  double price;
  String nameprod;
  String discreption;
  String location;
  String Id;
  String category;
  int quantity;
  Image im;
  product(
      this.im,
      this.quantity,
      this.discreption,this.nameprod,this.price,
      this.category,this.Id,this.location
      );

}