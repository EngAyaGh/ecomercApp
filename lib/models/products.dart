

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomtest/AllConsts.dart';

class productModel {
  late String price;
  late String nameprod;
  late String discreption;
 late String location;
 late String Id;
 late String category;
 late String quantity;
 late String im;
  productModel({
     this.im="",
    this.quantity="0",
    this.discreption="", this.nameprod="", this.price="",
    this.category="", this.Id="", this.location=""
  }
      );

factory productModel.fromSnapshot(QueryDocumentSnapshot doc) {

 return productModel
   (
     im:doc['images'],
     quantity:doc[kProductQuantity],
     discreption:doc[kProductDescription],
     nameprod:doc[kProductName],
     price:doc[kProductPrice],
     category:doc[kProductCategory],
     //Id:snap['id'],
     location:doc[kProductLocation]);
}
}