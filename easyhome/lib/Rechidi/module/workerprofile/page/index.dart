import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easyhome/Rechidi/core/constants/icons.dart';
import 'package:easyhome/Rechidi/core/extension/navigation.dart';
import 'package:easyhome/Rechidi/core/helper/cache.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';
import 'package:easyhome/Rechidi/core/shared/spacing.dart';
import 'package:easyhome/Rechidi/core/theme/colors.dart';
import 'package:easyhome/Rechidi/models/woker.dart';
import 'package:easyhome/Rechidi/module/certificate/page/index.dart';
import 'package:easyhome/Rechidi/module/posts/page/index.dart';
import 'package:easyhome/Rechidi/module/workerprofile/logic/worker_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/certificate.dart';
import '../../../models/portfoliopost.dart';
import '../../../models/review.dart';
import '../../editprofile/page/index.dart';

part 'scaffold.dart';
part 'personalinfo.dart';
part 'workerinfo.dart';
part 'tabview.dart';
part 'portfolio.dart';
part 'reviews.dart';
part 'certificates.dart';
part 'drawer.dart';
part 'floatingactionbutton.dart';

class WorkerProfile extends StatelessWidget {
  WorkerProfile({super.key, required String workerId})
      : _id = workerId,
        _isMe = workerId == AuthCache.userId;

  final String _id;
  final bool _isMe;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WorkerProfileCubit(locator())..fetchProfile(_id),
      child: _Scaffold(
        personalInfo: const _PersonalInfo(),
        workInfo: const _WorkerInfo(),
        tabView: _TabView(
          portfolio: _Portfolio(_isMe),
          reviews: _Reviews(_isMe),
          certificates: _Certificates(_isMe),
        ),
        drawer: const _Drawer(),
        floationgActionButton:  _FloatingActionButton(_isMe),
      ),
    );
  }
}
