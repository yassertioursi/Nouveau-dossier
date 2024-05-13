import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/cubit/worker_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/widgets/profile/drawer/myDrawer.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/widgets/profile/profile_page/build_Reviews.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/widgets/profile/profile_page/build_certificate.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/widgets/profile/profile_page/build_portfolio.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/widgets/profile/profile_page/my_tabbar.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/widgets/profile/profile_page/uper_profile.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/widgets/profile/profile_page/worker_informations.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/worker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkerProfileScreen extends StatefulWidget {
  const WorkerProfileScreen({super.key});

  @override
  State<WorkerProfileScreen> createState() => _WorkerProfileScreenState();
}

MyWorker? workerDetails;

class _WorkerProfileScreenState extends State<WorkerProfileScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> key = GlobalKey();

  Widget buildBloc(MyWorker? worker) {
    return BlocBuilder<WorkerCubit, WorkerState>(
      builder: (context, state) {
        if (state is GetWorkerDetails) {
          workerDetails = state.worker;
          worker = state.worker;

          return _buildBody();
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildBody() {
    return DefaultTabController(
      length: 3,
      child: NestedScrollView(
        headerSliverBuilder: (context, _) {
          return [
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  buildUperProfile(key, context),
                  workerInformations(),
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
                  BuildPortfolio(),
                  BuildReviews(),
                  BuildCertificate(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MyWorker? worker;
    return Scaffold(
      backgroundColor: Mycolors.myWhite,
      key: key,
      body: Stack(
        children: [
          buildBloc(worker),
        ],
      ),
      floatingActionButton: Container(
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      endDrawer: myDrawer(workerDetails, context),
    );
  }
}
