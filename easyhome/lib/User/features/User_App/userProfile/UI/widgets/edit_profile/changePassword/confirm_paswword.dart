import 'package:easyhome/User/features/User_App/userProfile/BloC/cubit/my_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/favorite_cubit/favorite_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/password_Cubit/passwrod_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/post_cubit/post_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/screens/user_profile_screen.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/injection.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class confirmPassword extends StatefulWidget {
  const confirmPassword({super.key, required this.context});
  final BuildContext context;
  @override
  State<confirmPassword> createState() => _confirmPasswordState();
}

Map<String, String> passwordMap = {};

class _confirmPasswordState extends State<confirmPassword> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: _buildButton(context),
    );
  }

  Widget _buildButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(60.w, 20, 60.w, 20.w),
      child: GestureDetector(
        onTap: () {
          confirmDialog(context);
        },
        child: Container(
          height: 60,
          width: 50,
          decoration: BoxDecoration(
            color: Mycolors.myBlue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              'Confirm',
              style: TextStyle(
                fontSize: 40.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void confirmDialog(BuildContext pageContext) {
  showDialog(
    context: pageContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Confirm',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Do you want to proceed?',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              savo(pageContext);
            },
            child: const Text(
              'Confirm',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Handle cancel action

              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      );
    },
  );
}

// TODO fix error handelling
void savo(BuildContext context) {
  BlocProvider.of<PasswrodCubit>(context).emitUpdatePassword(passwordMap);

  passwordMap = <String, String>{};
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => MyCubit(getIt<Repo>()),
            ),
            BlocProvider(
              create: (context) => FavoriteCubit(getIt<Repo>()),
            ),
            BlocProvider(
              create: (context) => PostCubit(getIt<Repo>()),
            ),
          ],
          child: const UserProfileScreen(),
        ),
      ));
}
