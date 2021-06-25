import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mandob/Screens/hardwarescreendetails.dart';
import 'package:mandob/Screens/placescreendetails.dart';
import 'package:mandob/Screens/productscreendetails.dart';
import 'package:mandob/Screens/workhanddetails.dart';
import 'package:mandob/model/cart.dart';
import 'package:mandob/model/finish.dart';
import 'package:mandob/model/hardware.dart';
import 'package:mandob/model/place.dart';
import 'package:mandob/model/product.dart';
import 'package:mandob/model/workinghand.dart';
import 'package:mandob/provider/cartprovider.dart';
import 'package:mandob/provider/finishingprovider.dart';
import 'package:mandob/provider/hardwareprovider.dart';
import 'package:mandob/provider/placeprovider.dart';
import 'package:mandob/provider/productprovider.dart';
import 'package:mandob/provider/userprovider.dart';
import 'package:mandob/provider/workinhandprovider.dart';
import 'package:mandob/theme/fonticon.dart';
import 'package:mandob/widgets/customwidgets.dart';
import 'package:provider/provider.dart';

import 'finishingscreendetails.dart';

final imgurl =
    "https://image.freepik.com/free-photo/paperboard-texture_95678-72.jpg";

class UserCart extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    print(Provider.of<UserProvider>(context,listen: false).userprofile.toJson());
    return Scaffold(

      appBar: AppBar(),
      body:Container(child: 

      StreamBuilder<QuerySnapshot>(
        stream: Provider.of<CartProvider>(context,listen: false).getCart(Provider.of<UserProvider>(context,listen: false).userprofile.toJson()["uid"])
        ,
        builder: (context,snapshot){

         if (snapshot.hasError) {
                    return Text(
                      'Something went wrong',
                      style: textstyle1,
                    );
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData && snapshot.data.docs.length <= 0) {
                    return Center(
                      child: Text(
                        "no items",
                        style: textstyle1,
                      ),
                    );
                  }

                  if (snapshot.hasData) {
                    return ListView(
                        children: snapshot.data.docs.map((e) {
                        final x=e["ob"];
                      final c = Cart.fromJson(e);
    var wi;

                      if(c.type=="product"){
                        wi=Product(pic: c.ob["pic"],price: c.ob["price"],name: c.ob["name"],dtime: c.ob["dtime"],whprice: c.ob["whprice"],desc: c.ob["desc"],uid: c.ob["uid"]);

                        
                      return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              //  width: MediaQuery.of(context).size.width*.9,

                              decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    child: Text(
                                      wi.name,
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0xffA6D8FF),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    //
                                  ),
                                  Container(
                                    // width: MediaQuery.of(context).size.width*.,
                                    width: double.infinity,
                                    height: 120,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            top: 16,
                                            left: 5,
                                            child: Image.network(
                                              getAv(wi.pic),
                                              fit: BoxFit.fill,
                                              width: 70,
                                              height: 70,
                                            )),
                                        Positioned(
                                          top: 15,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("Name: "),
                                              Text(wi.name)
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 34,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("Unit Price: "),
                                              Text(wi.price.toString())
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 52,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("wholesale price: "),
                                              Text(wi.whprice.toString())
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 70,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("Delivery Time: "),
                                              Text(
                                                  "${wi.dtime.toString()} Days")
                                            ],
                                          ),
                                        ),
                                         Positioned(
                                          top: 89,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("amount: "),
                                              Text(
                                                  "${c.amount}  ")
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          right: 5,
                                          bottom: 35,
                                          child: Column(
                                            children: [
                                              custmoButton("Details", () async {
                                                await Provider.of<ProductProvider>(context,listen: false).gotToEdit(wi);
                                                final route = MaterialPageRoute(
                                                    builder: (context) {
                                                  return ProductScreendetails();
                                                });
                                                Navigator.push(context, route);
                                              }, context, 80, 30),
                                              SizedBox(
                                                height: 3,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )));



                      }
////////////////////////////////////////////places
                      else if(c.type=="place"){
wi=Place(pic: c.ob["pic"],location: c.ob["location"],locationfrommap: c.ob["locationfrommap"],size: c.ob["size"],uid: c.ob["uid"],isrent: c.ob["isrent"],sprice: c.ob["sprice"],rprice: c.ob["rprice"]);

 return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              //  width: MediaQuery.of(context).size.width*.9,

                              decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    child: Text(
                                      wi.location,
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0xffA6D8FF),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                  ),
                                  Container(
                                    // width: MediaQuery.of(context).size.width*.,
                                    width: double.infinity,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            top: 15,
                                            left: 5,
                                            child: Image.network(
                                              getAv(wi.pic),
                                              fit: BoxFit.fill,
                                              width: 70,
                                              height: 70,
                                            )),
                                        Positioned(
                                          top: 10,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("Location: "),
                                              Text(wi.location)
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 30,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("Size: "),
                                              Text(wi.size.toString())
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 50,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("Rent price: "),
                                              Text(wi.rprice.toString())
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 70,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("Sell price: "),
                                              Text(wi.sprice.toString())
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          right: 5,
                                          bottom: 35,
                                          child: Column(
                                            children: [
                                              custmoButton("Details", () async {
                                                await Provider.of<PlacesProvider>(context,listen: false).gotToEdit(wi);

                                                final route = MaterialPageRoute(
                                                    builder: (context) {
                                                  return PlaceScreendetails();
                                                });
                                                Navigator.push(context, route);
                                              }, context, 80, 30),
                                              SizedBox(
                                                height: 3,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )));




                      }

                      else if(c.type=="hardware"){
wi=Hardware(uid: c.ob["uid"],pic: c.ob["pic"],price: c.ob["price"],iprice: c.ob["iprice"],category: c.ob["categorty"],desc: c.ob["desc"],itemname: c.ob["itemname"]);
                         return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              //  width: MediaQuery.of(context).size.width*.9,

                              decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    child: Text(
                                      wi.itemname,
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0xffA6D8FF),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    //
                                  ),
                                  Container(
                                    // width: MediaQuery.of(context).size.width*.,
                                    width: double.infinity,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            top: 15,
                                            left: 5,
                                            child: Image.network(
                                              getAv(wi.pic),
                                              fit: BoxFit.fill,
                                              width: 70,
                                              height: 70,
                                            )),
                                        Positioned(
                                          top: 20,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("Name: "),
                                              Text(wi.itemname)
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 40,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("Unit Price: "),
                                              Text(wi.price.toString())
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 60,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("installation price: "),
                                              Text(wi.iprice.toString())
                                            ],
                                          ),
                                        ),
                                         Positioned(
                                          top: 83,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("Amount: "),
                                              Text(c.amount.toString())
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          right: 5,
                                          bottom: 35,
                                          child: Column(
                                            children: [
                                              custmoButton("Details", () async {
                                                await Provider.of<HardwareProvider>(context,listen: false).gotToEdit(wi);
                                                final route = MaterialPageRoute(
                                                    builder: (context) {
                                                  return HardwareScreendetails();
                                                });
                                                Navigator.push(context, route);
                                              }, context, 80, 30),
                                              SizedBox(
                                                height: 3,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )));




                      }
                      else if(c.type=="workhand"){
                        wi=WorkingHand(uid: c.uid,cv: c.ob["cv"],pic: c.ob["cv"],work:c.ob["work"],salary: c.ob["salary"],);

 return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              //  width: MediaQuery.of(context).size.width*.9,

                              decoration: BoxDecoration(
                                  color: Theme.of(context).backgroundColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    child: Text(
                                    '',
                                      textAlign: TextAlign.center,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0xffA6D8FF),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20))),
                                    //
                                  ),
                                  Container(
                                    // width: MediaQuery.of(context).size.width*.,
                                    width: double.infinity,
                                    height: 100,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            top: 15,
                                            left: 5,
                                            child: Image.network(
                                              wi.pic ?? imgurl,
                                              fit: BoxFit.fill,
                                              width: 70,
                                              height: 70,
                                            )),
                                        Positioned(
                                          top: 35,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("Expected Salary: "),
                                              Text(wi.salary.toString())
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top: 55,
                                          left: 77,
                                          child: Row(
                                            children: [
                                              Text("Preferible field: "),
                                              Text(wi.work)
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          right: 5,
                                          bottom: 35,
                                          child: Column(
                                            children: [
                                              custmoButton("Details", () async {
                                                await Provider.of<WorkingHandProvider>(context,listen: false).gotToEdit(wi);
                                                final route = MaterialPageRoute(
                                                    builder: (context) {
                                                  return WorkingHandDetails();
                                                });
                                                Navigator.push(context, route);
                                              }, context, 80, 30),
                                              SizedBox(
                                                height: 3,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )));
                           


                      }
                      else if(c.type=="finishing"){

                        wi=Finishing(category: c.ob["categorty"],pic: c.ob["pic"],desc: c.ob["desc"],uid: c.uid,
                        price: c.ob["price"],worktype: c.ob["worktype"]);
                       return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                //  width: MediaQuery.of(context).size.width*.9,

                                decoration: BoxDecoration(
                                    color: Theme.of(context).backgroundColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      child: Text(
                                        wi.worktype,
                                        textAlign: TextAlign.center,
                                      ),
                                      decoration: BoxDecoration(
                                          color: Color(0xffA6D8FF),
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20))),
                                      //
                                    ),
                                    Container(
                                      // width: MediaQuery.of(context).size.width*.,
                                      width: double.infinity,
                                      height: 100,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                              top: 15,
                                              left: 5,
                                              child: Image.network(
                                                getAv(wi.pic),
                                                fit: BoxFit.fill,
                                                width: 70,
                                                height: 70,
                                              )),
                                          Positioned(
                                            top: 20,
                                            left: 77,
                                            child: Row(
                                              children: [
                                                Text("Finishing Type: "),
                                                Text(wi.worktype)
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                            top: 42,
                                            left: 77,
                                            child: Row(
                                              children: [
                                                Text("price/meter: "),
                                                Text(wi.price.toString())
                                              ],
                                            ),
                                          ),
                                        
                                          Positioned(
                                            right: 5,
                                            bottom: 35,
                                            child: Column(
                                              children: [
                                                custmoButton("Details",
                                                    () async {
                                                  await Provider.of<FinishingProvider>(context,listen: false).gotToEdit(wi);
                                                  final route =
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return FinishingScreendetails();
                                                  });
                                                  Navigator.push(
                                                      context, route);
                                                }, context, 80, 30),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )));




                      }
                         


                    }).toList());
                  }
          




        }
      
      
      
      
      
      ,)
      
      
      ,),
      
    );
  }
}
 String getAv(List nn) {
    for (var n in nn) {
      if (n != null) {
        return n;
      }
    }

    return imgurl;
  }

