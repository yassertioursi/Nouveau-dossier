import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/Dwwira.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/Ok_Provider.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/workers_search.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/workers_selected.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Services/Get_Worker_ById.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Services/Search_Main.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Services/Send_Request(update_post).dart';

import 'package:easyhome/utils/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'filter__widget.dart';
import 'worker_two.dart';

class SearchWorkers extends SearchDelegate {
  int Id_Search;

  List<String> jobs;
  double rating;
  String wilaya;
  String sort;
  String postId;

  SearchWorkers({
    required this.Id_Search,
    required this.jobs,
    required this.rating,
    required this.wilaya,
    required this.sort,
    required this.postId,
  });
  @override
  String? get searchFieldLabel => "Search";

  @override
  TextStyle? get searchFieldStyle =>
      TextStyle(color: MyColors.mainblue, fontSize: 20);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: MyColors.mainblue,
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 90,
        color: MyColors.mainblue,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.fromLTRB(15, 15, 10, 15),
        filled: true,
        fillColor: Colors.white,
        hintStyle: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.w600,
          fontSize: 17,
        ),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      scaffoldBackgroundColor: MyColors.loggrey1,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
            onPressed: () {
              SystemChannels.textInput.invokeMethod('TextInput.hide');
              FocusScope.of(context).requestFocus(FocusNode());
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
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: FilterWidget(
                              jobs: jobs,
                              wilaya: wilaya,
                              rating: rating.toDouble(),
                              sortby: sort,
                              postID: postId,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.tune,
              size: 30,
            )),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: Icon(
          Icons.keyboard_arrow_left,
          size: 50,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Text("");
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // String field = query.replaceAll(" ", "");

    if (Id_Search == 2) {
      Search search = Search();
      if (query.isEmpty) {
        search.getUrl =
            "https://easyhome-lcvx.onrender.com/api/v1/workers/?page=1&fields=role,name,firstName,rating,job,wilaya,profilePicture,id,experience,email,isFavorite,isCertified&job=${jobs[0]}";
      } else {
        search.getUrl =
            "https://easyhome-lcvx.onrender.com/api/v1/workers/?page=1&fields=role,name,rating,job,wilaya,profilePicture,id,experience,email,isFavorite,isCertified&name=$query&job=${jobs[0]}";
      }

      return FutureBuilder<String>(
        future: search.search_workers(
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: Dwwira(color: MyColors.mainblue, height: 50, width: 50));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider(
                    create: (BuildContext context) => WorkersSearch()),
                ChangeNotifierProvider(
                    create: (BuildContext context) => WorkersSelect()),
              ],
              child: FutureBuilder<String>(
                future: search.search_workers(
                    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: Dwwira(
                            color: MyColors.mainblue, height: 50, width: 50));
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return WorkersList(
                      search: search,
                      postId: postId,
                    );
                  }
                },
              ),
            );
          }
        },
      );
    } else if (Id_Search == 1) {
      if (query.isEmpty) {
        return Text("");
      } else {
        Search search = Search();

        search.getUrl =
            "https://easyhome-lcvx.onrender.com/api/v1/workers/?page=1&fields=role,name,rating,job,wilaya,profilePicture,id,experience,email,isFavorite,isCertified&name=$query";
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (BuildContext context) => WorkersSearch()),
            ChangeNotifierProvider(
                create: (BuildContext context) => WorkersSelect()),
          ],
          child: FutureBuilder<String>(
            future: search.search_workers(
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: Dwwira(
                        color: MyColors.mainblue, height: 50, width: 50));
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return WorkersList(
                  search: search,
                  postId: postId,
                );
              }
            },
          ),
        );
      }
    } else {
      String selected_jobs = "";
      int i = 0;
      for (i = 0; i < jobs.length; i++) {
        selected_jobs = selected_jobs + "&\$or[${i}][job]=${jobs.elementAt(i)}";
      }
      if (i == 0 && !selected_jobs.isEmpty) {
        selected_jobs = "&job=${selected_jobs[0]}";
      }

      Search search = Search();

      bool c1 = !selected_jobs.isEmpty;
      bool c2 = wilaya != "All";
      bool c3 = sort != "Default";

      if (!query.isEmpty) {
        search.getUrl =
            "https://easyhome-lcvx.onrender.com/api/v1/workers/?page=1&fields=role,firstName,lastName,name,rating,job,wilaya,profilePicture,id,experience,isFavorite,isCertified&name=$query&rating[gte]=$rating";
      } else {
        search.getUrl =
            "https://easyhome-lcvx.onrender.com/api/v1/workers/?page=1&fields=role,firstName,lastName,name,rating,job,wilaya,profilePicture,id,experience,isFavorite,isCertified&rating[gte]=$rating";
      }

      if (c1) {
        search.getUrl = search.getUrl! + selected_jobs;
      }
      if (c2) {
        search.getUrl = search.getUrl! + "&wilaya=$wilaya";
      }
      if (c3) {
        search.getUrl = search.getUrl! + "&sort=-${sort.toLowerCase()}";
      }

      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (BuildContext context) => WorkersSearch()),
          ChangeNotifierProvider(
              create: (BuildContext context) => WorkersSelect()),
        ],
        child: FutureBuilder<String>(
          future: search.search_workers(
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA"),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child:
                      Dwwira(color: MyColors.mainblue, height: 50, width: 50));
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return WorkersList(
                search: search,
                postId: postId,
              );
            }
          },
        ),
      );
    }
  }
}

