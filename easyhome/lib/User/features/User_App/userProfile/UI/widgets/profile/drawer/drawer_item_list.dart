import 'package:easyhome/User/features/User_App/userProfile/BloC/password_Cubit/passwrod_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/update_cubit/update_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/screens/edit_user_profile_screen.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/edit_profile/changePassword/change_password.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/drawer/drawer_items.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/Certificate/certificate_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/Switch/switch_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/cubit/worker_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/portfolio/portfolio_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/reviews/reviews_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/screens/worker_profile_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItemList extends StatefulWidget {
  const DrawerItemList({super.key, required this.user});
  final User user;

  @override
  State<DrawerItemList> createState() => _DrawerItemListState();
}

class _DrawerItemListState extends State<DrawerItemList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: drawerItemsList(widget.user),
    );
  }

  List<Widget> drawerItemsList(User user) {
    return [
      const drawerHeader(),
      SizedBox(
        height: 10.h,
      ),
      drawerItem(
          //  this function switch the user to worker 3 cases
          myicon: Icons.work,
          text: "Switch To worker",
          function: () {
            if (user.data?.role == "Worker" &&
                user.data!.authentication!.isVerified!) {
              BlocProvider.of<SwitchCubit>(context).emitSwitche().then((value) {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MultiBlocProvider(
                        providers: [
                          BlocProvider(
                            create: (context) => WorkerCubit(locator<Repo>()),
                          ),
                          BlocProvider(
                            create: (context) =>
                                PortfolioCubit(locator<Repo>()),
                          ),
                          BlocProvider(
                            create: (context) => ReviewsCubit(locator<Repo>()),
                          ),
                          BlocProvider(
                            create: (context) =>
                                CertificateCubit(locator<Repo>()),
                          ),
                          BlocProvider(
                            create: (context) => SwitchCubit(locator<Repo>()),
                          ),
                        ],
                        child: const WorkerProfileScreen(),
                      ),
                    ));
              });
            } else if (!user.data!.authentication!.isVerified!) {
              showCustomSnackBar();
            }
          }),
      Divider(
        thickness: 0.8,
        endIndent: 16.sp,
        indent: 16.sp,
        color: Colors.black,
      ),
      drawerItem(
          //
          myicon: Icons.edit,
          text: "Edit Profile",
          function: () {
            Navigator.push(
                context,  
                MaterialPageRoute( //TODO RECHIDI EDIT
                  builder: (context) => BlocProvider(
                    create: (context) => UpdateCubit(locator<Repo>()),
                    child: const EditUserScreen(isUser: true),
                  ),
                ));
          }),
      drawerItem(
        myicon: Icons.lock,
        text: "Change Password",
        function: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => PasswrodCubit(locator<Repo>()),
                  child: const ChangePassword(),
                ),
              ));
        },
      ),
      drawerItem(
        myicon: Icons.translate,
        text: "Change Language",
      ),
      drawerItem(
        myicon: Icons.dark_mode,
        text: "DarkMode",
      ),
      drawerItem(
        myicon: Icons.account_box_outlined,
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

  void showCustomSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.report_gmailerrorred_rounded,
              color: Colors.white,
              size: 25.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              'Your account is not verfied yet.',
              style: TextStyle(color: Colors.white, fontSize: 15.sp),
            ),
          ],
        ),
        backgroundColor: const Color(0xffff0f0f),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}
