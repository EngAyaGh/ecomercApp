import 'package:ecomtest/models/products.dart';
import 'package:ecomtest/provider/products.dart';
import 'package:ecomtest/screens/product_details.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class productCard extends StatefulWidget {
  final productModel product;
  const productCard({Key? key, required this.product}) : super(key: key);

  @override
  _productCardState createState() => _productCardState();
}

class _productCardState extends State<productCard> {
  @override
  Widget build(BuildContext context) {
    return newproductview(context);
  }

  Widget oldViewProd(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ProductDetails()));
            },
            child: Container(
              width: MediaQuery.of(context).size.width /3,
              margin: EdgeInsets.only(right: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 15.0,
                    color: Colors.black87.withOpacity(0.05),
                  ),
                ],
                color: Colors.red,
              ),
              child: Column(
                children: [
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          child: Image.network(
                            //widget.product.im,
                            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
                            height: 150,
                            width: 150,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          child: Container(
                            height: 25,
                            width: 70,
                            margin: EdgeInsets.only(left: 5, top: 5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                gradient: LinearGradient(colors: [
                                  const Color(0xff8EA2FF).withOpacity(0.5),
                                  const Color(0xff557AC7).withOpacity(0.5)
                                ])),
                            child: Text(
                              widget.product.price,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            height: 50,

                            width: 100,
                            color: Colors.amber,
                            //padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  widget.product.nameprod,
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 19),
                                ),
                                Text(
                                  widget.product.category,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  widget.product.location,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Container(
                                  height: 10,
                                  padding: EdgeInsets.symmetric(horizontal: 12),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      gradient: LinearGradient(colors: [
                                        const Color(0xff8EA2FF),
                                        const Color(0xff557AC7)
                                      ])),
                                  child: Text(
                                    "Add to cart",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget padding(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          widget.product.im,
          //"https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
          height: 150,
          width: 150,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget richtext(BuildContext context) {
    return RichText(
        text: TextSpan(
      children: [
        TextSpan(text: '${widget.product.nameprod} \n'),
        TextSpan(text: '${widget.product.category} \n'),
        TextSpan(text: '${widget.product.location} \n'),
      ],
      style: TextStyle(color: Colors.teal),
    ));
  }

  Future<Widget> _productImage(String picture) async {
    if (picture == null) {
      return Container(
        child: Text('No Image'),
      );
    } else {
      final ref = FirebaseStorage.instance.ref().child(widget.product.im);
// no need of the file extension, the name will do fine.
      var url = await ref.getDownloadURL();
      /*  FutureBuilder(
          future: _productImage(widget.product.im),
          builder: (BuildContext context, AsyncSnapshot<Widget> snap) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: snap.data,
            );
          }), */
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            url,
            height: 140,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  Widget newproductview(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 10),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => ProductDetails()));
        },
        child: Container(
          width: MediaQuery.of(context).size.width /3,
          margin: EdgeInsets.only(right: 13),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 15.0,
                color: Colors.black87.withOpacity(0.05),
              ),
            ],
            color: Colors.white30
          ),
          child: Column(

            children: [
              Container(
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:8.0),
                      child: Positioned(

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            //widget.product.im,
                            "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",

                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height/4,
                            width: MediaQuery.of(context).size.width/3,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Opacity(
                        opacity: .8,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          color: Colors.grey,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  //crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [

                                    Text(
                                      widget.product.nameprod,
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    Text('\$ ${widget.product.price}'),
                                  ],
                                ),
                                Text(widget.product.location)


                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
