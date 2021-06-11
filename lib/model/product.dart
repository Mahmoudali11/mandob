import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
  class Product{

int price;
List<dynamic>pic;
String desc;
String id;
String name;
double whprice;
int dtime;

Product({this.name,this.pic,this.price,this.whprice,this.dtime,this.desc});
Product.fromJson(DocumentSnapshot json){
  price=json["price"];
  pic=json["pic"];
  whprice=json["whprice"];
  name=json["name"];
  desc=json["desc"];
  dtime=json["dtime"];

  id=json.id;

}
Map<String,dynamic> toJson(){

return {"price":price,"pic":pic,"name":name,"whprice":whprice,"dtime":dtime,"desc":desc};

}

}