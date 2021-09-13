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
    return typeViewCard(context);
  }
  Widget listviewType(BuildContext context){
    final productProvider=Provider.of<ProductProvider>(context);
    productProvider.getsnap();
    return Container(
        height: 230,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: productProvider.products.length,
            itemBuilder: (context,index){
              return productCard(product: productProvider.products[index]);
  }));
  }
  Widget girdViewType(BuildContext context ){
    final productProvider=Provider.of<ProductProvider>(context);
  return  GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .8,
    ),
    itemBuilder:(context,index){
    return productCard(product: productProvider.products[index]);
    });
}
Widget typeViewCard(BuildContext context){
  final productProvider=Provider.of<ProductProvider>(context);
  return
    Column(
    children: productProvider.products
        .map((item) => GestureDetector(
      child: productCard(
        product: item,
      ),
    ))
        .toList(),
  );
}
}
