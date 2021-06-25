import 'package:cloud_firestore/cloud_firestore.dart';

class Cart{
String id;
dynamic ob;
int amount=1;
dynamic user;
String type;
String uid;
Cart({this.user,this.ob,this.amount,this.type,this.uid});
Cart.fromJson(DocumentSnapshot json){
  id=json.id;
  user=json["user"];
  ob=json["ob"];
  amount=json["amount"];
  type=json["type"];
  uid=json["uid"];
}
Map<String,dynamic> toJson(){


  return {"user":user,"ob":ob,"amount":amount,"type":type,"uid":uid};
}
 



}