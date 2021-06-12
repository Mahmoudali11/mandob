import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandob/Screens/workinghanditem.dart';
import 'package:mandob/model/product.dart';
import 'package:mandob/model/workinghand.dart';
import 'package:mandob/provider/productprovider.dart';
import 'package:mandob/provider/uploaddata.dart';
import 'package:mandob/provider/workinhandprovider.dart';
import 'package:mandob/widgets/customwidgets.dart';
import 'package:mandob/widgets/customtextfield.dart';
import 'package:mandob/theme/fonticon.dart';
import 'package:provider/provider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class ProductScreen extends StatelessWidget {
  TextEditingController describtion = TextEditingController();
  TextEditingController price = TextEditingController();
    TextEditingController name= TextEditingController();
      TextEditingController deliverytime = TextEditingController();
      TextEditingController wholesomeprice=TextEditingController();


final imgurl="https://image.freepik.com/free-photo/paperboard-texture_95678-72.jpg";
  String img1;
  String img2;
  String img3;
  String img4;
  String img5;


  final skey = GlobalKey<ScaffoldState>();
  int i=0;
  
  @override
  Widget build(BuildContext context) {
      
        
final product=Provider.of<ProductProvider>(context);
if(product.product!=null&&i==0){


  name.text=product.product.name;
  wholesomeprice.text=product.product.whprice.toString();
  price.text=product.product.price.toString();
  deliverytime.text=product.product.dtime.toString();
  describtion.text=product.product.desc;
  img1=product.product.pic[0];
    img2=product.product.pic[1];
        img3=product.product.pic[2];

    img4=product.product.pic[3];
        img4=product.product.pic[4];



}
i++;

    // final workh1=Provider.of<WorkingHandProvider>(context);
    // final workh2=Provider.of<WorkingHandProvider>(context,listen: false);

    print("build working hand caled");

    return Scaffold(
        key: skey,
        appBar: AppBar(),
        body: product.product==null? Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                headerConten("Add new Product"),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Add Pic :",
                  style: textstyle2,
                  textAlign: TextAlign.center,
                ),
                // ignore: missing_required_param
                SizedBox(
                  height: 80,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                  children:[ChangeNotifierProvider(
                                    create: (context) {
                                      return UploadData();
                                    },
                                    child: Consumer<UploadData>(builder: (context, w, r) {
                                      return GestureDetector(
                                        child: sizedBoxImg(imgurl, 70, 70, w.img),
                                        onTap: () async {
                                          await w.chooseImage(ImageSource.gallery);
                                          img1 = await w.uploadFile();
                                        },
                                      );
                                    }),
                                  ),
                                    ChangeNotifierProvider(
                      create: (context) {
                                  return UploadData();
                      },
                      child: Consumer<UploadData>(builder: (context, w, r) {
                                  return GestureDetector(
                                    child: sizedBoxImg(imgurl, 70, 70, w.img),
                                    onTap: () async {
                                      await w.chooseImage(ImageSource.gallery);
                                      img2 = await w.uploadFile();
                                    },
                                  );
                      }),
                    ),
                      ChangeNotifierProvider(
                      create: (context) {
                                  return UploadData();
                      },
                      child: Consumer<UploadData>(builder: (context, w, r) {
                                  return GestureDetector(
                                    child: sizedBoxImg(imgurl, 70, 70, w.img),
                                    onTap: () async {
                                      await w.chooseImage(ImageSource.gallery);
                                      img3 = await w.uploadFile();
                                    },
                                  );
                      }),
                    ),
                      ChangeNotifierProvider(
                      create: (context) {
                                  return UploadData();
                      },
                      child: Consumer<UploadData>(builder: (context, w, r) {
                                  return GestureDetector(
                                    child: sizedBoxImg(imgurl, 70, 70, w.img),
                                    onTap: () async {
                                      await w.chooseImage(ImageSource.gallery);
                                      img4 = await w.uploadFile();
                                    },
                                  );
                      }),
                    ),
                      ChangeNotifierProvider(
                      create: (context) {
                                  return UploadData();
                      },
                      child: Consumer<UploadData>(builder: (context, w, r) {
                                  return GestureDetector(
                                    child: sizedBoxImg(imgurl, 70, 70, w.img),
                                    onTap: () async {
                                      await w.chooseImage(ImageSource.gallery);
                                      img5 = await w.uploadFile();
                                    },
                                  );
                      }),
                    )



                                  ],
                  ),
                ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                                            child: Text(
                          "Item Name:",
                          style: textstyle2,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  Spacer(),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            color: headercolor,
                            borderRadius: BorderRadius.circular(30)),
                        child: CustomeFormField(name, false,
                            "required", '', null, TextInputType.text, () {}))
                  ],
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                     alignment:Alignment.centerLeft,
                                    child: Text(
                      "Describtion:",
                      style: textstyle2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),                  
                                child: Container(
                            color: Theme.of(context).backgroundColor,
                    child: TextFormField(
                    controller: describtion
                    ,
                    maxLines: 5,


                    ),
                  ),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Unit Price:",
                        style: textstyle2,
                        textAlign: TextAlign.left,
                      ),
                      Spacer()
                     ,
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              color: headercolor,
                              borderRadius: BorderRadius.circular(30)),
                          child: CustomeFormField(price, false,
                              "required", '', null, TextInputType.text, () {}))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WholeSome Price:",
                        style: textstyle2,
                        textAlign: TextAlign.center,
                      ),
                                          Spacer()
