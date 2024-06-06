import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/drawer/drawer_item_list.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget myDrawer(BuildContext context, User user) {
  
  return Drawer(
    width: 250.w,
    child: DrawerItemList(user: user),
  );
}
