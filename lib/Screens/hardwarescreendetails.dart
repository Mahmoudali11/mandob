import 'package:flutter/material.dart';
//import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:mandob/provider/hardwareprovider.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HardwareScreendetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final hardware = Provider.of<HardwareProvider>(context, listen: false);
    var lp = hardware.hardware.pic;

    var desc = hardware.hardware.desc;
    var price = hardware.hardware.price;
    var name = hardware.hardware.itemname;
    var iPrice = hardware.hardware.iprice;
        var cate = hardware.hardware.category;

    hardware.hardware = null;
    return Scaffold(
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
                width: double.infinity
                ,
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
                        child: Center(
                            child: Text("Category :$cate"))))),
          ),
        ],
      )),
    );
  }
}
