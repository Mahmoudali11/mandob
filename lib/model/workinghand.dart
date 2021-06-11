import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mandob/Screens/workinghand.dart';
class WorkingHand{

int salary;
String pic;
String cv;
String work;
String id;

WorkingHand({this.cv,this.pic,this.salary,this.work});
WorkingHand.fromJson(DocumentSnapshot json){
  salary=json["salary"];
  cv=json["cv"];
  work=json["work"];
  pic=json["pic"];
  id=json.id;

}
Map<String,dynamic> toJson(){

return {"salary":salary,"pic":pic,"cv":cv,"work":work};

}

}