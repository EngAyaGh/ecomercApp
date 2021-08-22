
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomtest/models/products.dart';
import 'package:ecomtest/services/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider extends ChangeNotifier {
  late APIServices _api;
  late List<productModel> products;

//Future<List<productModel>> getProducts() async {
  // List<productModel> products = [];
  // await _api.getDataCollection().then((element) {
  //for (QuerySnapshot product in element) {
  //   products.add(productModel.fromSnapshot(product));}
  // return products;
  // });return products;}
  Future< List<productModel> > getdata() async {
    //var result=await _api.getDataCollaction();

    return products;
  }
}


