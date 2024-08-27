import 'dart:io';

import 'package:facebook/B-LOGIC/fireStore.dart';
import 'package:facebook/ui-ux/protifile.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../theme/color.dart';

class FormUser extends StatefulWidget {
  const FormUser({Key? key}) : super(key: key);

  @override
  State<FormUser> createState() => _FormUserState();
}

class _FormUserState extends State<FormUser> {
  String firstname="";
  String lastname="";
  String username="";
  String userimg="";
  String dateOfBirth="";
  String country="";
  String city="";
  String code="";
  String phonenumber="";
  bool isOld=false;
  bool getimage=false;
  File? file;
  String?url;
  TextEditingController title=TextEditingController();
  uploadImageCamera()async{
    ImagePicker picker=ImagePicker();

    XFile? image=await picker.pickImage(source: ImageSource.camera);


    if(image!=null){
      setState(() {
        getimage=true;
        file=File(image.path);
      });
      var imagename=basename(image.path);

      var metaData=SettableMetadata(
          contentType: 'image.jpeg'
      );
      var ref=await FirebaseStorage.instance.ref("posts/$imagename");
      await ref.putFile(file!,metaData);
      url=await ref.getDownloadURL();

      print(url);
    }
  }
  uploadImageGallery()async{
    ImagePicker picker=ImagePicker();

    XFile? image=await picker.pickImage(source: ImageSource.gallery);


    if(image!=null){
      setState(() {
        getimage=true;
        file=File(image.path);
      });
      var imagename=basename(image.path);

      var metaData=SettableMetadata(
          contentType: 'image.jpeg'
      );
      var ref=await FirebaseStorage.instance.ref("posts$imagename");
      await ref.putFile(file!,metaData);
      url=await ref.getDownloadURL();

      print(url);
    }
  }

  Widget uploadWay(){
    return       Container(
      width: 280.w,
      height: 200.h,
      decoration: BoxDecoration(
        color: AppColor.bckgroungcolor,
        border: Border.all(
          color: AppColor.quantarycolor,
          width: 2.w,
        ),
      ),
      child: Center(
          child: Row(
            children: [
              SizedBox(
                width: 10.w,
              ),
              GestureDetector(
                onTap: () async {
                  await uploadImageGallery();
                },
                child: Container(
                  height: 70.h,
                  width: 120.w,

                  decoration: BoxDecoration(
                    color: AppColor.quantarycolor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Icon(Icons.image, size: 40, color: AppColor.bckgroungcolor),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Add from gallery',
                        style: TextStyle(
                            color: AppColor.bckgroungcolor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              GestureDetector(
                onTap: ()  async{
                  await uploadImageCamera();
                },
                child: Container(
                  height: 70.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    color: AppColor.quantarycolor,
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Icon(Icons.camera,
                          size: 40, color: AppColor.bckgroungcolor),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Add from Camera',
                        style: TextStyle(
                            color: AppColor.bckgroungcolor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.quantarycolor,
        title: Text("User Information",style: TextStyle(
            color: AppColor.bckgroungcolor
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            getimage?
            GestureDetector
              (
              onTap: (){

              },
              child: CircleAvatar(
                radius: 50.r,
                backgroundImage:FileImage(file!),
              ),
            ):
            GestureDetector(
              onTap: (){
                SmartDialog.show(builder: (context){
                  return uploadWay();
                });
              },
              child: CircleAvatar(
                radius: 50.r,
                  backgroundImage:NetworkImage("https://i.imgur.com/zZR7pS9.png"),
              ),
            ),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Container(
                  width: 150.w,
                  child: FastTextField(
                    onChanged: (value){
                      setState(() {
                        firstname=value!;
                      });
                    },
                    style: TextStyle(
                      color: Colors.black
                    ),
                    name: 'field_destination',
                    labelText: 'First Name',
                    placeholder: 'Where are you going?',
                  ),
                ),
                SizedBox(width: 20.w,),
                Container(
                  width: 150.w,
                  child: FastTextField(
                    style: TextStyle(
                        color: Colors.black
                    ),
                    onChanged: (value){
                      setState(() {
                        lastname=value!;
                      });
                    },
                    name: 'field_destination',
                    labelText: 'Last Name',
                    placeholder: 'Last Name',
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Container(
              width: 300.w,
              child: FastTextField(
                style: TextStyle(
                    color: Colors.black
                ),
                onChanged: (value){
                  setState(() {
                    username=value!;
                  });
                },
                name: 'field_destination',
                labelText: 'User Name',
                placeholder: 'User name',
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              width: 300.w,
              child: FastDatePicker(

                onChanged: (value){
                  setState(() {
                    dateOfBirth=value!.toString();
                  });
                },
                name: 'date_picker',
decoration: InputDecoration(counterStyle: TextStyle(
  color: Colors.black
)
),
                labelText: 'Date of Birth',

                firstDate: DateTime(1970),
                lastDate: DateTime(2040),
              ),
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Expanded(
                  child: Container(

                    child: FastDropdown(


                      onChanged: (value){
                        setState(() {
                          country=value!;
                        });
                      },
                      name: 'Country',
                      labelText: 'Dropdown Field',
                      style: TextStyle(
                          color: Colors.black
                      ),
                      items: ['Norway', 'Sweden', 'Egypt',
                        'Denmark', 'Iceland'],
                      initialValue: 'Egypt',
                    ),
                  ),
                ),
                SizedBox(width: 10.h,),
                Expanded(
                  child: Container(

                    child: FastDropdown(

                      onChanged: (value){
                        setState(() {
                          city=value!;
                        });
                      },
                      name: 'City',
                      labelText: 'Dropdown Field',
                      style: TextStyle(
                          color: Colors.black
                      ),
                      items: ['Cairo', 'Alexandria', 'Giza', 'Benha', 'Matrouh'],
                      initialValue: 'Benha',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    child: FastDropdown(
                      onChanged: (value){
                        setState(() {
                          code=value!;
                        });
                      },
                      name: 'Code',
                      labelText: 'Code',
                      style: TextStyle(
                          color: AppColor.primarycolor
                      ),
                      items: ['+020', '+97', '+93', '213', '85'],
                      initialValue: '+020',
                    ),
                  ),
                ),
                SizedBox(width: 10.h,),
                Expanded(
                  child: Container(
                    child:FastTextField(
                      onChanged: (value){
                        setState(() {
                          phonenumber=value!;
                        });
                      },
                      style: TextStyle(color: Colors.black),
                      name: 'Phone',
                      labelText: 'Phone',
                      placeholder: 'phone',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Container(
              width: 300.w,
              child: FastSwitch(
                onChanged: (value){
                  setState(() {
                    isOld=value!;
                  });
                },
                name: 'switch',
                labelText: 'Switch',
                titleText: 'Are you old 16',
                contentPadding: EdgeInsets.fromLTRB(8.0, 0, 0, 0),
              ),
            ),
            SizedBox(height: 20.h,),
            ElevatedButton(

                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.quantarycolor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)
                    )
                ),
                onPressed: (){
try{
  FireStore.addUserInfo(firstname+" "+lastname, firstname, dateOfBirth, country+" "+city,
     code+phonenumber, url!, true,[],[]

  );
  Navigator.push(context, MaterialPageRoute(builder: (context)=>ProtifileScreen()));
}catch(e){

}
                }, child: Text("Join our Family",style: TextStyle(
                color: Colors.white
            ),))
          ],
        ),
      ),
    );
  }
}