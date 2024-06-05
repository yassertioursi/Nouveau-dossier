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
import 'package:easyhome/User/features/User_App/All_5_features.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/password_Cubit/passwrod_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/edit_profile/changePassword/change_password.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/drawer/drawer_items.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/screens/worker_profile_sceen.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/widgets/profile/profile_page/build_certificate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

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
          reviews: _Reviews(),
          certificates: _Certificates(_isMe),
        ),
        drawer: const _Drawer(),
        floationgActionButton: _isMe ? _FloatingActionButton(_isMe) : _call(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      ),
    );
  }

  _call() {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(60),
        color: Colors.green,
      ),
      child: IconButton(
        icon: Icon(
          // TODO implement the Create portfolio element button
          Icons.call,
          size: 45.sp,
        ),
        color: Colors.white,
        onPressed: () async {
          await FlutterPhoneDirectCaller.callNumber(
              workerDetails?.worker?.phoneNumber ?? '0');
        },
      ),
    );
  }
}
