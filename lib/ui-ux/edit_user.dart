import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook/B-LOGIC/fireStore.dart';
import 'package:facebook/theme/color.dart';
import 'package:facebook/ui-ux/Navi.dart';
import 'package:facebook/ui-ux/protifile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_forms/flutter_fast_forms.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
class EditUserInfo extends StatefulWidget {
  const EditUserInfo({super.key});

  @override
  State<EditUserInfo> createState() => _EditUserInfoState();
}

class _EditUserInfoState extends State<EditUserInfo> {
  static final auth=FirebaseAuth.instance;
   String? fullname;
    String? username;
    String? date;
     String? location;
   String? phonenumber;
     String? userimg;
   bool? isOld16;


  //
  // String? fullname2;
  // String? username2;
  // String? date2;
  // String? location2;
  // String? phonenumber2;
  // String? userimg2;
  // bool? isOld162;

   Future<void> getUserInfo()async{
    await FirebaseFirestore.instance.collection('Users').
    doc(auth.currentUser!.uid).get().then((snapshot) {
      if(snapshot.exists){
setState(() {
  fullname=snapshot.data()!['fullname'];
  username=snapshot.data()!['username'];
  phonenumber=snapshot.data()!['phonenumber'];
  date=snapshot.data()!['dateOfBirth'];
  location=snapshot.data()!['location'];
  userimg=snapshot.data()!['userimg'];
  isOld16=snapshot.data()!['isOld16'];
});
      }else{
        print('No Data');
      }

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
    print('Test'+FireStore.fullname.toString());
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.quantarycolor,
        title: Text("User Information",style: TextStyle(
            color: AppColor.bckgroungcolor
        ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
          CircleAvatar(
            radius: 30.r,
            backgroundImage: NetworkImage(''),
          ),
            SizedBox(height: 20.h,),
            Row(
              children: [
                Container(
                  width: 300.w,
                  child: FastTextField(
                    onChanged: (value){
                      setState(() {
                        fullname=value!;
                      });
                    },
                    style: TextStyle(
                        color: Colors.black
                    ),
                    name: 'field_destination',
                    labelText:fullname,
                    placeholder: 'fullname',
                  ),
                ),
                SizedBox(width: 20.w,),

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

                labelText: username,
                placeholder: 'username',
              ),
            ),
            SizedBox(height: 10.h,),
            Container(
              width: 300.w,
              child: FastDatePicker(

                onChanged: (value){
                  setState(() {
                    date=value.toString();
                  });
                },

                name: 'date_picker',
                decoration: InputDecoration(counterStyle: TextStyle(
                    color: Colors.black
                )
                ),
                labelText:date,

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
                          location=value!;
                        });
                      },
                      name: 'Country',
                      labelText: location,
                      style: TextStyle(
                          color: Colors.black
                      ),
                      items: ['Norway', 'Sweden', 'Egypt', 'Denmark', 'Iceland'],
                      // initialValue: 'Egypt',
                    ),
                  ),
                ),
                SizedBox(width: 10.h,),
                Expanded(
                  child: Container(

                    child: FastDropdown(
                      onChanged: (value){
                        setState(() {
                          location=value!;
                        });
                      },
                      name: 'City',
                      labelText: location,

                      style:
                      TextStyle(
                          color: Colors.black
                      ),
                      items: ['Cairo', 'Alexandria', 'Giza', 'Benha', 'Matrouh'],
                      // initialValue: 'Benha',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h,),
            Row(
              children: [
                // Expanded(
                //   child: Container(
                //     child: FastDropdown(
                //       onChanged: (value){
                //         setState(() {
                //           code=value!;
                //         });
                //       },
                //       name: 'Code',
                //       labelText: 'Code',
                //       style: TextStyle(
                //           color: AppColor.primarycolor
                //       ),
                //       items: ['+020', '+97', '+93', '213', '85'],
                //       initialValue: '+020',
                //     ),
                //   ),
                // ),
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
                      labelText: 'phone',
                      placeholder: phonenumber,
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
                    isOld16=value!;
                  });
                },
                name: 'switch',
                labelText:isOld16.toString(),
                titleText: 'Are you older than 16 ?',
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
                    FireStore.addUserInfo(fullname!, username!, date!, location!,
                        phonenumber!,'https://i.pinimg.com/736x/fc/7a/20/fc7a20cbba13ae457b996b4df2653ce5.jpg', isOld16!,[],[]

                    );
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context)=>Navi()));
                  }catch(e){
print("error ${e.toString()}");
                  }
                }, child: Text("Save ",style: TextStyle(
                color: Colors.white
            ),))
          ],
        ),
      ),
    );
  }
}
