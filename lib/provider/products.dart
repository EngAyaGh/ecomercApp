
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomtest/models/products.dart';
import 'package:ecomtest/services/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import '../AllConsts.dart';

class ProductProvider extends ChangeNotifier {
  late APIServices _api;
  late List<productModel> products=[];
  ProductProvider(){
  this._api=APIServices(kProductsCollection);

  }
//Future<List<productModel>> getProducts() async {
  // List<productModel> products = [];
  // await _api.getDataCollection().then((element) {
  //for (QuerySnapshot product in element) {
  //   products.add(productModel.fromSnapshot(product));}
  // return products;
  // });return products;}
  //Future< List<productModel> > getdata() async {
    //var result=await _api.getDocuments('path');
    //products= result.data().map((e) => productModel.fromSnapshot(e.data())).toList();
    //1return products;}

  Future< List<productModel> > getsnap() async {
    //productModel mn;
    var result=await _api.getDataCollection()
        .then( (querySnapshot) => {
    querySnapshot.docs.forEach((doc) =>
     products.add( productModel.fromSnapshot(doc))
    )
  });
    notifyListeners();
    return products;
  }

}


