import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/Dwwira.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/Ok_Provider.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Services/Get_Worker_ById.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/BloC/Change_Status.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/BloC/Refresh_Apps.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Create_Deal.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Decline_App.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Get_My_Apps.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Get_PostByID.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/common_widgets/CreateDealWidget.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetApps getapps = GetApps();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => RefreshApps()),
      ],
      child: FutureBuilder<String>(
        future: getapps.getApps(
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:
                  Dwwira(color: MyColors.mainblue, height: 60.0, width: 60.0),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            List<String> stss = List.filled(getapps.apps.length, '');
            return ListView.builder(
                itemCount: getapps.apps.length,
                itemBuilder: (BuildContext context, int index) {
                  return AppItem(
                    postTitle: getapps.apps[index]["post"]["title"],
                    appId: getapps.apps[index]["_id"],
                    name: getapps.apps[index]["worker"]["name"],
                    job: getapps.apps[index]["worker"]["job"],
                    isCertified: getapps.apps[index]["worker"]["isCertified"],
                    profilePicture: getapps.apps[index]["worker"]
                        ["profilePicture"],
                    description: getapps.apps[index]["description"],
                    workerId: getapps.apps[index]["worker"]["_id"],
                    stss: stss,
                    index: index,
                  );
                });
          }
        },
      ),
    );
  }
}

class AppItem extends StatelessWidget {
  GlobalKey<FormState> formstate_desc = GlobalKey();
  int index;
  String postTitle;
  String appId;
  String workerId;
  String name;
  String job;
  bool isCertified;
  String profilePicture;
  String description;
  List<String> stss;

  AppItem({
    required this.postTitle,
    required this.appId,
    required this.workerId,
    required this.name,
    required this.job,
    required this.isCertified,
    required this.profilePicture,
    required this.description,
    required this.stss,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    bool yesorno = true;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ChangeStatus()),
        ChangeNotifierProvider(create: (BuildContext context) => bloc_five()),
        ChangeNotifierProvider(
            create: (BuildContext context) => bloc_five_One()),
      ],
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        width: MediaQuery.of(context).size.width - 40,
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: ClipOval(
                    child: Container(
                        height: 60,
                        width: 60,
                        child: profilePicture != "default.jpg"
                            ? Image.network(
                                profilePicture,
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                "lib/utils/images/default.jpg",
                                fit: BoxFit.cover,
                              )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          isCertified
                              ? Icon(
                                  Icons.verified_user_rounded,
                                  color: MyColors.green,
                                )
                              : Text(''),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 0),
                        child: Text(
                          job,
                          style: TextStyle(
                              color: MyColors.mainorange,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(15, 15, 0, 7),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Applied for your post : ",
                  style: TextStyle(
                    fontSize: 16,
                    color: MyColors.mainblue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 5),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(postTitle),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 20, 5, 20),
              child: Form(
                key: formstate_desc,
                child: SizedBox(
                  height: 140,
                  child: TextFormField(
                    initialValue: description,
                    readOnly: true,
                    maxLines: 7,
                    cursorColor: MyColors.mainblue,
                    decoration: InputDecoration(
                      label: Text(
                        "Description :",
                        style: TextStyle(
                            color: MyColors.mainblue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      alignLabelWithHint: true,
                      focusColor: Colors.white,
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1.5, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Consumer<ChangeStatus>(builder: (context, providerstatus, child) {
              providerstatus.setStatus(stss[index]);

              if (providerstatus.status.isEmpty) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Consumer<bloc_five>(builder: (context, bloc_5_1, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red[800],
                        ),
                        onPressed: () async {
                          if (!bloc_5_1.isLoading) {
                            bloc_5_1.setLoad(true);
                            DeclineApp declineApp = DeclineApp();
                            await declineApp.declineApp(
                                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA",
                                appId);

                            stss[index] = "Declined";

                            providerstatus.setStatus("Declined");
                            bloc_5_1.setLoad(false);
                          }
                        },
                        child: bloc_5_1.isLoading
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Decline",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      );
                    }),
                    SizedBox(
                      width: 15,
                    ),
                    Consumer<bloc_five_One>(
                        builder: (context, bloc_5_2, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: MyColors.green,
                        ),
                        onPressed: () async {
                          showModalBottomSheet(
                            backgroundColor: Colors.white,
                            useSafeArea: true,
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            context: context,
                            builder: (BuildContext context) {
                              return CreateDealWidget(
                                appId: appId,
                                workerName: name,
                                onDealCreated: (String status) {
                                  stss[index] = status;
                                  providerstatus.setStatus(status);
                                },
                              );
                            },
                          );

                          /* if (!bloc_5_2.isLoading) {
                            bloc_5_2.setLoad(true);
                            DeclineApp declineApp = DeclineApp();
                            await declineApp.declineApp(
                                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA",
                                appId);
                            providerstatus.setStatus("Accepted");
                            bloc_5_2.setLoad(false);
                          }*/
                        },
                        child: bloc_5_2.isLoading
                            ? SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Accept",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      );
                    }),
                  ],
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        providerstatus.status,
                        style: TextStyle(
                            color: providerstatus.status == "Accepted"
                                ? MyColors.green
                                : Colors.red[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                );
              }
            }),
          ],
        ),
      ),
    );
  }
}
