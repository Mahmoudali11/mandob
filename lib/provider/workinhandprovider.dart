import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mandob/Screens/workinghanditem.dart';
import 'package:mandob/model/workinghand.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class WorkingHandProvider extends ChangeNotifier{
WorkingHand workingHand;
File img;
String imgname;


FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
Future deleteResumee(String w)async{
 await firebaseFirestore.collection("workinghand").doc(w).delete();
 print("deleted");



}
Future gotToEdit(WorkingHand w,){

  workingHand=w;
  notifyListeners();
}



Future editResumee(String id,WorkingHand w) async{

  await firebaseFirestore.collection("workinghand").doc(id).update(w.toJson());
  

}

Future addHandWork(WorkingHand p)async{

    FirebaseStorage firebaseStorage=FirebaseStorage.instance;
  
   await  firebaseFirestore.collection("workinghand").add(p.toJson());
   notifyListeners();
 

}
Stream getItem(){
return  firebaseFirestore.collection("workinghand").snapshots();

}

 





}