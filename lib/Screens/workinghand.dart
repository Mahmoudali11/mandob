import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandob/Screens/workinghanditem.dart';
import 'package:mandob/model/workinghand.dart';
import 'package:mandob/provider/uploaddata.dart';
import 'package:mandob/provider/workinhandprovider.dart';
import 'package:mandob/widgets/customwidgets.dart';
import 'package:mandob/widgets/customtextfield.dart';
import 'package:mandob/theme/fonticon.dart';
import 'package:provider/provider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class WorkingHandScreen extends StatelessWidget {
  TextEditingController worktype = TextEditingController();
  TextEditingController expetedSalary = TextEditingController();
final imgurl="https://image.freepik.com/free-photo/paperboard-texture_95678-72.jpg";
  var img1;
  var img2;
  final skey = GlobalKey<ScaffoldState>();
  int i=0;
  
  @override
  Widget build(BuildContext context) {
      final workh=Provider.of<WorkingHandProvider>(context,listen: false).workingHand;
      print(workh??"null now");
      if(i==0&&workh!=null){

        print("caled");
  worktype.text=workh.work;
          expetedSalary.text=workh.salary.toString();
      }
      i++;
        


    // final workh1=Provider.of<WorkingHandProvider>(context);
    // final workh2=Provider.of<WorkingHandProvider>(context,listen: false);

    print("build working hand caled");

    return Scaffold(
        key: skey,
        appBar: AppBar(),
        body:  workh==null? Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                headerConten("Working Hand"),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Add Pic :",
                  style: textstyle2,
                  textAlign: TextAlign.center,
                ),
                // ignore: missing_required_param
                ChangeNotifierProvider(
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
                Text(
                  "CV :",
                  style: textstyle2,
                  textAlign: TextAlign.center,
                ),
                ChangeNotifierProvider(
                  create: (context) {
                    return UploadData();
                  },
                  child: Consumer<UploadData>(builder: (context, w, r) {
                    return GestureDetector(
                      child: sizedBoxImg(
                          imgurl, double.infinity, 100, w.img),
                      onTap: () async {
                        await w.chooseImage(ImageSource.gallery);
                        img2 = await w.uploadFile();
                      },
                    );
                  }),
                ),
                Text(
                  "preferable Working field",
                  style: textstyle2,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, top: 30, bottom: 33),
                  child: Container(
                      decoration: BoxDecoration(
                          color: headercolor,
                          borderRadius: BorderRadius.circular(30)),
                      child: CustomeFormField(worktype, false, "required", '',
                          Icons.search, TextInputType.text, () {})),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Expected Salary:",
                      style: textstyle2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            color: headercolor,
                            borderRadius: BorderRadius.circular(30)),
                        child: CustomeFormField(expetedSalary, false,
                            "required", '', null, TextInputType.text, () {}))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                custmoButton("Confirm", () async {
                  final workingh = WorkingHand();

                  await Provider.of<WorkingHandProvider>(context, listen: false)
                      .addHandWork(WorkingHand(
                          pic: img1,
                          cv: img2,
                          work: worktype.text,
                          salary: int.parse(expetedSalary.text)));

                  skey.currentState.showSnackBar(
                      SnackBar(content: Text("data saved Successfully")));
                }, context,null,null),
              ],
            ),
          ),
        ):Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                headerConten("Working Hand"),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "Add Pic :",
                  style: textstyle2,
                  textAlign: TextAlign.center,
                ),
                // ignore: missing_required_param
                ChangeNotifierProvider(
                  create: (context) {
                    return UploadData();
                  },
                  child: Consumer<UploadData>(builder: (context, w, r) {
                    return GestureDetector(
                      child: sizedBoxImg(workh.pic, 70, 70, w.img),
                      onTap: () async {
                        await w.chooseImage(ImageSource.gallery);
                        img1 = await w.uploadFile();
                      await  Provider.of<UploadData>(context,listen: false).deleteImg(workh.pic);
                      },
                    );
                  }),
                ),
                Text(
                  "CV :",
                  style: textstyle2,
                  textAlign: TextAlign.center,
                ),
                ChangeNotifierProvider(
                  create: (context) {
                    return UploadData();
                  },
                  child: Consumer<UploadData>(builder: (context, w, r) {
                    return GestureDetector(
                      child: sizedBoxImg(
                          workh.cv, double.infinity, 100, w.img),
                      onTap: () async {
                        await w.chooseImage(ImageSource.gallery);
                        img2 = await w.uploadFile();
                         await  Provider.of<UploadData>(context,listen: false).deleteImg(workh.cv);

                      },
                    );
                  }),
                ),
                Text(
                  "preferable Working field",
                  style: textstyle2,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 50, right: 50, top: 30, bottom: 33),
                  child: Container(
                      decoration: BoxDecoration(
                          color: headercolor,
                          borderRadius: BorderRadius.circular(30)),
                      child: CustomeFormField(worktype, false, "required", '',
                          Icons.search, TextInputType.text, () {})),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Expected Salary:",
                      style: textstyle2,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width / 2,
                        decoration: BoxDecoration(
                            color: headercolor,
                            borderRadius: BorderRadius.circular(30)),
                        child: CustomeFormField(expetedSalary, false,
                            "required", '', null, TextInputType.text, () {}))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),

                custmoButton("Edit", () async {
                  final workingh = WorkingHand();


                  await Provider.of<WorkingHandProvider>(context, listen: false)
                      .editResumee(workh.id,WorkingHand(
                          pic: img1??workh.pic,
                          cv: img2??workh.cv,
                          work: worktype.text,
                          salary: int.parse(expetedSalary.text)));

   await Provider.of<WorkingHandProvider>(context,listen: false).gotToEdit(null);
                  skey.currentState.showSnackBar(
                      SnackBar(content: Text("data saved Successfully")));
                }, context,null,null),
              ],
            ),
          ),
        ),
      );
  }
}
