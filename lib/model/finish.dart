import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class Finishing {
  int price;
  List<dynamic> pic;
  String desc;
  String id;
  String worktype;
  String category;

  Finishing({this.pic, this.price, this.category, this.desc, this.worktype});
  Finishing.fromJson(DocumentSnapshot json) {
    price = json["price"];
    pic = json["pic"];
    desc = json["desc"];
    worktype = json["worktype"];
    id = json.id;
    category=json["categorty"];
  }

  Map<String, dynamic> toJson() {
    return {
      "price": price,
      "pic": pic,
      "worktype": worktype,
      "categorty": category,
      "desc": desc
    };
  }
}
