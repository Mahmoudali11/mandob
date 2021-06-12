 
 
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mandob/Screens/ProductScreenItem.dart';
import 'package:mandob/Screens/SliderPage.dart';
import 'package:mandob/Screens/placescreenitem.dart';
import 'package:mandob/Screens/productscreen.dart';
import 'package:mandob/Screens/workinghand.dart';
import 'package:mandob/Screens/workinghanditem.dart';
import 'package:mandob/model/user.dart';
import 'package:mandob/model/workinghand.dart';
import 'package:mandob/provider/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:mandob/Screens/placescreen.dart';

import 'HomeScreen.dart';
 

/// This is the stateful widget that the main application instantiates.
class AppNaigation extends StatefulWidget {
 
  @override
  State<AppNaigation > createState() => _AppNaigationState();
}

 class _AppNaigationState extends State<AppNaigation > {
  int _selectedIndex = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _list = <Widget>[

  
  Center(child: CircularProgressIndicator()),
    Center(child: CircularProgressIndicator()),



   
  ];
   
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {

    Future.delayed(Duration(seconds: 1),()async{


      
 FirebaseAuth auth=FirebaseAuth.instance;
  Users users= await Provider.of<UserProvider>(context,listen: false).getUserData(auth.currentUser.uid);
 List listItem = [
    "Broker",
    "Finishing Worker",
    "Hardware Supplier",
    "Goods Supplier",
    "Working Hand"
  ];

if(users.jobtype==listItem[3]){


 _list=[Center(child: Text("Notifications")),ProductScreenItme(),ProductScreen()];
 }

 else if(users.jobtype==listItem[4]){

 _list=[Center(child: Text("Notifications")),WorkingHandItme(),WorkingHandScreen(),];
 }
 else if(users.jobtype==listItem[0]){

 _list=[Center(child: Text("Notifications")),PlaceScreenItem(),PlaceSceen()];
 }
 else{
 _list=[Center(child: Text("Notifications")),HomeScreen()];

     
  }
  



    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
  Provider.of<UserProvider>(context);
    print("called");
    return Scaffold(
    
      
      body: Center(
        child: _list.elementAt(_selectedIndex),
      ),
      bottomNavigationBar:  ConvexAppBar(
            items: [
              TabItem(icon: Icons.notifications, title: 'Notificatio'),
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.add, title: 'Add'),
            ],
            initialActiveIndex: 1, //optional, default as 0
            onTap: (int i) {
             

              _onItemTapped(i);
            }),
      
    );
  }
}
