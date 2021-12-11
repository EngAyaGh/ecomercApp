
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
  String collection = "products";
  ProductProvider(){
  this._api=APIServices(kProductsCollection);
  //getsnap();
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

  Stream<List<productModel> > getsnap() async* {

    yield* await  _api.getStreamDataCollection()
          .map((snap) => snap.docs
          .map((doc) => productModel.fromSnapshot(doc) )
          .toList());
            //);
      /*  .then( (querySnapshot) => {
    querySnapshot.docs.forEach((doc) =>
     products.add( productModel.fromSnapshot(doc))
    )*/
  //});
   // notifyListeners();
    //return [...products];
    print("hhdjsadjsgdjsaj");
  }
  void clear() {
    products = [];
    notifyListeners();
  }

  Future<List<productModel>> searchProducts( String productName) async {
    // code to convert the first character to uppercase
    String searchKey = productName[0].toUpperCase() + productName.substring(1);
    clear();
    await _api.searchDocuments(productName, "nameProd").then((value) {
      value.docs.forEach((element) {
        products.add(productModel.fromSnapshot(element));
      });
    });
    //if (products.isNotEmpty)
    print("${products.length}");
      return products;
  }
}
  /*
        .then((result) {
    List<productModel> products = [];
    for (DocumentSnapshot product in result.documents) {
    products.add(productModel.fromSnapshot(product));
    }
    return products;
    });
       */




