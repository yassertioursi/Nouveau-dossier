import 'package:easyhome/SnackBars/FlashMessage.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/Notifications/Provider/ProviderNotificationsSelected.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/Notifications/Services/DeleteNotification.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/Notifications/Services/GetNorification.dart';

import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MyNotifications {
  late String token;
  MyNotifications(String tok) {
    this.token = tok;
  }

  void showMyNotifications(BuildContext context) async {
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
          GetNotification getNotification = GetNotification();

          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                  create: (BuildContext context) => ProviderMyNots()),
              ChangeNotifierProvider(
                  create: (BuildContext context) => ProviderLoading()),
            ],
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height - 50,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                children: [
                  Column(children: [
                    Container(
                      color: const Color(0xFFA2A2A2),
                      height: 7,
                      width: 70,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 20),
                      child: Text(
                        "Notifications",
                        style: TextStyle(
                          color: MyColors.mainblue,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 0.1,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, -1),
                          ),
                        ],
                      ),
                    ),
                  ]),
                  FutureBuilder<String>(
                      future: getNotification.getmynotifications(token),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Center(
                                child: SizedBox(
                              height: 60,
                              width: 60,
                              child: CircularProgressIndicator(
                                color: MyColors.mainblue,
                              ),
                            )),
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Consumer<ProviderMyNots>(
                              builder: (context, mynotsprovider, child) {
                            mynotsprovider.currentNotifications =
                                getNotification.notifications!;

                            if (mynotsprovider.currentNotifications.isEmpty) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 40.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      child: Image.asset(
                                        "lib/utils/images/Pushnotifications-rafiki.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    const Center(
                                      child: Text(
                                        "No Available Notifications",
                                        style: TextStyle(
                                          color: MyColors.mainblue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }

                            return Expanded(
                                child: Stack(
                              children: [
                                Container(
                                  color: Colors.white,
                                  child: ListView.builder(
                                    itemCount: mynotsprovider
                                        .currentNotifications.length,
                                    itemBuilder: (context, index) => Stack(
                                      children: [
                                        NotificationItem(
                                            selectNots: mynotsprovider,
                                            onNotificationSelected:
                                                (selected) => true,
                                            title: mynotsprovider
                                                    .currentNotifications[index]
                                                ["title"],
                                            body: mynotsprovider
                                                    .currentNotifications[index]
                                                ["body"],
                                            id: mynotsprovider
                                                    .currentNotifications[index]
                                                ["_id"]),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10, top: 10),
                                            child: InkWell(
                                              onTap: () {
                                                mynotsprovider
                                                        .notifications.isEmpty
                                                    ? mynotsprovider
                                                        .notifications
                                                        .add(getNotification
                                                                .notifications![
                                                            index]["_id"])
                                                    : mynotsprovider
                                                        .notifications
                                                        .remove(getNotification
                                                                .notifications![
                                                            index]["_id"]);
                                                mynotsprovider
                                                    .notifyListeners();
                                              },
                                              child: mynotsprovider
                                                      .notifications
                                                      .contains(getNotification
                                                              .notifications![
                                                          index]["_id"])
                                                  ? const Icon(
                                                      Icons.check_circle)
                                                  : const Text(""),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                mynotsprovider.notifications.length == 1
                                    ? Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Consumer<ProviderLoading>(
                                            builder: (context, providerloading,
                                                child) {
                                          return InkWell(
                                            onTap: () async {
                                              providerloading.setLoad(true);
                                              DeleteNotification
                                                  deleteNotification =
                                                  DeleteNotification();

                                              if (await deleteNotification
                                                  .deleteNot(
                                                      token,
                                                      mynotsprovider
                                                          .notifications[0])) {
                                                for (int i = 0;
                                                    i <
                                                        mynotsprovider
                                                            .currentNotifications
                                                            .length;
                                                    i++) {
                                                  if (mynotsprovider
                                                              .currentNotifications[
                                                          i]["_id"] ==
                                                      mynotsprovider
                                                          .notifications[0]) {
                                                    mynotsprovider
                                                        .currentNotifications
                                                        .remove(mynotsprovider
                                                            .currentNotifications[i]);
                                                    mynotsprovider.notifications
                                                        .remove(mynotsprovider
                                                            .notifications[0]);
                                                    mynotsprovider
                                                        .notifyListeners();

                                                    break;
                                                  }
                                                }
                                                context.showSuccessMessage(
                                                    "Success",
                                                    "the notification was successfully deleted.");
                                              } else {
                                                context.showErrorMessage(
                                                    "Error",
                                                    "An error occurred while deleting the notification.");
                                              }
                                              providerloading.setLoad(false);
                                            },
                                            child: Container(
                                              height: 70,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              color: Colors.red[800],
                                              child: Center(
                                                child: !providerloading
                                                        .isLoading
                                                    ? const Text(
                                                        "Delete",
                                                        style: TextStyle(
                                                          fontSize: 23,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      )
                                                    : const SizedBox(
                                                        height: 23,
                                                        width: 23,
                                                        child:
                                                            CircularProgressIndicator(
                                                          strokeWidth: 3,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          );
                                        }),
                                      )
                                    : const Text(""),
                              ],
                            ));
                          });
                        }
                      })
                ],
              ),
            ),
          );
        });
  }
}

class NotificationItem extends StatelessWidget {
  final Function(bool selected) onNotificationSelected;
  String title;
  String body;
  String id;
  ProviderMyNots selectNots = ProviderMyNots();
  NotificationItem({
    required this.title,
    required this.body,
    required this.id,
    required this.selectNots,
    required this.onNotificationSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 17, 20, 10.0),
      child: SizedBox(
        child: InkWell(
          onLongPress: () {
            if (selectNots.notifications.length < 1) {
              selectNots.notifications.add(id);
              selectNots.notifyListeners();
            }
          },
          onTap: () {
            if (selectNots.notifications.contains(id)) {
              selectNots.notifications.remove(id);
              selectNots.notifyListeners();
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: Image.asset(
                      "lib/utils/images/alert.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8, bottom: 10.0, top: 10),
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: MyColors.mainblue,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Text(
                            body,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15
                                ,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
