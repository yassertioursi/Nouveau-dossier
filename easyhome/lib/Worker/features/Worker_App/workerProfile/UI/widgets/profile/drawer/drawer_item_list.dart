import 'package:easyhome/Rechidi/core/injection/index.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/cubit/my_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/favorite_cubit/favorite_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/post_cubit/post_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/update_cubit/update_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/screens/edit_user_profile_screen.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/screens/user_profile_screen.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/drawer/drawer_items.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/Switch/switch_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/savePosts/save_posts_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/screens/saved_posts.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/worker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<Widget> drawerItemsList(MyWorker? worker, BuildContext context) {
  return [
    const drawerHeader(),
    SizedBox(
      height: 10.h,
    ),
    drawerItem(
      myicon: Icons.person,
      text: "Switch To user",
      function: () {
        BlocProvider.of<SwitchCubit>(context).emitSwitche().then((value) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => MyCubit(locator<Repo>()),
                    ),
                    BlocProvider(
                      create: (context) => FavoriteCubit(locator<Repo>()),
                    ),
                    BlocProvider(
                      create: (context) => PostCubit(locator<Repo>()),
                    ),
                    BlocProvider(
                      create: (context) => SwitchCubit(locator<Repo>()),
                    ),
                  ],
                  child: const UserProfileScreen(),
                ),
              ));
        });
      },
    ),
    Divider(
      thickness: 0.8,
      endIndent: 16.sp,
      indent: 16.sp,
      color: Colors.black,
    ),
    drawerItem(
        myicon: Icons.save,
        text: "Saved Posts",
        function: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => SavePostsCubit(locator<Repo>()),
                  child: const SavedPosts(),
                ),
              ));
        }),
    drawerItem(
        myicon: Icons.edit,
        text: "Edit Profile",
        function: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => UpdateCubit(locator<Repo>()),
                  child: const EditUserScreen(
                    isUser: false,
                  ),
                ),
              ));
        }),
    drawerItem(
      myicon: Icons.translate,
      text: "Change Language",
    ),
    drawerItem(
      myicon: Icons.dark_mode,
      text: "DarkMode",
    ),
    drawerItem(
      myicon: Icons.account_box,
      text: "About Us",
    ),
    drawerItem(
      myicon: Icons.feedback,
      text: "FeedBack",
    ),
    Divider(
      thickness: 0.8.sp,
      endIndent: 16,
      indent: 16,
      color: Colors.black,
    ),
    drawerItem(
      myicon: Icons.logout,
      text: "Log Out",
    )
  ];
}
