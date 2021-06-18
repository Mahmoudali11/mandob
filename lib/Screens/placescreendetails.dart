import 'package:flutter/material.dart';
 //import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:google_maps_place_picker/providers/place_provider.dart';
import 'package:mandob/provider/placeprovider.dart';
import 'package:provider/provider.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
 class PlaceScreendetails extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final place=Provider.of<PlacesProvider>(context,listen: false);
    var lp=place.place.pic;
    var lat=place.place.locationfrommap.split("/")[1];
    var lng=place.place.locationfrommap.split("/")[2];

   var desc=place.place.desc;
   var sp=place.place.sprice;
   var rp=place.place.rprice;
   var s=place.place.size;
  var isr=place.place.isrent;
 List<Marker> x= [ Marker(markerId: MarkerId("werw"),position: LatLng(double.parse(lat),double
       .parse(lng)),infoWindow:InfoWindow(title: place.place.locationfrommap+"/"+place.place.location))];
  place.place=null;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(child: 

      Column(children: [
   SizedBox(
     height: 150,
        child: ListView(scrollDirection: Axis.horizontal,children: lp.map((e) {
return e!=null? Padding(
  padding: const EdgeInsets.all(8.0),
  child:   ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.network(e,height: 150,width: 150,fit: BoxFit.fill,)),
):Text('');


     }).toList()

     ,),
   ),
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: SizedBox(
       height: 200,
          child: GoogleMap(
            markers: Set.of(x),
          initialCameraPosition: CameraPosition(target: LatLng(double.parse(lat),double
         .parse(lng)),zoom: 3),
         myLocationEnabled: true,

       ),
     ),
   ),
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: Align(alignment: Alignment.centerLeft,child: Text("Describtion:")),
   )
   ,
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: ClipRRect(
       borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(border: Border.all(color:Colors.black,width: 1)
                  ,   color: Theme.of(context).backgroundColor,

              ),
                              width: double.infinity,

         
         height: 
 
       100,
       child: Padding(
         padding: const EdgeInsets.all(8.0),
         child: SingleChildScrollView(
           child: Text(desc),
         ),

       )
       ,),
     ),
   ),
    Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.centerLeft,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Container(width: double.infinity,height: 50,color: Theme.of(context).backgroundColor,child: Center(child: Text("Sell Price :${sp}"))))),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.centerLeft,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Container(width: double.infinity,height: 50,color: Theme.of(context).backgroundColor,child: Center(child: Text("rent Price :${rp}"))))),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.centerLeft,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Container(width: double.infinity,height: 50,color: Theme.of(context).backgroundColor,child: Center(child: Text(isr?"For Rent":"For Sell"))))),
          ),
 Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(alignment: Alignment.centerLeft,child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Container(width: double.infinity,height: 50,color: Theme.of(context).backgroundColor,child: Center(child: Text("Size:$s"))))),
          ),





      ],)
      ),
    );
  }
}