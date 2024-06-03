import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Apps.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Deals.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Deals_Apps extends StatelessWidget {
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
                      "Applications",
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
                Deal(),
                const App(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
