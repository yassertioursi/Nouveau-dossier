import 'package:easyhome/User/features/User_App/userProfile/BloC/cubit/my_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/favorite_cubit/favorite_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/post_cubit/post_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/update_cubit/update_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/screens/user_profile_screen.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/edit_profile/avatar_circle.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/edit_profile/save_button.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/edit_profile/text_fields.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/cubit/worker_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/portfolio/portfolio_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/screens/worker_profile_sceen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditUserScreen extends StatefulWidget {
  const EditUserScreen({super.key, required this.isUser});
  final bool isUser;
  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateCubit, UpdateState>(
      listener: (context, state) {
        if (state is UpdateUser) {
          if (widget.isUser) {
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
                    ],
                    child: const UserProfileScreen(),
                  ),
                ));
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => locator<WorkerCubit>(),
                      ),
                      BlocProvider(
                        create: (context) => locator<PortfolioCubit>(),
                      ),
                    ],
                    child: const WorkerProfileScreen(),
                  ),
                ));
          }
        }
      },
      child: Scaffold(
        appBar: _myAppBar(context),
        body: _buildBody(context, widget.isUser),
      ),
    );
  }
}

AppBar _myAppBar(BuildContext context) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(Icons.arrow_back),
    ),
    title: Padding(
      padding: EdgeInsets.only(left: 67.w),
      child: Text(
        "Edit Profile",
        style: TextStyle(
            fontSize: 25.sp,
            color: Mycolors.myBlue,
            fontWeight: FontWeight.bold),
      ),
    ),
    // backgroundColor: Mycolors.myWhite,
  );
}

Widget _buildBody(BuildContext context, bool isUser) {
  return ListView(
    shrinkWrap: true,
    scrollDirection: Axis.vertical,
    children: [
      Divider(
        thickness: 0.8.sp,
        color: Colors.black,
      ),
      avatarCircle(context),
      textFields(),
      SaveButton(
        context: context,
        isUser: isUser,
      ),
    ],
  );
}
