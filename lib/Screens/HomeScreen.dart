import 'package:flutter/material.dart';
import 'package:mandob/model/finish.dart';
import 'package:mandob/model/hardware.dart';
import 'package:mandob/model/place.dart';
import 'package:mandob/model/product.dart';
import 'package:mandob/widgets/mandoblogo_icons.dart';
import '../provider/placeprovider.dart';
import 'package:provider/provider.dart';
import '../provider/userprovider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'LoginPage.dart';
import '../provider/finishingprovider.dart';
import '../provider/hardwareprovider.dart';
import '../provider/productprovider.dart';

final imgurl =
    "https://image.freepik.com/free-photo/paperboard-texture_95678-72.jpg";

class UserHomePage extends StatefulWidget {
  @override
  _UserHomePageState createState() => _UserHomePageState();
}

//
class _UserHomePageState extends State<UserHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final placesfitcher = Provider.of<PlacesProvider>(context);
    final finishingfitcher = Provider.of<FinishingProvider>(context);
    final hardwarefitcher = Provider.of<HardwareProvider>(context);
    final productsfitcher = Provider.of<ProductProvider>(context);

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color.fromRGBO(244, 243, 243, 1),
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(30))),
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Easier Life',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 25),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                'With Mandob',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 15.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage("lib/Images/car-oil.png")),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(244, 243, 243, 1),
                                borderRadius: BorderRadius.circular(15)),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black87,
                                  ),
                                  hintText: "Searching for something ?",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 15)),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Popular Places',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 15,
                          ),

//start of spawning Scroll View

                          Container(
                            child: StreamBuilder<QuerySnapshot>(
                                stream: placesfitcher.getItem(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    print("Error Getting Places");
                                    return Text(
                                      'Something went wrong',
                                    );
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  if (snapshot.hasData &&
                                      snapshot.data.docs.length <= 0) {
                                    print("Data Found but no data there");
                                    return Center(
                                      child: Text(
                                        "no items",
                                      ),
                                    );
                                  }

                                  if (snapshot.hasData) {
                                    print("Data found and will be viewed Now");
                                    return Container(
                                      width: double.infinity,
                                      height: 200,
                                      child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: snapshot.data.docs.map((e) {
                                            final placesextracted =
                                                Place.fromJson(e);
                                            return promoCard(
                                                getAv(placesextracted.pic),
                                                placesextracted.location);
                                          }).toList()),
                                    );
                                  }
                                }),
                          ),

//End of spawning Scroll View

                          SizedBox(
                            height: 15,
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Popular Finishing Work',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 15,
                          ),

//Start of Finishing Scroll View

                          Container(
                            child: StreamBuilder<QuerySnapshot>(
                                stream: finishingfitcher.getItem(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    print("Error Getting Places");
                                    return Text(
                                      'Something went wrong',
                                    );
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  if (snapshot.hasData &&
                                      snapshot.data.docs.length <= 0) {
                                    print("Data Found but no data there");
                                    return Center(
                                      child: Text(
                                        "no items",
                                      ),
                                    );
                                  }

                                  if (snapshot.hasData) {
                                    print("Data found and will be viewed Now");
                                    return Container(
                                      width: double.infinity,
                                      height: 200,
                                      child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: snapshot.data.docs.map((s) {
                                            final finishingextracted =
                                                Finishing.fromJson(s);
                                            return promoCard(
                                                getAv(finishingextracted.pic),
                                                finishingextracted.worktype);
                                          }).toList()),
                                    );
                                  }
                                }),
                          ),

// separator

                          SizedBox(
                            height: 15,
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Popular Hardware Suppliers',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 15,
                          ),

// separator

//Start of Hardware Scroll View

                          Container(
                            child: StreamBuilder<QuerySnapshot>(
                                stream: hardwarefitcher.getItem(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    print("Error Getting Places");
                                    return Text(
                                      'Something went wrong',
                                    );
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  if (snapshot.hasData &&
                                      snapshot.data.docs.length <= 0) {
                                    print("Data Found but no data there");
                                    return Center(
                                      child: Text(
                                        "no items",
                                      ),
                                    );
                                  }

                                  if (snapshot.hasData) {
                                    print("Data found and will be viewed Now");
                                    return Container(
                                      width: double.infinity,
                                      height: 200,
                                      child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: snapshot.data.docs.map((s) {
                                            final hardwareextracted =
                                                Hardware.fromJson(s);
                                            return promoCard(
                                                getAv(hardwareextracted.pic),
                                                hardwareextracted.itemname);
                                          }).toList()),
                                    );
                                  }
                                }),
                          ),

// separator

                          SizedBox(
                            height: 15,
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Popular Products Suppliers',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ]),
                          ),
                          SizedBox(
                            height: 15,
                          ),

// separator

//start of product

                          Container(
                            child: StreamBuilder<QuerySnapshot>(
                                stream: productsfitcher.getItem(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    print("Error Getting Places");
                                    return Text(
                                      'Something went wrong',
                                    );
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                  if (snapshot.hasData &&
                                      snapshot.data.docs.length <= 0) {
                                    print("Data Found but no data there");
                                    return Center(
                                      child: Text(
                                        "no items",
                                      ),
                                    );
                                  }

                                  if (snapshot.hasData) {
                                    print("Data found and will be viewed Now");
                                    return Container(
                                      width: double.infinity,
                                      height: 200,
                                      child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: snapshot.data.docs.map((s) {
                                            final productsextracted =
                                                Product.fromJson(s);
                                            return promoCard(
                                                getAv(productsextracted.pic),
                                                productsextracted.name);
                                          }).toList()),
                                    );
                                  }
                                }),
                          ),
                        ])),
              ],
            ),
          ),
        ));
  }

//Start of PromoCard
  Widget promoCard(image, String displayinfo) {
    return AspectRatio(
      aspectRatio: 2.62 / 3,
      child: Stack(children: [
        Container(
          margin: EdgeInsets.only(right: 15.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(image)),
          ),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                  0.1,
                  0.9
                ], colors: [
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.1)
                ])),
          ),
        ),
        Positioned(
          right: 2,
          bottom: -2,
          child: FloatingActionButton(
              child: Text(
                "View",
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: Colors.blue[100],
              onPressed: () {
                print("i was pressed");
              }),
        ),
        Positioned(
          child: Container(
            padding: EdgeInsets.all(7),
            color: Colors.blue[100],
            child: Text(
              displayinfo,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        )
      ]),
    );
  } //End of PromoCard

  String getAv(List nn) {
    for (var n in nn) {
      if (n != null) {
        return n;
      }
    }

    return imgurl;
  }
}
