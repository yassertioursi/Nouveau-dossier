// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';

import 'package:easyhome/User/features/User_App/F3_Create_Post/Provider/ProviderImages.dart';

import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'package:provider/provider.dart';

import '../../F3_Create_Post/Services/drop_jobs_provider.dart';

class VisitProfileUser {
  void visitProfileUser(BuildContext context, String userName,
      String userProfilePicture, String userWilaya, String phoneNumber) async {
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
            height: MediaQuery.of(context).size.height / 3,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      color: const Color(0xFFA2A2A2),
                      height: 6,
                      width: 70,
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 35, 10, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  ClipOval(
                                    child: SizedBox(
                                      height: 70,
                                      width: 70,
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
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          userName,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 4),
                                          child: Text(
                                            userWilaya,
                                            style: const TextStyle(
                                                fontSize: 14,
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
                                padding: const EdgeInsets.only(right: 15.0),
                                child: InkWell(
                                  onTap: ()async { 
                                     await FlutterPhoneDirectCaller.callNumber(
             phoneNumber );
                                  },
                                  child: Icon(
                                    Icons.phone,
                                    color: MyColors.mainblue,
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }
}
