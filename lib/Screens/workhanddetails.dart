 
import 'package:flutter/material.dart';
import 'package:mandob/provider/workinhandprovider.dart';
import 'package:provider/provider.dart';
class WorkingHandDetails extends StatelessWidget {
  final imgurl =
      "https://image.freepik.com/free-photo/paperboard-texture_95678-72.jpg";
      


  @override
  Widget build(BuildContext context) {

    final workh=Provider.of<WorkingHandProvider>(context,listen: false);

    var pic=workh.workingHand.pic;
    var cv=workh.workingHand.cv;
    var sa=workh.workingHand.salary;
    var wo=workh.workingHand.work;
    workh.workingHand=null;
         return Scaffold(
      appBar: AppBar(),
      body:SingleChildScrollView(
        child: Column(children: [

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(backgroundImage: NetworkImage(pic??imgurl),radius: 70,),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.centerLeft,child: Text("CV")),
          ),
          
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(child: Container(child: Image.network(cv??imgurl,fit: BoxFit.fill,),width: double.infinity,height: 100,),borderRadius: BorderRadius.circular(30),),
          )


,
 Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.centerLeft,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Container(width: double.infinity,height: 50,color: Theme.of(context).backgroundColor,child: Center(child: Text("Work Type :${wo}"))))),
          ),


Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.centerLeft,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Container(width: double.infinity,height: 50,color: Theme.of(context).backgroundColor,child: Center(child: Text("Salary :${sa} EG"))))),
          ),






        ],),


      ) ,
    );
  }
}