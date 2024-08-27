import 'package:facebook/models/Post.dart';
import 'package:facebook/theme/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostWidget extends StatefulWidget {



Post? post;
  PostWidget({

    required this.post
});
  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.w,
      height:510.h ,
      decoration: BoxDecoration(
        border: Border.all(width: 3.w,
            color: AppColor.quantarycolor),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundImage: NetworkImage
                    (widget.post!.userimg!),
                ),
                SizedBox(width: 3.w,),
                Column(
                  children: [
                    Text(widget.post!.username!,style: TextStyle(
                        color: AppColor.primarycolor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold
                    ),),
                    Text(widget.post!.date!,style: TextStyle(
                        color: AppColor.primarycolor.withOpacity(0.4),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold
                    ),),
                  ],
                ),
                SizedBox(width: 28.w,),
                IconButton(onPressed: (){}, icon: Icon(Icons.bookmark,color: AppColor.quantarycolor,))
              ],
            ),
            SizedBox(height: 5.h,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10.h,),
                Text(widget.post!.description!,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: AppColor.primarycolor,
                    overflow: TextOverflow.ellipsis,

                  ),),
              ],
            ),
            SizedBox(height: 10.h,),
            Container(
              width:300.w,
              height: 300.h,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(widget.post!.postimg),
                      fit:BoxFit.cover )
              ),
            ),
            Row(
              children: [
                IconButton(onPressed: (){},
                    icon: Icon(Icons.favorite,color: AppColor.teritrycolor,)),
                IconButton(onPressed: (){},
                    icon: Icon(Icons.comment,color: AppColor.teritrycolor,)),
                IconButton(onPressed: (){},
                    icon: Icon(Icons.share,
                      color: AppColor.teritrycolor,)),

              ],
            )


          ],
        ),
      ),
    );
  }
}
