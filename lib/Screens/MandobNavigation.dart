import 'package:flutter/material.dart';
import 'package:mandob/Screens/UserProducts.dart';
import 'package:mandob/Screens/UserWorkingHands.dart';
import 'package:mandob/model/workinghand.dart';
import 'package:provider/provider.dart';
import '../provider/userprovider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'LoginPage.dart';
import '../widgets/mandoblogo_icons.dart';
import 'package:mandob/widgets/customwidgets.dart';
import 'package:textfield_search/textfield_search.dart';
import 'UserPLaces.dart';
import 'UserHardware.dart';
import 'UserFinishing.dart';

class MandobNavigation extends StatefulWidget {
  @override
  _MandobNavigationState createState() => _MandobNavigationState();
}

class _MandobNavigationState extends State<MandobNavigation> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _category = TextEditingController();

  List cat = ['car', 'mobile', 'clothes'];
  String categoryChoice;
  var _imageFile;

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.

    _category.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _category.addListener(() {
      categoryChoice = _category.text;
      print("My value is ${categoryChoice} Now !");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          RaisedButton(
            focusColor: Colors.yellow[400],
            color: Colors.blue[400],
            elevation: 10,
            onPressed: () {
              print("Mandob Logo Clicked");
            },
            child: Icon(Mandoblogo.mandoblogo),
          ),
        ],
        backgroundColor: Colors.blue[400],
        brightness: Brightness.light,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.black87,
          ),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                final route = MaterialPageRoute(builder: (context) {
                  return LoginPage();
                });
                Navigator.pushReplacement(context, route);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                  ),
                  Text("logout")
                ],
              ),
            )
          ],
        ),
      ),
      body: Container(
            decoration: BoxDecoration(
        image: DecorationImage(
      image: _imageFile == null
          ? AssetImage('lib/Images/Mandobman2.png')
          : FileImage(_imageFile),
      fit: BoxFit.cover,
            )),
          // height: double.infinity,
            child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
      color: Colors.black26,
      borderRadius: BorderRadius.all(Radius.circular(30))),
          padding: EdgeInsets.all(5),
          child: Center(
            child: Text(
      'Choose your interest ',
      style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          child: Text('Places suppliers'),
          color: Colors.green[200],
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0))),
          onPressed: () {
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserPlaces()),
            );
          },
        ),
        RaisedButton(
          child: Text('Finishing Work '),
          color: Colors.green[200],
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0))),
          onPressed: () {
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserFinishing()),
            );
          },
        ),
        RaisedButton(
          child: Text('Hardware Supplier'),
          color: Colors.green[200],
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0))),
          onPressed: () {
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserHardware()),
            );
          },
        ),
        RaisedButton(
          child: Text('Products suppliers'),
          color: Colors.green[200],
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0))),
          onPressed: () {
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserProduct()),
            );
          },
        ),
        RaisedButton(
          child: Text('Working Hands'),
          color: Colors.green[200],
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0))),
          onPressed: () {
            Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UserWorkingHands()),
            );
          },
        ),
        Padding(
          padding: const EdgeInsets.all(1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
      Container(
          width: MediaQuery.of(context).size.width / 2,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30)),
          child: TextFieldSearch(
            label: "required category",
            controller: _category,
            initialList: cat,
          )),
            ],
          ),
        ),
      ],
            ),
          ),
     );
  }
}
