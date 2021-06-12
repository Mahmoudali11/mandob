import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
  class Hardware{

int price;
List<dynamic>pic;
String desc;
String id;
String name;
int uprice;
String category;

Hardware({this.name,this.pic,this.price,this.category,this.desc,this.uprice});
Hardware.fromJson(DocumentSnapshot json){
  price=json["price"];
  pic=json["pic"];
  uprice=json["uprice"];
  name=json["name"];
  desc=json["desc"];
 
  id=json.id;

}
Map<String,dynamic> toJson(){

//return {"price":price,"pic":pic,"name":name,"whprice":whprice,"dtime":dtime,"desc":desc};

}

}