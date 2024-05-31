import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';

import 'package:easyhome/User/features/User_App/F2_Home_User/Provider/Ok_Provider.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Provider/Provider_Filter.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Provider/Provider_Posts.dart';

import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Service/Delete_App.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Service/GetMyRequests.dart';

import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Service/Get_Me_Worker.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Service/Save_Post.dart';

import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/common_widgets/SendApp.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/common_widgets/details.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Requests extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  Requests({super.key});

  @override
  Widget build(BuildContext context) {
    GetMeWorker getMeWorker = GetMeWorker();
    return FutureBuilder<String>(
        future: getMeWorker.getMeWorker(
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE1MjY1ODIxLCJleHAiOjE3MjMwNDE4MjF9.xvSfns86_RrA4fUCiVJGmTCqGu9IV2yPISumotOp25w"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              body: const Center(
                  child: SizedBox(
                height: 60.0,
                width: 60.0,
                child: CircularProgressIndicator(
                  color: MyColors.mainblue,
                ),
              )),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return HomeWorker(myJob: getMeWorker.worker!["job"]);
          }
        });
  }
}

// ignore: must_be_immutable
class HomeWorker extends StatefulWidget {
  String myJob;
  HomeWorker({Key? key, required this.myJob}) : super(key: key);

  @override
  State<HomeWorker> createState() => _HomeWorkerState();
}

