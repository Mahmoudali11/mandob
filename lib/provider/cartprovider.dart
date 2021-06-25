import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:mandob/model/cart.dart';
import 'package:mandob/model/user.dart';

class CartProvider extends ChangeNotifier{
  Cart cart;
  FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  Future addToCart(Cart ob)async{
    firebaseFirestore.collection("Cart").add(ob.toJson());



  }


  Stream getCart(String s){


  return  firebaseFirestore.collection("Cart").where("uid",isEqualTo:s
     ).snapshots();
  }




}