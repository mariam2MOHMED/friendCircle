import 'package:facebook/B-LOGIC/Auth.dart';
import 'package:facebook/theme/color.dart';
import 'package:facebook/ui-ux/protifile.dart';
import 'package:facebook/ui-ux/sign-in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_icons/icon_icons.dart';

import 'form.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all((20.0)),
        child: Center(
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
                    backgroundColor:AppColor.quantarycolor,
                    child: IconButton(

                        onPressed: (){}, icon: Icon(Icons.arrow_back_outlined,
                      color: AppColor.secondarycolor,)),
                  )
                ],
              ),
              SizedBox(height: 20.h,),
              Text("Create \n Account",style: GoogleFonts.bebasNeue(
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
                controller: password,
                style: TextStyle(
                    color: Colors.black
                ),
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
                  try {
                    Authentication.createUser(email.text.trim(), password.text.trim());
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => FormUser()));
                  }  catch(e){
    print("error ${e.toString()}");
    return null;
    }          },
                child:   Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: AppColor.secondarycolor
                  ),
                  width: MediaQuery.sizeOf(context).width,
                  height: 50.h,

                  child: Center(
                    child: Text("Create Account",
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
                onTap: (){},
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
                          Text("Sign up with facebook",
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
              Row(
                children: [
                  Text("Don't have an account",style: TextStyle(
                      fontSize:22.sp,color: Colors.black
                  ),),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                  }, child: Text("Login",style: TextStyle(
                      color: AppColor.secondarycolor
                  ),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}