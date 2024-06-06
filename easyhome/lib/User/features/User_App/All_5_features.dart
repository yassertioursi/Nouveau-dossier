// ignore_for_file: prefer_const_constructors

import 'package:easyhome/Rechidi/module/usermap/map/page/index.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Home_Screen.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/Create_Post.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Deals&Apps.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/cubit/my_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/favorite_cubit/favorite_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/post_cubit/post_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/screens/user_profile_screen.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';
import 'package:easyhome/User/features/User_App/userProfile/updatePost.dart/updatemyPost.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/Switch/switch_cubit.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home_User extends StatefulWidget {
  const Home_User({Key? key});

  @override
  State<Home_User> createState() => _Home_UserState();
}

class _Home_UserState extends State<Home_User> {
  int currentTab = 0;
  final List<Widget> screens = [
    HomeUser(),
    const UserMap(),
    Deals_Apps(),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MyCubit(locator())),
        BlocProvider(create: (context) => PostCubit(locator())),
        BlocProvider(create: (context) => SwitchCubit(locator())),
        BlocProvider(create: (context) => FavoriteCubit(locator())),
      ],
      child: const UserProfileScreen(),
    ),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeUser();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.loggrey1,
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentTab,
          onTap: (index) {
            setState(() {
              if (index == 2) {
                Create_Post createMyPost = Create_Post();
                createMyPost.creat_post(context);
              } else {
                currentTab = index;
                currentScreen = screens[index < 2 ? index : index - 1];
              }
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
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 1.5),
                      color: Colors.transparent,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.add, color: Colors.white),
                    )),
              ),
              label: '',
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
    );
  }
}
