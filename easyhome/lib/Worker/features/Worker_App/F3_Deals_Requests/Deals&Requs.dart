import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Apps.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Deals.dart';
import 'package:easyhome/Worker/features/Worker_App/F3_Deals_Requests/Deals.dart';
import 'package:easyhome/Worker/features/Worker_App/F3_Deals_Requests/Requests.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class DealsRequs extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: MyColors.loggrey1,
          appBar: AppBar(
            backgroundColor: MyColors.mainblue,
            bottom:
                TabBar(indicatorWeight: 3, indicatorColor: Colors.white, tabs: [
              Tab(
                child: Text(
                  "Deals",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Tab(
                child: Text(
                  "Requests",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ]),
          ),
          key: scaffoldkey,
          body: Container(
            padding: EdgeInsets.all(10),
            child: TabBarView(
              children: [
                DealWorker(),
                Requests(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