class WorkersList extends StatelessWidget {
  String postId;
  WorkersList({
    super.key,
    required this.postId,
    required this.search,
  });

  final Search search;

  @override
  Widget build(BuildContext context) {
    postId = "663428a0685145d9db5d5067";
    return Consumer<WorkersSearch>(builder: (context, workersprovider, child) {
      return Consumer<WorkersSelect>(
          builder: (context, workerselectprovider, child) {
        return Stack(
          children: [
            ListView.builder(
                itemCount: search.workers!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      Worker_two(
                        name: search.workers![index]["name"] ?? "",
                        email: "",
                        wilaya: search.workers![index]["wilaya"] ?? "",
                        phoneNumber: "",
                        rating: search.workers![index]["rating"] ?? "",
                        experience: search.workers![index]["experience"] ?? "",
                        profilePicture:
                            search.workers![index]["profilePicture"] ?? "",
                        job: search.workers![index]["job"] ?? "",
                        isCertified:
                            search.workers![index]["isCertified"] ?? "",
                        id: search.workers![index]["_id"] ?? "",
                        isFav: search.workers![index]["isFavorite"] ?? "",
                      ),
                      postId.isNotEmpty
                          ? Align(
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, left: 22),
                                child: InkWell(
                                  onTap: () {
                                    if (workerselectprovider.workers.contains(
                                        search.workers![index]["_id"])) {
                                      workerselectprovider.workers.remove(
                                          search.workers![index]["_id"]);
                                    } else {
                                      workerselectprovider.workers
                                          .add(search.workers![index]["_id"]);
                                    }
                                    workerselectprovider.notifyListeners();
                                  },
                                  child: !workerselectprovider.workers.contains(
                                          search.workers![index]["_id"])
                                      ? Icon(Icons.circle_outlined)
                                      : Icon(Icons.check_circle),
                                ),
                              ),
                              alignment: Alignment.topLeft,
                            )
                          : Text(" "),
                      Align(
                        alignment: Alignment.topRight,
                        child: Padding(
                            padding: EdgeInsets.only(top: 24, right: 30),
                            child: IconButton(
                                onPressed: () {
                                  search.workers!.removeAt(index);
                                  workersprovider.notifyListeners();
                                },
                                icon: Icon(Icons.close))),
                      ),
                    ],
                  );
                }),
            postId.isNotEmpty && workerselectprovider.workers.length > 0
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: InkWell(
                      onTap: () {
                        print(workerselectprovider.workers);
                        SendRequest sendRequest = SendRequest();
                        sendRequest.sendRequest(
                            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA",
                            "663428a0685145d9db5d5067",
                            workerselectprovider.workers);
                      },
                      child: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            "Send",
                            style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                : Text(''),
          ],
        );
      });
    });
  }
}
