// ignore_for_file: prefer_const_constructors

import 'package:easyhome/User/features/User_App/F2_Home_User/Home_Screen.dart';

import 'package:easyhome/User/features/User_App/userProfile/BloC/cubit/my_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/favorite_cubit/favorite_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/post_cubit/post_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/screens/user_profile_screen.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/injection.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Home_Worker.dart';
import 'package:easyhome/Worker/features/Worker_App/F3_Deals_Requests/Deals&Requs.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/Switch/switch_cubit.dart';
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
    const Map(),
    DealsRequs(),
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MyCubit(getIt())),
        BlocProvider(create: (context) => PostCubit(getIt())),
        BlocProvider(create: (context) => SwitchCubit(getIt())),
        BlocProvider(create: (context) => FavoriteCubit(getIt())),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 10,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: MyColors.mainblue,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                buildNavItem(
                  icon: FontAwesomeIcons.home,
                  label: 'Home',
                  index: 0,
                ),
                buildNavItem(
                  icon: FontAwesomeIcons.mapLocationDot,
                  label: 'Map',
                  index: 1,
                ),
                buildNavItem(
                  icon: FontAwesomeIcons.solidHandshake,
                  label: '  Deals',
                  index: 2,
                ),
                buildNavItem(
                  icon: FontAwesomeIcons.solidUser,
                  label: 'Profile',
                  index: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavItem(
      {required IconData icon, required String label, required int index}) {
    return InkWell(
      onTap: () {
        setState(() {
          currentScreen = screens[index];
          currentTab = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: currentTab == index ? Colors.white : MyColors.grey4,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: currentTab == index ? Colors.white : MyColors.grey4,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Map extends StatelessWidget {
  const Map({Key? key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Map"),
      ),
    );
  }
}
