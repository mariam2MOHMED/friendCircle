import 'package:facebook/models/story.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryWidget extends StatefulWidget {
  // const Story({super.key});
 Story? story;
  StoryWidget({required this.story});
  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        width: 60.w,
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),

        ),
        child: Column(
          children: [
            Container(
              width: 60.w,
              height: 65.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  image: DecorationImage(image: NetworkImage(
                      widget.story!.storyimg!),
                      fit:BoxFit.cover )
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 9.r,
                  backgroundImage:NetworkImage(widget.story!.userimg!),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.story!.username!,style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.sp
                ),)
              ],
            ),

          ],
        ),
      ),
    );
  }
}
