// ignore: file_names
// ignore_for_file: must_be_immutable

import 'package:easyhome/Rechidi/core/helper/cache.dart';
import 'package:easyhome/Rechidi/module/workerprofile/page/index.dart';
import 'package:easyhome/SnackBars/FlashMessage.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';

import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Provider/Change_Status.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Provider/Refresh_Apps.dart';

import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Decline_App.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Get_My_Apps.dart';

import 'package:easyhome/User/features/User_App/F4_Deals_Apps/common_widgets/CreateDealWidget.dart';
import 'package:easyhome/User/features/User_App/GetToken.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    GetApps getapps = GetApps();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => RefreshApps()),
      ],
      child: FutureBuilder<String>(
        future: getapps.getApps(AuthCache.token!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: SizedBox(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(
                color: MyColors.mainblue,
              ),
            ));
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
  // ignore: non_constant_identifier_names
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
    super.key,
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ChangeStatus()),
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderLoading()),
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderLoading1()),
      ],
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        width: MediaQuery.of(context).size.width - 40,
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkerProfile(workerId: workerId),
                  ),
                ); //TODO
              },
              child: Row(
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
                      child: SizedBox(
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
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            isCertified
                                ? const Icon(
                                    Icons.verified_user_rounded,
                                    color: MyColors.green,
                                  )
                                : const Text(''),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 0),
                          child: Text(
                            job,
                            style: const TextStyle(
                                color: MyColors.mainorange,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
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
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 20),
              child: Form(
                key: formstate_desc,
                child: SizedBox(
                  height: 140,
                  child: TextFormField(
                    initialValue: description,
                    readOnly: true,
                    maxLines: 7,
                    cursorColor: MyColors.mainblue,
                    decoration: const InputDecoration(
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
                    Consumer<ProviderLoading>(
                        builder: (context, providerloading, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[800],
                        ),
                        onPressed: () async {
                          if (!providerloading.isLoading) {
                            providerloading.setLoad(true);
                            DeclineApp declineApp = DeclineApp();
                            if (await declineApp.declineApp(
                                AuthCache.token!, appId)) {
                              context.showSuccessMessage("Success",
                                  "The application has been declined successfully.");
                            } else {
                              context.showErrorMessage("Error!",
                                  "Failed to decline the application.");
                            }

                            stss[index] = "Declined";

                            providerstatus.setStatus("Declined");
                            providerloading.setLoad(false);
                          }
                        },
                        child: providerloading.isLoading
                            ? const SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                "Decline",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                      );
                    }),
                    const SizedBox(
                      width: 15,
                    ),
                    Consumer<ProviderLoading1>(
                        builder: (context, providerloading1, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.green,
                        ),
                        onPressed: () async {
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
                        child: providerloading1.isLoading
                            ? const SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
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
