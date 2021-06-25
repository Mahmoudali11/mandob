import 'package:flutter/material.dart';
import 'package:mandob/model/cart.dart';
import 'package:mandob/provider/cartprovider.dart';
//import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:mandob/provider/hardwareprovider.dart';
import 'package:mandob/provider/userprovider.dart';
import 'package:mandob/widgets/customwidgets.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HardwareScreendetails extends StatelessWidget {
  int amount=1;
  @override
  Widget build(BuildContext context) {
    final hardware = Provider.of<HardwareProvider>(context, listen: false);
    var lp = hardware.hardware.pic;

    var desc = hardware.hardware.desc;
    var price = hardware.hardware.price;
    var name = hardware.hardware.itemname;
    var iPrice = hardware.hardware.iprice;
    var cate = hardware.hardware.category;
final o=hardware.hardware;
 final key=GlobalKey<ScaffoldState>();
    hardware.hardware = null;

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
                height: 100,
                width: double.infinity,
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
                        child: Center(child: Text("Unit Price :${price}"))))),
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
                            child: Text("Installation Price :${iPrice}"))))),
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
                        child: Center(child: Text("Category :$cate"))))),
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
          Text("    TP:${amount*price} Eg ,IP:${amount*iPrice}Eg")



],);

          })),
                       ],
                     )
,
                  custmoButton("Buy", ()async {
   var x=Provider.of<UserProvider>(context,listen: false).userprofile;
                    Cart ob=Cart(user: x.toJson(),ob:o.toJson(),amount: amount,type: "hardware",uid: Provider.of<UserProvider>(context,listen: false).userprofile.toJson()["uid"]);
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
