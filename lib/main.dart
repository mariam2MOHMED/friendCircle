import 'package:facebook/B-LOGIC/Auth.dart';
import 'package:facebook/firebase_options.dart';
import 'package:facebook/ui-ux/Navi.dart';
import 'package:facebook/ui-ux/new_post.dart';
import 'package:facebook/ui-ux/sign-up.dart';
import 'package:facebook/ui-ux/test.dart';
import 'package:facebook/ui-ux/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // WidgetsFlutterBinding.ensureInitialized();
  //  await Firebase.initializeApp(
  //   options: FirebaseOptions(
  //     apiKey: "AIzaSyDp6-wlwoA50nGQ3wdUVPqzdH_JQ2RrU4Q",
  //     appId: "1:333100219796:android:ce2ef7e5c2ae3ed5e4a381",
  //     messagingSenderId: "333100219796",
  //     projectId: "friendcircle-3f9aa",
  //   ),
  // );

  // await  Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'social_app',
          navigatorObservers: [FlutterSmartDialog.observer],
          // here
          builder: FlutterSmartDialog.init(),
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home:WelcomeScreen(),
        );
      },

    );
  }
}
final auth=FirebaseAuth.instance;