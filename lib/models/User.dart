import 'package:facebook/models/Post.dart';
import 'package:facebook/models/story.dart';

class User{
  String? fullname;
  String? username;
  String? DateOfBirth;
  String? location;
  String? phonenumber;
  String? userImg;
  bool? isOld16;
  String? address;
  List<Post>?posts;
  List<Story>?storys;
  User({this.fullname,this.username,this.DateOfBirth,
  this.location,this.phonenumber,this.userImg,this.isOld16,
    this.address,
    this.posts,
    this.storys
  });
}