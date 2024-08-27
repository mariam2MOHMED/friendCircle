import 'package:facebook/models/protifile_post.dart';
import 'package:facebook/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class protifilPostWidget extends StatefulWidget {
  ProtifilePost? protifilepost;
  protifilPostWidget({required this.protifilepost});
  @override
  State<protifilPostWidget> createState() => _protifilPostWidgetState();
}

class _protifilPostWidgetState extends State<protifilPostWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        child: Container(
          decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(
                  color: AppColor.quantarycolor,
                  width: 3.w
              )
              ,image: DecorationImage(image:
          NetworkImage(
             widget.protifilepost!.postimg!
          ))
          ) ,

        ),
      ),
    );
  }
}
