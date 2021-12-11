import 'package:cloud_firestore/cloud_firestore.dart';

import 'cart.dart';

class UserModel {
  static const ID = "uid";
  static const NAME = "name";
  static const EMAIL = "email";
  static const STRIPE_ID = "stripeId";
  static const CART = "cart";


  late String _name;
  late String _email;
  late String _id;
  late String _stripeId;
  int _priceSum = 0;


//  getters
  String get name => _name;

  String get email => _email;

  String get id => _id;

  String get stripeId => _stripeId;

  // public variables
  late List<CartItemModel> cart;
  late int totalCartPrice;



   UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot[NAME];
    _email = snapshot[EMAIL];
    _id = snapshot[ID];
    //_stripeId = snapshot[STRIPE_ID] ?? "";
    cart = _convertCartItems(snapshot[CART]?? []);
    totalCartPrice = snapshot[CART] == null ? 0 :getTotalPrice(cart: snapshot[CART]);

  }

  List<CartItemModel> _convertCartItems(List cart){
    List<CartItemModel> convertedCart = [];
    for(Map cartItem in cart){
      convertedCart.add(CartItemModel.fromMap(cartItem));
    }
    return convertedCart;
  }

  int getTotalPrice( {required List cart}){
    if(cart == null){
      return 0;
    }else
      {
    for(Map cartItem in cart){
      _priceSum += 0;//cartItem!["price"];
    }
   }

    int total = _priceSum;
    return total;
  }
}
