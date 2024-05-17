import 'package:easyhome/User/features/F1_Login&Signup/Screens/Login.dart';
import 'package:easyhome/User/features/User_App/All_5_features.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Home_Screen.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/injection.dart';
import 'package:easyhome/Worker/features/Worker_App/All_4_features.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Home_Worker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Dioah.init();
  initGetIt();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      // ignore: prefer_const_constructors
      designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Home_Worker()
          /* routes: 
            '/login': (context) => Login(),
            '/Signup_1': (context) => Signup(),
            //'/Signup_2': (context) => Signup_2(),
            '/Email_Verification': (context) => Email_verifcation(),
            '/Forget_password': (context) => Forget_Pass(),
          }*/
          ),
    );
  }
}
