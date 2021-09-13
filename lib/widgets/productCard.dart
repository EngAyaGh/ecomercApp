import 'package:ecomtest/models/products.dart';
import 'package:ecomtest/provider/products.dart';
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
    return Container(
      child: GestureDetector(
        onTap:(){},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,

          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Image.network(
                    'https://picsum.photos/250?image=9',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,

                  ),
                ),
              ),
              SizedBox(width: 10,),
              RichText(text:
              TextSpan(
                children: [
                  TextSpan(text: '${widget.product.nameprod} \n'),
                  TextSpan(text: '${widget.product.price} \n'),
                  TextSpan(text: '${widget.product.category} \n'),
                  TextSpan(text: '${widget.product.location} \n'),
                ],
                style: TextStyle(color: Colors.teal),
              )
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _productImage(String picture) {
    if (picture == null) {
      return Container(
        child: Text('No Image'),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            widget.product.im,
            height: 140,
            width: 120,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }
}
