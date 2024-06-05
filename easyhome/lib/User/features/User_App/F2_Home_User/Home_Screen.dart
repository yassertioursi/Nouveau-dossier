// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:easyhome/SnackBars/FlashMessage.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Services/GetBestWorker.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/Notifications/NotificationsWidget.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/Notifications/Services/GetCount.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/Notifications/Services/GetNorification.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/Create_Post.dart';
import 'package:easyhome/User/features/User_App/GetToken.dart';
import 'package:easyhome/utils/constants/Categorys.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/SearchWorkers.dart';

import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'common_widgets/Worker_One.dart';

class HomeUser extends StatelessWidget {
  GlobalKey<FormState> formstate = GlobalKey();
  var Image_Controller = PageController();

  @override
  Widget build(BuildContext context) {
    GetCountNotification getCountNotification = GetCountNotification();

    GetBestWorkers getBestWorkers = GetBestWorkers();
    Workers_Cat workers_cat = Workers_Cat();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                width: 80,
                child: Image.asset(
                  "lib/utils/images/logo.png",
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, right: 15),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.loggrey1,
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 0.5),
                          blurRadius: 1,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Form(
                      key: formstate,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: SearchWorkers(
                              Id_Search: 1,
                              jobs: [],
                              rating: 0,
                              wilaya: "All",
                              sort: 'Default',
                              postId: "",
                            ),
                          );
                        },
                        maxLines: 1,
                        cursorWidth: 3,
                        cursorColor: MyColors.mainblue,
                        style: const TextStyle(
                          color: MyColors.mainblue,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(20),
                          suffixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintMaxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: InkWell(
                  child: Stack(
                    children: [
                      Icon(
                        size: 40,
                        Icons.notifications_rounded,
                        color: MyColors.mainblue,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0.0, left: 26),
                        child: FutureBuilder<String>(
                            future: getCountNotification
                                .getmycount(AuthCache.token),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Text("");
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return Text(
                                  "${getCountNotification.mycount}",
                                  style: TextStyle(
                                    color: MyColors.mainblue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                );
                              }
                            }),
                      ),
                    ],
                  ),
                  onTap: () {
                    MyNotifications notifications =
                        MyNotifications(AuthCache.token);
                    notifications.showMyNotifications(context);
                  },
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, bottom: 15),
            child: Text(
              "Categorys",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3E3E3E),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 25,
            ),
            child: SizedBox(
              height: 70,
              child: ListView.builder(
                itemCount: workers_cat.cats.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.fromLTRB(13.0, 15, 5, 15),
                  child: InkWell(
                    onTap: () {
                      showSearch(
                          context: context,
                          delegate: SearchWorkers(
                              jobs: workers_cat.cats.sublist(index, index + 1),
                              Id_Search: 2,
                              rating: 0,
                              wilaya: "All",
                              sort: "Default",
                              postId: ""));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColors.mainblue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(right: 10.0, left: 10),
                            child: Text(workers_cat.cats[index],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 20, 0, 5),
            child: SizedBox(
              height: 240,
              child: PageView(
                controller: Image_Controller,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "lib/utils/images/mymainimage.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 7.0, bottom: 20),
              child: SmoothPageIndicator(
                  controller: Image_Controller,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                      dotColor: Color(0xFFD7D4D4),
                      activeDotColor: Color(0xFF666363),
                      dotHeight: 13,
                      dotWidth: 13),
                  onDotClicked: (index) {}),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, bottom: 20, top: 25),
            child: Text(
              "Best Workers",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3E3E3E),
              ),
            ),
          ),
          FutureBuilder<String>(
            future: getBestWorkers.getbestworkers(AuthCache.token),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: const Center(
                      child: SizedBox(
                    height: 40,
                    width: 40,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: MyColors.mainblue,
                      ),
                    ),
                  )),
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return SizedBox(
                  height: 210,
                  child: ListView.builder(
                      itemCount: getBestWorkers.bestWorkers!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        String rt1 = getBestWorkers.bestWorkers![index]
                                ["rating"]
                            .toString();
                        String exp1 = getBestWorkers.bestWorkers![index]
                                ["experience"]
                            .toString();
                        double rating = double.parse(rt1);
                        double exp = double.parse(exp1);
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(13.0, 15, 5, 15),
                          child: InkWell(
                            onTap: () {
                              print("++");
                            },
                            child: Worker_One(
                              name: getBestWorkers.bestWorkers![index]
                                      ["name"] ??
                                  "",
                              wilaya: getBestWorkers.bestWorkers![index]
                                      ["wilaya"] ??
                                  "",
                              experience: "44",
                              profilePicture: getBestWorkers.bestWorkers![index]
                                      ["profilePicture"] ??
                                  "",
                              job: getBestWorkers.bestWorkers![index]["job"] ??
                                  "",
                              isCertified: getBestWorkers.bestWorkers![index]
                                      ["isCertified"] ??
                                  false,
                              rating: rating,
                            ),
                          ),
                        );
                      }),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
