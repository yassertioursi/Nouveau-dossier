import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/widgets/profile/drawer/drawer_item_list.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/worker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget myDrawer(MyWorker? worker, BuildContext context) {
  return Drawer(
    width: 250.w,
    child: Column(
      children: drawerItemsList(worker, context),
    ),
  );
}
