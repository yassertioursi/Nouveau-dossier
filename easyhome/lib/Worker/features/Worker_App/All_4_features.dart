// ignore_for_file: prefer_const_constructors

import 'package:easyhome/Rechidi/module/workermap/page/index.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Home_Screen.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/Create_Post.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Deals&Apps.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/cubit/my_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/favorite_cubit/favorite_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/post_cubit/post_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/screens/user_profile_screen.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';
import 'package:easyhome/User/features/User_App/userProfile/updatePost.dart/updatemyPost.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Home_Worker.dart';
import 'package:easyhome/Worker/features/Worker_App/F3_Deals_Requests/Deals&Requs.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/Switch/switch_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/screens/worker_profile_sceen.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home_Worker extends StatefulWidget {
  const Home_Worker({Key? key});

  @override
  State<Home_Worker> createState() => _Home_UserState();
}

class _Home_UserState extends State<Home_Worker> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomeWorkerMain(),
    const PostsMap(),
    DealsRequs(),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MyCubit(locator())),
        BlocProvider(create: (context) => PostCubit(locator())),
        BlocProvider(create: (context) => SwitchCubit(locator())),
        BlocProvider(create: (context) => FavoriteCubit(locator())),
      ],
      child: const WorkerProfileScreen(),
    ),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeWorkerMain();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.loggrey1,
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: SizedBox(
          height: 80,
          child: BottomNavigationBar(
            currentIndex: currentTab,
            onTap: (index) {
              setState(() {
                currentTab = index;
                currentScreen = screens[index];
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.house),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.mapLocationDot),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidHandshake),
                label: ' Deals',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.solidUser),
                label: 'Profile',
              ),
            ],
            backgroundColor: MyColors.mainblue,
            selectedItemColor: Colors.white,
            unselectedItemColor: MyColors.grey4,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }
}
