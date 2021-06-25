import 'package:flutter/material.dart';
import 'package:mandob/model/cart.dart';
import 'package:mandob/provider/cartprovider.dart';
//import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:mandob/provider/finishingprovider.dart';
import 'package:mandob/provider/userprovider.dart';
import 'package:mandob/widgets/customwidgets.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FinishingScreendetails extends StatelessWidget {
  int amount=1;
TextEditingController txt=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final finishing = Provider.of<FinishingProvider>(context, listen: false);
    var lp = finishing.finishing.pic;

    var desc = finishing.finishing.desc;
    var price = finishing.finishing.price;
    var cat = finishing.finishing.category;
    var worktype = finishing.finishing.worktype;
    final o=finishing.finishing;
    final key=GlobalKey<ScaffoldState>();
    finishing.finishing = null;
    print(price);

    return Scaffold(
      key:key,
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
                        child: Center(
                            child: Text("Finishing type :${worktype}"))))),
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
                        child: Center(child: Text("Price :${price}"))))),
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
                        child: Center(child: Text("category :${cat}"))))),
          ),


          
          Provider.of<UserProvider>(context, listen: false)
                      .userprofile
                      .jobtype ==
                  "Regular User"
              ? Column(
                children: [

                     Row(
                       children: [
Text(" No of meters:")
                         ,
                         ChangeNotifierProvider(create: (context){
            return AmountProvider();
          },child: Consumer<AmountProvider>(builder: (context,p,w){
 print("inc");
        p.amount;
print(amount);

return Row(children: [
 
SizedBox(
  height: 30,width: 70,
  child:   Container(
    color: Theme.of(context).backgroundColor,
    child: TextField(controller: txt,
    
    onChanged: (v){
    print(v);
    amount=int.parse(v);
    
    
    
    p.increment();
    
    
    
    }
    
    ,),
  ),
)
         
          ,
          Text("    TP:${amount*price} Eg")



],);

          })),
                       ],
                     )
,

                  custmoButton("Buy", ()async {
   var x=Provider.of<UserProvider>(context,listen: false).userprofile;
                    Cart ob=Cart(user: x.toJson(),ob:o.toJson(),amount: amount*price,type: "finishing",uid: Provider.of<UserProvider>(context,listen: false).userprofile.toJson()["uid"]);
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