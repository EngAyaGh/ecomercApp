

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomtest/AllConsts.dart';

class productModel {
  late double price;
  late String nameprod;
  late String discreption;
 late String location;
 late String Id;
 late String category;
 late int quantity;
 late Image im;

  productModel(
      this.im,
      this.quantity,
      this.discreption,this.nameprod,this.price,
      this.category,this.Id,this.location
      );

productModel.fromSnapshot(DocumentSnapshot snap) {
  this.discreption=snap[kProductDescription];
  this.location=snap[kProductLocation];
  this.category=snap[kProductCategory];
  this.nameprod=snap[kProductName];
  this.price=snap[kProductPrice];
  this.im=snap['images'];
  this.quantity=snap[kProductQuantity];
}
}