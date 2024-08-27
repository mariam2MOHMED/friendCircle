import 'package:facebook/B-LOGIC/Auth.dart';
import 'package:facebook/ui-ux/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_icons/icon_icons.dart';

import '../theme/color.dart';
import 'Navi.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all((20.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                CircleAvatar(
                  radius: 25.r,
                  backgroundColor:AppColor.teritrycolor,
                  child: IconButton(

                      onPressed: (){}, icon: Icon(Icons.arrow_back_outlined,
                    color: AppColor.secondarycolor,)),
                )
              ],
            ),
            SizedBox(height: 20.h,),
            Text("Sign In",style: GoogleFonts.bebasNeue(
              color: AppColor.secondarycolor,
              fontSize: 40.sp,
            ),),
            SizedBox(height: 20.h,),
            TextFormField(
              controller: email,
              style: TextStyle(
                  color: Colors.black
              ),
              decoration: InputDecoration(
                  hintText: "Enter your E-mail",
                  labelText: "E-mail",

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColor.secondarycolor),
                  ),
                  prefixIcon: Icon(Icons.email,color: AppColor.secondarycolor,),
                  suffixIcon: Icon(Icons.clear_all_sharp,color: AppColor.secondarycolor,)
              ),
            ),
            SizedBox(height: 20.h,),
            TextField(
              style: TextStyle(
                  color: Colors.black
              ),
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Enter your Password",
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColor.secondarycolor),
                  ),
                  prefixIcon: Icon(Icons.password_outlined,color: AppColor.secondarycolor,),
                  suffixIcon: Icon(Icons.remove_red_eye,color: AppColor.secondarycolor,)
              ),
            ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: (){
                Authentication.login(email.text.trim(), password.text.trim());
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Navi()));
              },
              child:   Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColor.secondarycolor
                ),
                width: MediaQuery.sizeOf(context).width,
                height: 50.h,

                child: Center(
                  child: Text("Sign In",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold
                    ),),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            GestureDetector(
              onTap: (){
               try{ Authentication.signInWithGoogle();
               Navigator.push(context, MaterialPageRoute(builder:
                   (context)=>Navi()));}
               catch(e){
                 print("error ${e.toString()}");
               }
              },
              child:   Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColor.primarycolor,
                    border: Border.all(
                        color: AppColor.secondarycolor,width: 3.w
                    )
                ),
                width: MediaQuery.sizeOf(context).width,
                height: 50.h,

                child: Center(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconIcons.facebook(
                          height: 24.h,
                          width: 24.w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text("Sign in with facebook",
                          style: TextStyle(
                              color: AppColor.bckgroungcolor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold
                          ),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h,),

          ],
        ),
      ),
    );
  }
}