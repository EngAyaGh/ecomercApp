import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomtest/models/products.dart';
import 'package:ecomtest/provider/products.dart';
import 'package:ecomtest/services/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../AllConsts.dart';
import '../widgets/productCard.dart';

class productView extends StatefulWidget {
  const productView({Key? key}) : super(key: key);

  @override
  _productViewState createState() => _productViewState();
}

class _productViewState extends State<productView> {
  @override
  Widget build(BuildContext context) {
    //final productProvider = Provider.of<ProductProvider>(context);
    //productProvider.clear();
    //if (productProvider.products.length==0) productProvider.products.clear();
    //productProvider.getsnap();

    //print("Before the number of list product is ${productProvider.products.length}");
    return SingleChildScrollView(

        child: Padding(
            padding: const EdgeInsets.all(14),
            child: builderList(context)
        )
    );
  }

  Widget builderList(BuildContext context) {
    late APIServices _api=APIServices(kProductsCollection);;

    //print("the number of list product is ${pp.products.length}");
    return StreamBuilder(
        stream: _api.getStreamDataCollection(),
            /*.map((snap) => snap.docs
            .map((doc) => productModel.fromSnapshot(doc) )
            .toList()),*///Provider.of<ProductProvider>(context).getsnap(),
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot> _ListProduct) {
          if (_ListProduct.hasData == true) {
            return
              Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 3,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: _ListProduct.data!.docs.length,
                      itemBuilder: (context, index) {
                        return productCard(
                            product:productModel.fromSnapshot(_ListProduct.data!.docs[index]));
                      }));
          }else return CircularProgressIndicator();
        });
  }
  Widget girdViewType(BuildContext context, ProductProvider pp) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .8,
        ),
        itemBuilder: (context, index) {
          return productCard(product: pp.products[index]);
        });
  }

  Widget typeViewCard(BuildContext context, ProductProvider pp) {
    return Column(
      children: pp.products
          .map((item) => GestureDetector(
                child: productCard(
                  product: item,
                ),
              ))
          .toList(),
    );
  }
}
