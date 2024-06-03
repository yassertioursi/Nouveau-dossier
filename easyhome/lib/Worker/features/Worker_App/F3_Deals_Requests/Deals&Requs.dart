import 'package:easyhome/Worker/features/Worker_App/F3_Deals_Requests/Deals.dart';
import 'package:easyhome/Worker/features/Worker_App/F3_Deals_Requests/Requests.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
            bottom: const TabBar(
                indicatorWeight: 4,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    child: Text(
                      "Deals",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Requests",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ]),
          ),
          key: scaffoldkey,
          body: Container(
            padding: const EdgeInsets.all(10),
            child: TabBarView(
              children: [
                const DealWorker(),
                Requests(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
