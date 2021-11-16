import 'package:ecomtest/provider/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'productCard.dart';

class productView extends StatefulWidget {
  const productView({Key? key}) : super(key: key);

  @override
  _productViewState createState() => _productViewState();
}

class _productViewState extends State<productView> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    //productProvider.clear();
    //if (productProvider.products.length==0) productProvider.products.clear();
    productProvider.getsnap();

    print("Before the number of list product is ${productProvider.products.length}");
    return SingleChildScrollView(

        child: Padding(
            padding: const EdgeInsets.all(14),
            child: builderList(context, productProvider)));
  }

  Widget builderList(BuildContext context, ProductProvider pp) {

    print("the number of list product is ${pp.products.length}");

    return Container(
        height: MediaQuery.of(context).size.height/3,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: pp.products.length,
            itemBuilder: (context, index) {
              return productCard(product: pp.products[index]);
            }));
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
