 
 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mandob/Screens/LoginPage.dart';
import 'package:mandob/Screens/productscreen.dart';
import 'package:mandob/Screens/workinghand.dart';
import 'package:mandob/model/product.dart';
import 'package:mandob/model/workinghand.dart';
import 'package:mandob/provider/productprovider.dart';
import 'package:mandob/provider/uploaddata.dart';
import 'package:mandob/provider/userprovider.dart';
import 'package:mandob/provider/workinhandprovider.dart';
import 'package:mandob/widgets/customtextfield.dart';
import 'package:mandob/widgets/customwidgets.dart';
import 'package:provider/provider.dart';
import 'package:mandob/theme/fonticon.dart';

class ProductScreenItme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("hi from item ");
    final workh = Provider.of<ProductProvider>(context);
    final userdata = Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(child: Column(children: [
        SizedBox(height: 50,),
      GestureDetector(onTap: ()async{
await FirebaseAuth.instance.signOut();
final route=MaterialPageRoute(builder: (context){
  return LoginPage();
});
Navigator.pushReplacement(context, route);

      },
              child: Row(children: [

        Icon(Icons.exit_to_app,color: Colors.red,),Text("logout")


        ],),
      )

      ],),),
      body: Column(
        children: [
                                   headerConten("Your Product")

         ,
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.7,
            child: StreamBuilder<QuerySnapshot>(
              stream: workh.getItem(),
              builder: (context, snapshot) {
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
                    final wi = Product.fromJson(e);
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
                                    "Product",
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
                                          top: 5,
                                          left: 5,
                                          child: Image.network(
                                            wi.pic[0],
                                            fit: BoxFit.fill,
                                            width: 70,
                                            height: 70,
                                          )),
                                      Positioned(
                                        top: 5,
                                        left: 77,
                                        child: Row(
                                          children: [
                                            Text("Name:"),
                                            Text(wi.name)
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: 30,
                                        left: 77,
                                        child: Row(
                                          children: [
                                            Text("Price:"),
                                            Text(wi.price.toString())
                                          ],
                                        ),
                                      ),
                                         Positioned(
                                        top: 60,
                                        left: 77,
                                        child: Row(
                                          children: [
                                            Text("WholeSale Price:"),
                                            Text(wi.whprice.toString())
                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        right: 5,
                                        child: Column(
                                          children: [
                                            custmoButton("Details", (){}, context, 80, 30)
                                            ,  SizedBox(height: 3,),

                                            
                                            custmoButton(
                                                "Edit", () async{

                                                  await workh.gotToEdit(wi);

                    final route =MaterialPageRoute(builder: (context){

                      return  ProductScreen();
                    });
Navigator.push(context, route);

                                                }, context, 70, 30),
                                                SizedBox(height: 3,),
                                                  custmoButton(
                                                "Delete", () async{
                                                  print("delete btn pressed");
 
 
                              
 await workh.deleteProduct(wi.id);
  await Provider.of<UploadData>(context,listen: false).deleteImg(wi.pic[0]);
    await Provider.of<UploadData>(context,listen: false).deleteImg(wi.pic[1]);
  await Provider.of<UploadData>(context,listen: false).deleteImg(wi.pic[2]);
  await Provider.of<UploadData>(context,listen: false).deleteImg(wi.pic[3]);
  await Provider.of<UploadData>(context,listen: false).deleteImg(wi.pic[4]);

 
  print("delted");
  


                                                }, context, 80, 30),
                                                
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )));
                  }).toList());
                }
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar:  ConvexAppBar(
            items: [
              TabItem(icon: Icons.notifications, title: 'Notificatio'),
              TabItem(icon: Icons.home, title: 'Home'),
              TabItem(icon: Icons.add, title: 'Add'),
            ],
            initialActiveIndex: 1, //optional, default as 0
            onTap: (int i) {
              var route;
              if (i == 2) {
                route = MaterialPageRoute(builder: (cotext) {
                  return ProductScreen();
                });
             Navigator.push(context, route);

              }
            }),
    );
  }
}