class _HomeWorkerState extends State<HomeWorker> {
  @override
  Widget build(BuildContext context) {
    GetMyRequests getMyRequests = GetMyRequests();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderFilter()),
      ],
      child: Scaffold(
        body: FutureBuilder<String>(
          future: getMyRequests.getMyRequests(
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE1MjY1ODIxLCJleHAiOjE3MjMwNDE4MjF9.xvSfns86_RrA4fUCiVJGmTCqGu9IV2yPISumotOp25w"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: SizedBox(
                height: 60.0,
                width: 60.0,
                child: CircularProgressIndicator(
                  color: MyColors.mainblue,
                ),
              ));
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return ListView.builder(
                itemCount: getMyRequests.requests!.length,
                itemBuilder: (BuildContext context, int index) {
                  return SafeArea(
                    child: RequestItem(
                      userName: getMyRequests.requests![index]["post"]["user"]
                          ["name"],
                      userId: getMyRequests.requests![index]["post"]["user"]
                          ["_id"],
                      userWilaya: getMyRequests.requests![index]["post"]["user"]
                          ["wilaya"],
                      postId: getMyRequests.requests![index]["post"]["_id"],
                      postTitle: getMyRequests.requests![index]["post"]
                          ["title"],
                      postDesc: getMyRequests.requests![index]["post"]
                          ["description"],
                      postPrice: getMyRequests.requests![index]["post"]["price"]
                          .toString(),
                      postCreatedAt: getMyRequests.requests![index]["post"]
                          ["createdAt"],
                      postImages: getMyRequests.requests![index]["post"]
                          ["images"],
                      userProfilePicture: getMyRequests.requests![index]["post"]
                          ["user"]["profilePicture"],
                      isSaved: getMyRequests.requests![index]["isSaved"],
                      application: getMyRequests.requests![index]
                          ["application"],
                      Post: getMyRequests.requests![index],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RequestItem extends StatelessWidget {
  var Image_Controller = PageController();
  String userName;
  String userId;
  String userWilaya;
  String userProfilePicture;
  String postId;
  String postTitle;
  String postDesc;
  String postPrice;
  String postCreatedAt;
  List postImages;
  bool isSaved;
  Map application;
  Map Post;

  RequestItem({
    Key? key,
    required this.userName,
    required this.userId,
    required this.userWilaya,
    required this.userProfilePicture,
    required this.postId,
    required this.postTitle,
    required this.postDesc,
    required this.postPrice,
    required this.postCreatedAt,
    required this.postImages,
    required this.isSaved,
    required this.application,
    required this.Post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool yesorno = true;
    bool yesorno1 = true;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderOk(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderLoading(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderLoading1(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderOk2(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => ProviderPosts(),
        ),
      ],
      child: Container(
        decoration: BoxDecoration(
            border: Border.symmetric(
                horizontal: BorderSide(
                    color: Colors.grey.withOpacity(0.3), width: 0.5))),
        padding: const EdgeInsets.only(top: 30, bottom: 30),
        height: postImages.isEmpty ? (postTitle.length > 40 ? 400 : 300) : 800,
        width: MediaQuery.of(context).size.width - 80,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: SizedBox(
                          height: 55,
                          width: 55,
                          child: userProfilePicture == "default.jpg"
                              ? Image.asset(
                                  "lib/utils/images/default.jpg",
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  userProfilePicture,
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                userWilaya,
                                style: const TextStyle(
                                    color: MyColors.mainorange,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          size: 40,
                          Icons.more_vert,
                          color: Colors.black,
                        )),
                  )
                ],
              ),
            ),
            postImages.isNotEmpty
                ? Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                      child: PageView.builder(
                        controller: Image_Controller,
                        itemCount: postImages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return AspectRatio(
                            aspectRatio: 1.0,
                            child: Image.network(
                              postImages[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),
                  )
                : const SizedBox(
                    height: 20,
                  ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<ProviderOk2>(builder: (context, providerok2, child) {
                    return Consumer<ProviderLoading1>(
                        builder: (context, providerload, child) {
                      if (yesorno1) {
                        providerok2.setOk(application["applied"]);
                        yesorno1 = false;
                      }
                      return InkWell(
                        child: providerok2.isOk
                            ? const Icon(
                                Icons.work,
                                size: 40,
                                color: Colors.black,
                              )
                            : Icon(Icons.work_outline,
                                size: 40, color: Colors.black.withOpacity(0.7)),
                        onTap: () async {
                          if (!providerok2.isOk) {
                            showModalBottomSheet(
                              backgroundColor: Colors.white,
                              useSafeArea: true,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                              ),
                              context: context,
                              builder: (BuildContext context) {
                                return SendAppWidget(
                                  postId: postId,
                                  onAppCreated: (bool status) {
                                    providerok2.setOk(status);
                                    Post["application"]["applied"] =
                                        !Post["application"]["applied"];
                                  },
                                );
                              },
                            );
                          } else {
                            if (!providerload.isLoading) {
                              providerload.setLoad(true);
                              DeleteApp deleteApp = DeleteApp();
                              providerok2.setOk(!providerok2.isOk);
                              if (await deleteApp.deleteApp(
                                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE0Njg5OTI1LCJleHAiOjE3MjI0NjU5MjV9.7V_Vl_kuzSpqKppoJsnZgeuaTBzxZXWHgrWsGHtn2-g",
                                  application["id"])) {
                                providerload.setLoad(false);
                              }
                            }
                          }
                        },
                      );
                    });
                  }),
                  postImages.length != 1
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: SmoothPageIndicator(
                              controller: Image_Controller,
                              count: postImages.length,
                              effect: const ScrollingDotsEffect(
                                dotColor: Color(0xFFD7D4D4),
                                activeDotColor: MyColors.mainorange,
                                dotHeight: 9,
                                dotWidth: 9,
                              ),
                              onDotClicked: (index) {},
                            ),
                          ),
                        )
                      : const Text(""),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Consumer<ProviderOk>(
                        builder: (context, providerok, child) {
                      return Consumer<ProviderLoading>(
                          builder: (context, providerload, child) {
                        if (yesorno) {
                          providerok.setOk(isSaved);
                          yesorno = false;
                        }
                        return InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset(
                              providerok.isOk
                                  ? "lib/utils/images/save-instagram.png"
                                  : "lib/utils/images/save-instagram1.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () async {
                            if (!providerload.isLoading) {
                              providerload.setLoad(true);
                              providerok.setOk(!providerok.isOk);

                              SavePost savePost = SavePost();
                              if (await savePost.savePost(
                                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE0Njg5OTI1LCJleHAiOjE3MjI0NjU5MjV9.7V_Vl_kuzSpqKppoJsnZgeuaTBzxZXWHgrWsGHtn2-g",
                                  postId)) {
                                print("+++");
                                Post["isSaved"] = !Post["isSaved"];
                                providerload.setLoad(false);
                              }
                              ;
                            }
                          },
                        );
                      });
                    }),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    postTitle,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(17, 10.0, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "MaxPrice :",
                        style: TextStyle(
                            color: Color(0xFF3E3E3E),
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                      Text(
                        postPrice != "null"
                            ? " $postPrice DA"
                            : " Not Mentioned",
                        style: const TextStyle(
                            color: Color(0xFF137A23),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.white,
                        useSafeArea: true,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) {
                          return Details(
                            desc: postDesc,
                            createdAt: postCreatedAt,
                          );
                        },
                      );
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 12.0,
                        right: 12,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Details",
                            style: TextStyle(
                                color: Color(0xFF3E3E3E),
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF3E3E3E),
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
