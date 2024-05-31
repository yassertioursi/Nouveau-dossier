import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyNotifications {
  void showMyNotifications(BuildContext context) {
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
        return Container(
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
              Expanded(
                child: Container(
                  color: Colors.white,
                  child: ListView.builder(
                    itemBuilder: (context, index) => const NotificationItem(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 25, 20, 20),
      padding: const EdgeInsets.all(10),
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
          const Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8, bottom: 10.0, top: 10),
                  child: Text(
                    "Title",
                    style: TextStyle(
                      color: MyColors.mainblue,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Padding(
                    padding: EdgeInsets.only(right: 10.0),
                    child: Text(
                      "Body BodyBodyBodyBodyBodyBodyBodyBodyBodyBodyB",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
