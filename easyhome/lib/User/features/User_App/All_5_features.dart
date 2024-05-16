import 'package:easyhome/User/features/User_App/F2_Home_User/Home_Screen.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/Create_Post.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Deals&Apps.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/cubit/my_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/favorite_cubit/favorite_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/post_cubit/post_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/screens/user_profile_screen.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/injection.dart';
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
        providers: [BlocProvider(create: (context) => MyCubit(getIt()))],
        child: const UserProfileScreen()),
  ];
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeUser();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.loggrey1,
        floatingActionButton: Container(
          child: FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              Create_Post New_Post = Create_Post();
              New_Post.creat_post(context);
            },
          ),
        ),
        body: PageStorage(
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          height: 70,
          color: MyColors.mainblue,
          shape: const CircularNotchedRectangle(),
          notchMargin: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  height: 70,
                  width: 70,
                  child: MaterialButton(
                    onPressed: () {
                      setState(() {
                        currentScreen = HomeUser();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          size: 20,
                          FontAwesomeIcons.home,
                          color:
                              currentTab == 0 ? Colors.white : MyColors.grey4,
                        ),
                        currentTab == 0
                            ? const Padding(
                                padding: EdgeInsets.only(top: 2.0),
                                child: Text("Home",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)),
                              )
                            : const Padding(
                                padding: EdgeInsets.only(top: 2.0),
                                child: Text(''),
                              ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 30.0),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = const Map();
                          currentTab = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            size: 20,
                            FontAwesomeIcons.mapLocationDot,
                            color:
                                currentTab == 1 ? Colors.white : MyColors.grey4,
                          ),
                          currentTab == 1
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(" Map",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      )),
                                )
                              : const Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(''),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: MaterialButton(
                      onPressed: () {
                        setState(() {
                          currentScreen = Deals_Apps();
                          currentTab = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            size: 20,
                            FontAwesomeIcons.solidHandshake,
                            color:
                                currentTab == 2 ? Colors.white : MyColors.grey4,
                          ),
                          currentTab == 2
                              ? const Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(" Deals",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                )
                              : const Padding(
                                  padding: EdgeInsets.only(top: 2.0),
                                  child: Text(''),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      currentScreen = MultiBlocProvider(providers: [
                        BlocProvider(create: (context) => MyCubit(getIt())),
                        BlocProvider(create: (context) => PostCubit(getIt())),
                        BlocProvider(create: (context) => SwitchCubit(getIt())),
                        BlocProvider(
                            create: (context) => FavoriteCubit(getIt())),
                      ], child: const UserProfileScreen());
                      currentTab = 3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Icon(
                          FontAwesomeIcons.solidUser,
                          size: 20,
                          color:
                              currentTab == 3 ? Colors.white : MyColors.grey4,
                        ),
                      ),
                      currentTab == 3
                          ? const Padding(
                              padding: EdgeInsets.only(top: 2.0),
                              child: Text("Account",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                            )
                          : const Padding(
                              padding: EdgeInsets.only(top: 2.0),
                              child: Text(''),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
      body: Text("Map"),
    );
  }
}
