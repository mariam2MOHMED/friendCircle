import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/color.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
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
                onTap: ()  {

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
                onTap: ()  {

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
    )
    );
  }
}



