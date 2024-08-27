import 'package:facebook/models/story.dart';
import 'package:facebook/models/story_info.dart';
import 'package:facebook/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryInfoWidget extends StatefulWidget {
StoryInfo? storyinfo;

  StoryInfoWidget({required this.storyinfo});
  @override
  State<StoryInfoWidget> createState() => _StoryInfoWidgetState();
}

class _StoryInfoWidgetState extends State<StoryInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(widget.storyinfo!.storyimg!),fit: BoxFit.cover),
      ),
      child:     Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30.r,
              backgroundImage: NetworkImage
                (widget.storyinfo!.userimg),
            ),
            SizedBox(width: 3.w,),
            Column(
              children: [
                Text(widget.storyinfo!.username!,style: TextStyle(
                    color: AppColor.primarycolor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold
                ),),
                Text(widget.storyinfo!.date,style: TextStyle(
                    color: AppColor.primarycolor.withOpacity(0.4),
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold
                ),),
              ],
            ),
            Spacer(),
            IconButton(onPressed: (){}, icon:
            Icon(Icons.cancel_sharp,color: AppColor.bckgroungcolor,))
          ],
        ),
      ),
    );
  }
}