,
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              color: headercolor,
                              borderRadius: BorderRadius.circular(30)),
                          child: CustomeFormField(wholesomeprice, false,
                              "required", '', null, TextInputType.text, () {}))
                    ],
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Delivery Time:",
                        style: textstyle2,
                        textAlign: TextAlign.center,
                      ),
                     Spacer(),
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              color: headercolor,
                              borderRadius: BorderRadius.circular(30)),
                          child: CustomeFormField(deliverytime, false,
                              "required", '', null, TextInputType.text, () {}))
                    ],
                ),
                 ),
                SizedBox(
                  height: 30,
                ),

                custmoButton("Confirm", () async {

                  final lstimg=[img1,img2,img3,img4,img5];
                  final p= Product(name: name.text,dtime:int.parse( deliverytime.text),whprice: double.parse(wholesomeprice.text),pic: lstimg,desc: describtion.text,price: int.parse(price.text));
                  Provider.of<ProductProvider>(context,listen: false).addProduct(p);
                 
                  skey.currentState.showSnackBar(
                      SnackBar(content: Text("data saved Successfully")));
                }, context,null,null),
              ],
            ),
          ),
        ) :
        /////////////////update
        Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                headerConten("Add new Product"),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Add Pic :",
                  style: textstyle2,
                  textAlign: TextAlign.center,
                ),
                // ignore: missing_required_param
                SizedBox(
                  height: 80,
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                  children:[ChangeNotifierProvider(
                                    create: (context) {
                                      return UploadData();
                                    },
                                    child: Consumer<UploadData>(builder: (context, w, r) {
                                      return GestureDetector(
                                        child: sizedBoxImg(product.product.pic[0]??imgurl, 70, 70, w.img),
                                        onTap: () async {
                                          await w.chooseImage(ImageSource.gallery);
                                          img1 = await w.uploadFile();
                                         await w.deleteImg(product.product.pic[0]);

                                        },
                                      );
                                    }),
                                  ),
                                    ChangeNotifierProvider(
                      create: (context) {
                                  return UploadData();
                      },
                      child: Consumer<UploadData>(builder: (context, w, r) {
                                  return GestureDetector(
                                    child: sizedBoxImg(product.product.pic[1]??imgurl, 70, 70, w.img),
                                    onTap: () async {
                                      await w.chooseImage(ImageSource.gallery);
                                      img2 = await w.uploadFile();
                                         await w.deleteImg(product.product.pic[1]);

                                    },
                                  );
                      }),
                    ),
                      ChangeNotifierProvider(
                      create: (context) {
                                  return UploadData();
                      },
                      child: Consumer<UploadData>(builder: (context, w, r) {
                                  return GestureDetector(
                                    child: sizedBoxImg(product.product.pic[2]??imgurl, 70, 70, w.img),
                                    onTap: () async {
                                      await w.chooseImage(ImageSource.gallery);
                                      img3 = await w.uploadFile();
                                        await w.deleteImg(product.product.pic[2]);

                                    },
                                  );
                      }),
                    ),
                      ChangeNotifierProvider(
                      create: (context) {
                                  return UploadData();
                      },
                      child: Consumer<UploadData>(builder: (context, w, r) {
                                  return GestureDetector(
                                    child: sizedBoxImg(product.product.pic[3]??imgurl, 70, 70, w.img),
                                    onTap: () async {
                                      await w.chooseImage(ImageSource.gallery);
                                      img4 = await w.uploadFile();
                                             await w.deleteImg(product.product.pic[3]);

                                    },
                                  );
                      }),
                    ),
                      ChangeNotifierProvider(
                      create: (context) {
                                  return UploadData();
                      },
                      child: Consumer<UploadData>(builder: (context, w, r) {
                                  return GestureDetector(
                                    child: sizedBoxImg(product.product.pic[4]??imgurl, 70, 70, w.img),
                                    onTap: () async {
                                      await w.chooseImage(ImageSource.gallery);
                                      img5 = await w.uploadFile();
                                      await w.deleteImg(product.product.pic[4]);
                                    },
                                  );
                      }),
                    )



                                  ],
                  ),
                ),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                                            child: Text(
                          "Item Name:",
                          style: textstyle2,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  Spacer(),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            color: headercolor,
                            borderRadius: BorderRadius.circular(30)),
                        child: CustomeFormField(name, false,
                            "required", '', null, TextInputType.text, () {}))
                  ],
                ),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                     alignment:Alignment.centerLeft,
                                    child: Text(
                      "Describtion:",
                      style: textstyle2,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),                  
                                child: Container(
                            color: Theme.of(context).backgroundColor,
                    child: TextFormField(
                    controller: describtion
                    ,
                    maxLines: 5,


                    ),
                  ),
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Unit Price:",
                        style: textstyle2,
                        textAlign: TextAlign.left,
                      ),
                      Spacer()
                     ,
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              color: headercolor,
                              borderRadius: BorderRadius.circular(30)),
                          child: CustomeFormField(price, false,
                              "required", '', null, TextInputType.text, () {}))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WholeSome Price:",
                        style: textstyle2,
                        textAlign: TextAlign.center,
                      ),
                                          Spacer()
