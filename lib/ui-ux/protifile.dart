import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook/B-LOGIC/Auth.dart';
import 'package:facebook/models/models.dart';
import 'package:facebook/models/protifile_post.dart';
import 'package:facebook/models/story.dart';
import 'package:facebook/ui-ux/edit_user.dart';
import 'package:facebook/widgets/protifile_post.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/color.dart';
import '../widgets/story.dart';

class ProtifileScreen extends StatefulWidget {
  const ProtifileScreen({Key? key}) : super(key: key);

  @override
  State<ProtifileScreen> createState() => _ProtifileScreenState();
}

class _ProtifileScreenState extends State<ProtifileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(

                width: MediaQuery.sizeOf(context).width,
                height: 200.h,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(

                      bottomLeft: Radius.circular(30.r),
                      bottomRight:  Radius.circular(30.r),
                    ),
                    image: DecorationImage(
                        image: NetworkImage('https://i.pinimg.com/736x/02/74/d4/0274d43686e69f010bcffbe113fd039f.jpg'),fit: BoxFit.cover)

                ),
                child: Column(
                  children: [
                    SizedBox(height: 120.0,),
                    CircleAvatar(
                      radius: 55.r,
                      backgroundColor: AppColor.bckgroungcolor,
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundImage:NetworkImage('https://thumbs.dreamstime.com/b/beautiful-teen-girl-portrait-isolated-white-31204228.jpg') ,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.h,),
             Center(
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Column(
                     children: [
                       Text('Mariam Mohmed',style: TextStyle(
                           color: AppColor.primarycolor,
                           fontSize: 20.sp,
                           fontWeight: FontWeight.bold
                       ),),
                       Text('@Mariam',style: TextStyle(
                         color: AppColor.primarycolor.withOpacity(0.6),
                         fontSize: 12.sp,

                       ),),
                     ],
                   ),
                   SizedBox(width: 20.w,),
                   IconButton(onPressed: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>EditUserInfo()));
                   }, icon: Icon(Icons.edit,color: AppColor.quantarycolor,))
                 ],
               ),
             ),
              SizedBox(height: 20.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Posts',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColor.primarycolor
                      ),),
                      SizedBox(height: 5.h,),
                      Text('30',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColor.primarycolor.withOpacity(0.6)
                      ),)
                    ],
                  ),
                  SizedBox(width: 20.w,),
                  Column(
                    children: [
                      Text('Followers',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColor.primarycolor
                      ),),
                      SizedBox(height: 5.h,),
                      Text('130',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColor.primarycolor.withOpacity(0.6)
                      ),)
                    ],
                  ),
                  SizedBox(width: 20.w,),
                  Column(
                    children: [
                      Text('Following',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColor.primarycolor
                      ),),
                      SizedBox(height: 5.h,),
                      Text('300',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp,
                          color: AppColor.primarycolor.withOpacity(0.6)
                      ),)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 140.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColor.quantarycolor

                      ),
                      child: Center(child: Text("Follow",style: TextStyle(
                          color: AppColor.bckgroungcolor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.sp
                      ),))),
                  SizedBox(width: 20.w,),
                  Container(
                    width: 60.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(
                            color: AppColor.quantarycolor,
                            width: 3.w
                        )
                    ),
                    child: Icon(Icons.chat_outlined,color: AppColor.quantarycolor,size: 20,),
                  )
                ],
              ),
              SizedBox(height: 20.h,),
              Row(
                children: [
                  Text('Photos',style: TextStyle(
                      color: AppColor.primarycolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp
                  ),),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.menu,color: AppColor.quantarycolor,))
                ],
              ),
              Container(
                height: 120.h,
                child:StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('Stories')
                  // where('useid',isEqualTo: Authentication.auth.currentUser!.uid)
                      .snapshots(),
                  builder: (context,snap){
                    if(snap.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }else{
                      return  ListView.builder(
                          scrollDirection: Axis.horizontal,

                          itemCount: snap.data!.docs.length,
                          itemBuilder: (context,index){//S

                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: StoryWidget(story: Story(username: snap.data!.docs[index]['username'],
                                  storyimg: snap.data!.docs[index]['storyimg'],
                                  userimg:snap.data!.docs[index]['userimg'] ),),
                            );
                          });
                    }
                  },
                )

              ),

              Container(
                height: 160.h,
                child:StreamBuilder(
                  stream: FirebaseFirestore.instance.collection('Posts').where('userid',isEqualTo: Authentication.auth.currentUser!.uid).snapshots(),
              builder: (context,snap){
                    if(snap.connectionState==ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator());
                    }else{

                      return  GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 5.h,
                        crossAxisSpacing: 5.w
                      ),
                          itemCount: snap.data!.docs.length,
                          itemBuilder: (context,index){
                      
                        return protifilPostWidget(protifilepost: ProtifilePost(postimg: snap.data!.docs[index]['postimg']));

                      });

    }
    }
    )
    )
            ],
          ),
        ),
      ),
    );
  }
}
