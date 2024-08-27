import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook/models/Post.dart';
import 'package:facebook/models/story.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class FireStore{
  static final auth=FirebaseAuth.instance;
  static String? fullname;
  static  String? username;
  static  String? date;
  static   String? location;
  static String? phonenumber;
  static   String? userimg;
  static bool? isOld16;
  static List<Post>?post;
  static List<Story>?story;
  static Future<void> addUserInfo(
      String fullname,
      String username,
      String date,
      String location,
      String phonenumber,
      String userimg,
      bool isOld16,
      List<Post>post,
      List<Story>story,
      )async{
    await FirebaseFirestore.instance.
    collection('Users').
    doc(auth.currentUser!.uid).set({
'fullname':fullname,
      'username':username,
      'location':location,
      'phonenumber':phonenumber,
      'dateOfBirth':date,
    'userimg':userimg,
       'Post':post=[],
       'Story':story=[],
    });
  }
  static Future<void> addStory(
  String username,

  String storyimg,
  String userimg,

      )async{
    await FirebaseFirestore.instance.
    collection('Stories').
    add({
      'username':username,
      // 'date':date,
      'storyimg':storyimg,
      'userimg':userimg,
      // 'userid':auth.currentUser!.uid,
      // 'title':title,

    });
  }
static Future<void> addPost(  String username,
  String date,
  String description,
  String userimg,
  String postimg)async{
    await FirebaseFirestore.instance.collection('Posts').
    add({
      'username':username,
      'date':date,
      'description':description,
      'userimg':userimg,
      'postimg':postimg,
      'userid':auth.currentUser!.uid,
    });
}
  // static Future<void> addUserInfo()async{
  //   await FirebaseFirestore.instance.
  //   collection('Users').
  //   doc(auth.currentUser!.uid).set({
  //
  //   });
  // }
}