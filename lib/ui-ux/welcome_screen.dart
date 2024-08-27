
import 'package:facebook/ui-ux/sign-in.dart';
import 'package:facebook/ui-ux/sign-up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/color.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body:Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h,),
              Center(
                child: Image(
                  height: 400.h,
                  image: NetworkImage("https://www.logolynx.com/images/logolynx/a3/a37e416f3ef73b1d3a43988f0726ce3f.jpeg"),
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute
                          (builder: (context)=>SignUp()));
                      },
                      child: Container(

                        decoration: BoxDecoration(
                          color: AppColor.secondarycolor,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(width: 3.w,color: AppColor.secondarycolor),
                        ),
                        width: 90.w,
                        height: 50.h,
                        child: Center(
                          child: Text("Sign Up",style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp
                          ),),
                        ),
                      ),
                    ).animate().fade(duration: 2.seconds),
                    SizedBox(width: 30.w,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute
                          (builder: (context)=>SignIn()));
                      },
                      child: Container(

                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(width: 3.w,color: AppColor.secondarycolor),
                        ),
                        width: 90.w,
                        height: 50.h,
                        child: Center(
                          child: Text("Sign In",style: TextStyle(
                              color: AppColor.secondarycolor,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                      ),
                    ).animate().fade(duration: 2.seconds),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}