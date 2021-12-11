import 'package:ecomtest/models/products.dart';
import 'package:ecomtest/provider/products.dart';
import 'package:ecomtest/widgets/productCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class productSearchView extends StatelessWidget {

  String pattern;
  productSearchView(this.pattern, {Key? key}) : super(key: key);

  //String get pattern => null;

  @override
  Widget build(BuildContext context) {
   //List<productModel> _listProductFilter= Provider.of<ProductProvider>(context).products;
    return Scaffold(

     appBar: AppBar(
        /*actions:<Widget> [
          IconButton(
              onPressed:()=> Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back))
        ],*/
      ),
      body:
   FutureBuilder(
      //initialData: Provider.of<ProductProvider>(context).products,
      future: Provider.of<ProductProvider>(context).searchProducts(pattern),
      builder: (BuildContext context,
    AsyncSnapshot<List<productModel>> _listProductFilter)  {
    if (_listProductFilter.hasData == true) {
      //print("${pattern}");
    return  Container(
        height: MediaQuery
        .of(context)
        .size
        .height / 3,
        child: ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount:_listProductFilter.data!.length,
      itemBuilder: (context, index) {
      //print("i will print ${_ListProduct.data!.docs[index]}");
      return productCard(
      product:_listProductFilter.data![index]);
      }));
    }
    else return Text("j");
      },
      )
    );
  }
}

