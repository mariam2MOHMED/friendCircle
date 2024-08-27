import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook/B-LOGIC/Auth.dart';
import 'package:facebook/B-LOGIC/fireStore.dart';
import 'package:facebook/main.dart';
import 'package:facebook/models/Post.dart';
import 'package:facebook/models/story.dart';
import 'package:facebook/ui-ux/new-story.dart';
import 'package:facebook/ui-ux/new_post.dart';
import 'package:facebook/ui-ux/welcome_screen.dart';
import 'package:facebook/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../models/models.dart';
import '../theme/color.dart';
import '../widgets/story.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? fullname="";
  String? username="";
  String? location="";
  String? phonenumber="";
  String? userimg="";
  String? dateofbirth="";
  bool? isOlder16=true;
  Future <void> getUserInfo()async{
    await FirebaseFirestore.instance.collection('Users').
    doc(auth.currentUser!.uid).get().then((snapshot) {
      if(snapshot.exists){
        setState(() {
username=snapshot.data()!['username'];
fullname=snapshot.data()!['fullname'];
location=snapshot.data()!['location'];
phonenumber=snapshot.data()!['phonenumber'];
dateofbirth=snapshot.data()!['dateOfBirth'];
userimg=snapshot.data()!['userimg'];
isOlder16=snapshot.data()![''];
        });
      }
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserInfo();
    print('OVH');
  }
  @override
  final ButtonStyle style =
  ElevatedButton.styleFrom(textStyle:  TextStyle(fontSize: 20.sp,
      color: AppColor.bckgroungcolor)
      ,backgroundColor: AppColor.quantarycolor);
  final ButtonStyle style1 =
  ElevatedButton.styleFrom(textStyle:  TextStyle(fontSize: 20.sp,
      color: AppColor.quantarycolor)
    ,backgroundColor: AppColor.primarycolor
    ,
  );
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child:   Column(

          children: [

            SizedBox(height: 20.h,),

            Row(

              mainAxisAlignment: MainAxisAlignment.start,

              children: [

                SizedBox(width: 40.w,),

                CircleAvatar(

                  radius: 40.r,

             backgroundImage: NetworkImage(userimg!.toString()),

                ),

                SizedBox(width: 20.w,),

                Text('Hello $username',style: TextStyle(

                    color: AppColor.primarycolor,

                    fontSize: 14.sp,

                    fontWeight: FontWeight.bold

                ),),



                IconButton(onPressed: (){}, icon: Icon(Icons.settings)),

                IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                IconButton(onPressed: (){
                  Authentication.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));
                }, icon: Icon(Icons.logout)),
              ],

            ),

            SizedBox(height: 20.h,),

            Container(
//username: 'Mariam',
//
//                      userimg:  'https://thumbs.dreamstime.com/b/beautiful-teen-girl-portrait-isolated-white-31204228.jpg',
//
//                      storyimg:  'https://i.pinimg.com/736x/02/74/d4/0274d43686e69f010bcffbe113fd039f.jpg',
              height: 110.h,

              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Stories').snapshots(),
             builder: (context,snap){
                  if(snap.connectionState==ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator());
                  }else{
                    return     ListView.builder(

                        scrollDirection: Axis.horizontal,

                        itemCount: snap.data!.docs.length,

                        itemBuilder: (context,index){

                          return     StoryWidget(story: Story(username: snap.data!.docs[index]['username'],
                              storyimg:snap.data!.docs[index]['storyimg'] ,
                              userimg:  snap.data!.docs[index]['userimg'],),

                          );

                        });
                  }
             },
              )
          

            ),

            SizedBox(height: 20.h,),

            Row(

              mainAxisAlignment: MainAxisAlignment.center,

              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                ElevatedButton(

                    style:  style



                    ,onPressed: (){
                      try{
                        // FireStore.addPost('mArIaM', '25-98', 'description', 'https://thumbs.dreamstime.com/b/beautiful-teen-girl-portrait-isolated-white-31204228.jpg', 'https://thumbs.dreamstime.com/b/beautiful-teen-girl-portrait-isolated-white-31204228.jpg');
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPost(
                       userimg: userimg!,username: username!,
                     )));
                      }catch(e){
                        print("error ${e.toString()}");
                      }
                }, child: Row(

                  children: [

                    Icon(Icons.add,color: AppColor.bckgroungcolor,),

                    Text(" Post",style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                        fontWeight: FontWeight.bold
                    ),),

                  ],

                )),

                SizedBox(width: 20.h,),

                ElevatedButton(

                    style:  style



                    ,onPressed: (){
                      try{
 //                        FireStore.addStory('Mariam',
 //
 // 'https://thumbs.dreamstime.com/b/beautiful-teen-girl-portrait-isolated-white-31204228.jpg',
 // 'https://thumbs.dreamstime.com/b/beautiful-teen-girl-portrait-isolated-white-31204228.jpg');
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>NewStory(username: username!, userimg: userimg!)));
                      }catch(e){
                        print(e);
                      }
                }, child: Row(

                  children: [

                    Icon(Icons.add,color: AppColor.bckgroungcolor,),

                    Text(" Story",style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                      fontWeight: FontWeight.bold
                    )),

                  ],

                )),

              ],

            ),
            Container(
              child:StreamBuilder(
                stream: FirebaseFirestore.instance.collection('Posts').snapshots(),
             builder: (context,snap){
if(snap.connectionState==ConnectionState.waiting){
  return CircularProgressIndicator();
}else
{
  return   ListView.builder(
      shrinkWrap: true,
      itemCount: snap.data!.docs.length,

      itemBuilder: (context,index){

        return   Padding(
          padding: const EdgeInsets.only(bottom: 10.0,left: 10.0,right: 10.0),
          child:
          PostWidget(

            post: Post(username: snap.data!.docs[index]['username'],
                date: snap.data!.docs[index]['date'],

                description: snap.data!.docs[index]['description'], userimg: snap.data!.docs[index]['userimg'],
                postimg:snap.data!.docs[index]['postimg']),

          ),
        );

      });
}
             },
              )

            )

          ],

        ),
      ),
    );
  }
 
}
//    ListView.builder(
// 
//                   scrollDirection: Axis.horizontal,
// 
//                   itemCount: 10,
// 
//                   itemBuilder: (context,index){
// 
//                     return     StoryWidget(story: Story(username: 'Mariam', storyimg: 'https://i.pinimg.com/736x/7a/e0/cb/7ae0cb60358bc2f1bfc5b254ae3ba792.jpg', userimg: 'https://i.pinimg.com/736x/02/74/d4/0274d43686e69f010bcffbe113fd039f.jpg'),
// 
//                     );
// 
//                   }),