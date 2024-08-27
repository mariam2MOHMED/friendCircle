//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../theme/color.dart';
//
// Widget Story(String username,String storyimg,String userimg){
//   return Padding(
//     padding: const EdgeInsets.only(right: 10.0),
//     child: Container(
//       width: 60.w,
//       height: 100.h,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.r),
//
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: 60.w,
//             height: 65.h,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.r),
//                 image: DecorationImage(image: NetworkImage(
//                     storyimg),
//                     fit:BoxFit.cover )
//             ),
//           ),
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircleAvatar(
//                 radius: 9.r,
//                 backgroundImage:NetworkImage(userimg),
//               ),
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(username,style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 12.sp
//               ),)
//             ],
//           ),
//
//         ],
//       ),
//     ),
//   );
// }
// Widget post(String username,String date,String description,String userimg,String postimg){
//   return Container(
//     width: 300.w,
//     height:460.h ,
//     decoration: BoxDecoration(
//       border: Border.all(width: 3.w,
//           color: AppColor.quantarycolor),
//       borderRadius: BorderRadius.circular(12.r),
//     ),
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               CircleAvatar(
//                 radius: 30.r,
//                 backgroundImage: NetworkImage
//                   (userimg),
//               ),
//               SizedBox(width: 3.w,),
//               Column(
//                 children: [
//                   Text(username,style: TextStyle(
//                       color: AppColor.primarycolor,
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.bold
//                   ),),
//                   Text(date,style: TextStyle(
//                       color: AppColor.primarycolor.withOpacity(0.4),
//                       fontSize: 15.sp,
//                       fontWeight: FontWeight.bold
//                   ),),
//                 ],
//               ),
//               SizedBox(width: 28.w,),
//               IconButton(onPressed: (){}, icon: Icon(Icons.bookmark,color: AppColor.quantarycolor,))
//             ],
//           ),
//           SizedBox(height: 5.h,),
//           Text(description,
//             maxLines: 3,
//             style: TextStyle(
//               fontSize: 15.sp,
//               color: AppColor.primarycolor,
//               overflow: TextOverflow.ellipsis,
//
//             ),),
//           SizedBox(height: 10.h,),
//           Container(
//             width:300.w,
//             height: 300.h,
//             decoration: BoxDecoration(
//                 image: DecorationImage(image: NetworkImage(postimg),
//                     fit:BoxFit.cover )
//             ),
//           ),
//           Row(
//             children: [
//               IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: AppColor.teritrycolor,)),
//               IconButton(onPressed: (){}, icon: Icon(Icons.comment,color: AppColor.teritrycolor,)),
//               IconButton(onPressed: (){}, icon: Icon(Icons.share,color: AppColor.teritrycolor,)),
//
//             ],
//           )
//
//
//         ],
//       ),
//     ),
//   );
// }
// Widget protifilPost(){
//   return Padding(
//     padding: const EdgeInsets.only(right: 8.0),
//     child: GestureDetector(
//       child: Container(
//         decoration:BoxDecoration(
//             borderRadius: BorderRadius.circular(14.r),
//             border: Border.all(
//                 color: AppColor.quantarycolor,
//                 width: 3.w
//             )
//             ,image: DecorationImage(image: NetworkImage('https://i.pinimg.com/736x/fc/7a/20/fc7a20cbba13ae457b996b4df2653ce5.jpg'))
//         ) ,
//
//       ),
//     ),
//   );
// }
// Widget StoryInfo(String username,String date,String storyimg,String userimg,double width,double height){
//   return Container(
//     width: width,
//     decoration: BoxDecoration(
//       image: DecorationImage(image: NetworkImage('$storyimg'),fit: BoxFit.cover),
//     ),
//     child:     Padding(
//       padding: const EdgeInsets.all(12.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CircleAvatar(
//             radius: 30.r,
//             backgroundImage: NetworkImage
//               (userimg),
//           ),
//           SizedBox(width: 3.w,),
//           Column(
//             children: [
//               Text(username,style: TextStyle(
//                   color: AppColor.primarycolor,
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.bold
//               ),),
//               Text(date,style: TextStyle(
//                   color: AppColor.primarycolor.withOpacity(0.4),
//                   fontSize: 15.sp,
//                   fontWeight: FontWeight.bold
//               ),),
//             ],
//           ),
//           Spacer(),
//           IconButton(onPressed: (){}, icon:
//           Icon(Icons.cancel_sharp,color: AppColor.bckgroungcolor,))
//         ],
//       ),
//     ),
//   );
// }