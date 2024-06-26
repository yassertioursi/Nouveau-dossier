// ignore_for_file: prefer_const_constructors

import 'package:easyhome/Rechidi/core/helper/cache.dart';
import 'package:easyhome/Rechidi/core/shared/noitemwidget.dart';
import 'package:easyhome/SnackBars/FlashMessage.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';

import 'package:easyhome/User/features/User_App/F2_Home_User/Provider/Ok_Provider.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/Notifications/NotificationsWidget.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/Notifications/Services/GetCount.dart';
import 'package:easyhome/User/features/User_App/GetToken.dart';
import 'package:easyhome/User/features/User_App/userProfile/visitProfile/visitProfileUser.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Provider/Provider_Filter.dart';

import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Service/Delete_App.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Service/Get_All_Posts.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Service/Get_Me_Worker.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Service/Save_Post.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/common_widgets/Filter_Widget_Worker.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/common_widgets/SendApp.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'common_widgets/details.dart';

class HomeWorkerMain extends StatelessWidget {
  const HomeWorkerMain({super.key});

  @override
  Widget build(BuildContext context) {
    GetMeWorker getMeWorker = GetMeWorker();
    return FutureBuilder<String>(
      future: getMeWorker.getMeWorker(AuthCache.token!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
            ),
            body: const Center(
              child: SizedBox(
                height: 50.0,
                width: 50.0,
                child: CircularProgressIndicator(
                  color: MyColors.mainblue,
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || getMeWorker.worker == null) {
          return Center(
              child: Text(
            '',
            style: TextStyle(color: MyColors.mainblue),
          ));
        } else {
          return HomeWorker(myJob: getMeWorker.worker!["job"]);
        }
      },
    );
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
  String minPrice = "";

  String maxPrice = "";

  List<String> jobs = [];

  @override
  Widget build(BuildContext context) {
    GetCountNotification getCountNotification = GetCountNotification();
    String postUrl = "https://easyhome-lcvx.onrender.com/api/v1/users/posts?";

    if (minPrice.isNotEmpty) {
      postUrl += "&price[gte]=$minPrice";
    }
    if (maxPrice.isNotEmpty) {
      postUrl += "&price[lte]=$maxPrice";
    }
    String selected_jobs = "";
    if (jobs.isNotEmpty) {
      int i = 0;
      for (i = 0; i < jobs.length; i++) {
        selected_jobs = selected_jobs + "&\$or[${i}][job]=${jobs.elementAt(i)}";
      }
      if (i == 0 && !selected_jobs.isEmpty) {
        selected_jobs = "&job=${selected_jobs[0]}";
      }
      postUrl += selected_jobs;
    }
    print(postUrl);
    GetAllPosts getAllPosts = GetAllPosts();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderFilter()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.center,
            child: Text(
              widget.myJob,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                showDialog(
                  barrierColor: Colors.black.withOpacity(0.0),
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FilterWidgetWorker(
                              jobs: jobs,
                              minPrice: minPrice,
                              maxPrice: maxPrice,
                              onFilter:
                                  (String min, String max, List<String> jbs) {
                                setState(() {
                                  maxPrice = max;
                                  minPrice = min;
                                  jobs = jbs;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0, left: 8.0),
                child: Icon(
                  Icons.tune,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
          backgroundColor: MyColors.mainblue,
          leading: Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 5),
            child: InkWell(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Icon(
                      size: 30,
                      Icons.notifications_rounded,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0, left: 20),
                    child: FutureBuilder<String>(
                      future: getCountNotification.getmycount(AuthCache.token!),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Text("");
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else if (!snapshot.hasData ||
                            getCountNotification.mycount == null) {
                          return Text('');
                        } else {
                          return Text(
                            "${getCountNotification.mycount}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              onTap: () {
                MyNotifications notifications =
                    MyNotifications(AuthCache.token!);
                notifications.showMyNotifications(context);
              },
            ),
          ),
        ),
        body: FutureBuilder<String>(
          future: getAllPosts.getAllPosts(
            AuthCache.token!,
            postUrl,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(
                    color: MyColors.mainblue,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (!snapshot.hasData || getAllPosts.posts == null) {
              return Center(
                  child: Text(
                'No Internet Connection',
                style: TextStyle(color: MyColors.mainblue),
              ));
            } else {
              return NoItemsWidget(
                condition: getAllPosts.posts!.isNotEmpty,
                child: ListView.builder(
                  itemCount: getAllPosts.posts!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SafeArea(
                      child: PostItem(
                        userName: getAllPosts.posts![index]["post"]["user"]
                                ["name"] ??
                            "",
                        userId: getAllPosts.posts![index]["post"]["user"]
                                ["_id"] ??
                            "",
                        userWilaya: getAllPosts.posts![index]["post"]["user"]
                            ["wilaya"],
                        postId: getAllPosts.posts![index]["post"]["_id"],
                        postTitle: getAllPosts.posts![index]["post"]["title"],
                        postDesc: getAllPosts.posts![index]["post"]
                            ["description"],
                        postPrice: getAllPosts.posts![index]["post"]["price"]
                            .toString(),
                        postCreatedAt: getAllPosts.posts![index]["post"]
                            ["createdAt"],
                        postImages: getAllPosts.posts![index]["post"]["images"],
                        userProfilePicture: getAllPosts.posts![index]["post"]
                            ["user"]["profilePicture"],
                        isSaved: getAllPosts.posts![index]["isSaved"],
                        application: getAllPosts.posts![index]["application"],
                        Post: getAllPosts.posts![index],
                        phoneNumber: getAllPosts.posts![index]["post"]["user"]
                                ["phoneNumber"] ??
                            "0",
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class PostItem extends StatelessWidget {
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
  String phoneNumber;

  Map Post;

  PostItem({
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
    required this.phoneNumber,
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
            InkWell(
              onTap: () {
                VisitProfileUser visitProfileUser = VisitProfileUser();
                visitProfileUser.visitProfileUser(context, userName,
                    userProfilePicture, userWilaya, phoneNumber);
              },
              child: Padding(
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
                                    fontSize: 16,
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
                  ],
                ),
              ),
            ),
            !postImages.isEmpty
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
                    return Consumer<ProviderLoading>(
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
                                  size: 40, color: Colors.black),
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
                              if (application["id"] == null) {
                                context.showErrorMessage("Error!",
                                    "You have a deal with the application.");
                              } else {
                                if (!providerload.isLoading) {
                                  providerload.setLoad(true);
                                  DeleteApp deleteApp = DeleteApp();
                                  providerok2.setOk(!providerok2.isOk);
                                  if (await deleteApp.deleteApp(
                                      AuthCache.token!, application["id"])) {
                                    context.showSuccessMessage("Success",
                                        "The application has been deleted  successfully .");

                                    providerload.setLoad(false);
                                  } else {}
                                }
                              }
                              providerload.setLoad(false);
                            }
                          });
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
                    height: 30,
                    width: 30,
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
                            padding: const EdgeInsets.all(0.0),
                            child: Image.asset(
                              providerok.isOk
                                  ? "lib/utils/images/save.png"
                                  : "lib/utils/images/save1.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          onTap: () async {
                            if (!providerload.isLoading) {
                              providerload.setLoad(true);
                              providerok.setOk(!providerok.isOk);

                              SavePost savePost = SavePost();
                              if (await savePost.savePost(
                                  AuthCache.token!, postId)) {
                                if (providerok.isOk) {
                                  context.showSuccessMessage(
                                      "Success", "Post saved successfully.");
                                } else {
                                  context.showSuccessMessage(
                                      "Success", "Post unsaved successfully.");
                                }
                                Post["isSaved"] = !Post["isSaved"];
                                providerload.setLoad(false);
                              } else {
                                context.showErrorMessage(
                                    "Error!", "Failed to save the post.");
                                providerok.setOk(!providerok.isOk);
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
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      postTitle,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 17),
                    ),
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
