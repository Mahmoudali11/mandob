import 'package:flutter/material.dart';
import "package:mandob/theme/fonticon.dart";
import 'dart:io';
Padding headerConten(String title) {
    return Padding(
            padding: const EdgeInsets.only(left:16.0,right: 16,top: 30),
            child: Container(child: Center(child: Text(title,style: textstyle1,)),
            decoration: BoxDecoration(color: headertitle,borderRadius: BorderRadius.circular(30)),
            height: 35,
            
            
            ),
          );
  }
   Padding sizedBoxImg(String imgpath,double width,double height,File imgfile) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
              width: width,
              height: height,
              child: Container(child: imgfile==null? Image.network(imgpath,fit: BoxFit.fill):Image.file(imgfile,fit:  BoxFit.fill,),
              
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(20)
              ),

               
              
              ),
            ),
    );
    
    }
    
Widget custmoButton(String txt,Function function,BuildContext context,double width,double heigt){



  return SizedBox(
    height:heigt?? 40,
    width: width??100,
      child: RaisedButton(onPressed:function, child: Text(txt,style: textstyle2.copyWith(color:Colors.green),),
shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

color:Colors.white,

      ),
      
      
      
      
  );
}