,
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              color: headercolor,
                              borderRadius: BorderRadius.circular(30)),
                          child: CustomeFormField(wholesomeprice, false,
                              "required", '', null, TextInputType.text, () {}))
                    ],
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Delivery Time:",
                        style: textstyle2,
                        textAlign: TextAlign.center,
                      ),
                     Spacer(),
                      Container(
                          width: MediaQuery.of(context).size.width / 2,
                          decoration: BoxDecoration(
                              color: headercolor,
                              borderRadius: BorderRadius.circular(30)),
                          child: CustomeFormField(deliverytime, false,
                              "required", '', null, TextInputType.text, () {}))
                    ],
                ),
                 ),
                SizedBox(
                  height: 30,
                ),

                custmoButton("Confirm", () async {

                  final lstimg=[img1,img2,img3,img4,img5];
                  final p= Product(name: name.text,dtime:int.parse( deliverytime.text),whprice: double.parse(wholesomeprice.text),pic: lstimg,desc: describtion.text,price: int.parse(price.text));
                 await Provider.of<ProductProvider>(context,listen: false).editProduct(product.product.id,p);
                 
                  skey.currentState.showSnackBar(
                      SnackBar(content: Text("data saved Successfully")));
                }, context,null,null),
              ],
            ),
          ),
        ) 
      );
  }
}
