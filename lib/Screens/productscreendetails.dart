import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mandob/model/cart.dart';
import 'package:mandob/model/product.dart';
import 'package:mandob/provider/cartprovider.dart';
//import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:mandob/provider/productprovider.dart';
import 'package:mandob/provider/userprovider.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mandob/widgets/customwidgets.dart';

class ProductScreendetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context, listen: false);
    var lp = product.product.pic;
  int amount=1;
    var desc = product.product.desc;
    var price = product.product.price;
    var dt = product.product.dtime;
    var name = product.product.name;
    var wPrice = product.product.whprice;
    Product o=product.product;
    product.product = null;
    final key=GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: lp.map((e) {
                return e != null
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              e,
                              height: 150,
                              width: 150,
                              fit: BoxFit.fill,
                            )),
                      )
                    : Text('');
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        color: Theme.of(context).backgroundColor,
                        child: Center(child: Text("Name:$name"))))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft, child: Text("Describtion:")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1),
                  color: Theme.of(context).backgroundColor,
                ),
                width: double.infinity,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Text(desc),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        color: Theme.of(context).backgroundColor,
                        child: Center(child: Text("Sell Price :${price}"))))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        color: Theme.of(context).backgroundColor,
                        child: Center(
                            child: Text("WholeSome Price :${wPrice}"))))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
                alignment: Alignment.centerLeft,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        width: double.infinity,
                        height: 50,
                        color: Theme.of(context).backgroundColor,
                        child: Center(child: Text("Delivery Time :${dt}"))))),
          ),
          
                 

          Provider.of<UserProvider>(context, listen: false)
                      .userprofile
                      .jobtype ==
                  "Regular User"
              ? Column(
                children: [

                     Row(
                       children: [
Text(" Amount:")
                         ,
                         ChangeNotifierProvider(create: (context){
            return AmountProvider();
          },child: Consumer<AmountProvider>(builder: (context,p,w){
 print("inc");
        amount=p.amount;
print(amount);
return Row(children: [
  IconButton(icon: Icon(Icons.remove), onPressed:(){
            p.decrement();
          }),

          Text(p.amount.toString())
         ,
           IconButton(icon: Icon(Icons.add), onPressed:(){
            p.increment();
          }),
          Text("    Total:${amount*price}")



],);

          })),
                       ],
                     )
,
                  custmoButton("Buy", ()async {
   var x=Provider.of<UserProvider>(context,listen: false).userprofile;
                    Cart ob=Cart(user: x.toJson(),ob:o.toJson(),amount: amount,type: "product",uid: Provider.of<UserProvider>(context,listen: false).userprofile.toJson()["uid"]);
    await Provider.of<CartProvider>(context,listen: false).addToCart(ob);
    key.currentState.showSnackBar(SnackBar(content: Text("Done"),));


                  }, context, null, null),
                ],
              )
              : Text(''),
              SizedBox(height: 30,)
        ],
      )),
    );
  }
}
class AmountProvider extends ChangeNotifier{

  int amount=1;

  increment(){


    amount++;
    notifyListeners();

  }
  decrement(){
    if(amount>1)
    amount--;
    notifyListeners();
  }

}
