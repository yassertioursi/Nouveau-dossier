import 'package:easyhome/Rechidi/core/helper/cache.dart';
import 'package:easyhome/Rechidi/core/injection/index.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/cubit/my_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/drawer/myDrawer.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/profile_Page/build_favorite.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/profile_Page/build_post.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/profile_Page/my_tab_bar.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/profile_Page/uper_profile.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/profile_Page/user_informations.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/user.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

User userDetails = User();

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> key = GlobalKey();

  Widget buildBloc() {
    return BlocBuilder<MyCubit, MyState>(
      builder: (context, state) {
        BlocProvider.of<MyCubit>(context).emitGetUserDetails(AuthCache.userId!);
        if (state is GetUserDetails) {
          userDetails = state.user;

          return _buildBody(userDetails);
        } else {
          return const Center(
              child: CircularProgressIndicator(color: MyColors.mainblue));
        }
      },
    );
  }

  Scaffold _buildBody(User userDetails) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    buildUperProfile(
                      key,
                      context,
                      userDetails,
                    ),
                    userInformations(userDetails),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              myTabBar(),
              const Expanded(
                child: TabBarView(
                  children: [
                    BuildPost(),
                    BuildFavorite(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Mycolors.myWhite,
      key: key,
      endDrawer: myDrawer(context, userDetails),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyCubit(locator()),
      child: Scaffold(
        body: Stack(
          children: [
            buildBloc(),
          ],
        ),
      ),
    );
  }
}
