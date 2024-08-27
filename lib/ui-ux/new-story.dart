import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import '../B-LOGIC/fireStore.dart';
import '../theme/color.dart';

class NewStory extends StatefulWidget {
   NewStory({super.key,required this.username,required this.userimg});
String username;
String userimg;
  @override
  State<NewStory> createState() => _NewStoryState();
}

class _NewStoryState extends State<NewStory> {
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
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: 20.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40.r,
                  backgroundImage: NetworkImage(widget.userimg),
                ),
                SizedBox(width: 20.w,),
                Column(
                  children: [
                    Text(widget.username,style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: 10.h,),
                    Text('25-7-2011',style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp
                    ),),
                  ],
                )
              ],
            ),
            SizedBox(height: 20.h,),
            SizedBox(height: 20.h,),
            getimage?
            GestureDetector(
              onTap: (){



              },
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: 200.h,
                decoration: BoxDecoration(
                    image: DecorationImage(image:FileImage(file!)
                        ,fit: BoxFit.cover)
                ),
              ),
            ):GestureDetector(
                onTap: (){
                  setState(() {
                    SmartDialog.show(builder: (context){
                      return uploadWay();
                    });
                    // SmartDialog.show(builder: (context) {
                    //   return Container(
                    //     height: 80,
                    //     width: 180,
                    //     decoration: BoxDecoration(
                    //       color: Colors.black,
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     alignment: Alignment.center,
                    //     child:
                    //     Text('easy custom dialog', style: TextStyle(color: Colors.white)),
                    //   );
                    // });
                  });

                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width/0.8,
                  height: 300.h,
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 3.w,
                          color: AppColor.secondarycolor
                      )
                  ),
                  child: Center(

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.image,color: AppColor.secondarycolor,size: 40,),
                        SizedBox(height: 10.h,),
                        Text('Add a photo',style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp
                        ),)
                      ],
                    ),
                  ),
                )),
            Row(
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.bookmark))
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.quantarycolor
                ),
                onPressed: ()async{
                  print("111111111");
                  try{
                await FireStore.addStory(widget.username!, url!, widget.userimg!);

                      // await FireStore.addStory(widget.username,  url!,widget.userimg,);
                  }catch(e){

print(e);print(e);
                  }
                  print("2222222222");
                }, child: Text("Send",style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),))

          ],
        ),
      ),
    );
  }
}
