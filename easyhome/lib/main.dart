import 'package:easyhome/Rechidi/core/injection/index.dart';
import 'package:easyhome/Rechidi/module/workerprofile/page/index.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Login.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Signup_1.dart';
import 'package:easyhome/User/features/User_App/All_5_features.dart';
import 'package:easyhome/Worker/features/Worker_App/All_4_features.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/worker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // ignore: prefer_const_constructors
      designSize: Size(360, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Login()),
    );
  }
}

          /* routes:  
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            // Home_User(),
            WorkerProfile(workerId: '662ee1263a8b458f4dfd1348'),

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

*/