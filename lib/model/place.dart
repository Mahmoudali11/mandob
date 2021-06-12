 
 
import 'package:cloud_firestore/cloud_firestore.dart';
    class Place{

double rprice;
List<dynamic>pic;
String desc;
String id;
 double sprice;
int size;
String location;
String locationfrommap;
bool isrent;

Place({this.pic,this.sprice,this.rprice,this.location,this.isrent,this.locationfrommap,this.desc,this.size});
Place.fromJson(DocumentSnapshot json){

  sprice=json["sprice"];
  pic=json["pic"];
  rprice=json["rprice"];
   desc=json["desc"];
  location=json["location"];
  size=json["size"];
  locationfrommap=json["locationfrommap"];
  isrent=json["isrent"];

  id=json.id;

}
Map<String,dynamic> toJson(){

return {"sprice":sprice,"pic":pic,"rprice":rprice,"location":location,"locationfrommap":locationfrommap,"size":size,"desc":desc,"isrent":isrent};

}

}