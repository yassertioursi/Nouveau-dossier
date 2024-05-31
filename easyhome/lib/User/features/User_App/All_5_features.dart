import 'package:easyhome/User/features/User_App/F2_Home_User/Home_Screen.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/Create_Post.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Deals&Apps.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/cubit/my_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/favorite_cubit/favorite_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/post_cubit/post_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/screens/user_profile_screen.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/injection.dart';
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
    const Map(),
    Deals_Apps(),
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
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 3,
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
                  icon: FontAwesomeIcons.house,
                  label: 'Home',
                  index: 0,
                ),
                buildNavItem(
                  icon: FontAwesomeIcons.mapLocationDot,
                  label: 'Map',
                  index: 1,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    color: Colors.white,
                  ),
                  width: 48, // Adjust the width of the container as needed
                  height: double.infinity,
                  child: FloatingActionButton(
                    onPressed: () {
                      /*   Create_Post New_Post = Create_Post();
                      New_Post.creat_post(context);*/
                      UpdateMyPost updateMyPost = UpdateMyPost();
                      updateMyPost.update_post(
                          context, "663140fa974c32abb0219fd0");
                    },
                    backgroundColor: MyColors.mainblue,
                    child: const Icon(Icons.add),
                  ),
                ),
                buildNavItem(
                  icon: FontAwesomeIcons.solidHandshake,
                  label: ' Deals',
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
