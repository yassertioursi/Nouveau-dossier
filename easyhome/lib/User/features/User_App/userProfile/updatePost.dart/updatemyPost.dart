// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:io';

import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/commonWidgets/Drop__jobs.dart';

import 'package:easyhome/User/features/User_App/F3_Create_Post/Provider/ProviderImages.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/Services/Create_post_service.dart';

import 'package:easyhome/User/features/User_App/F3_Create_Post/commonWidgets/fromCameraOrGalery.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Get_PostByID.dart';
import 'package:easyhome/User/features/User_App/GetToken.dart';
import 'package:easyhome/User/features/User_App/userProfile/updatePost.dart/services/updatePost.dart';

import 'package:easyhome/utils/constants/Categorys.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class UpdateMyPost {
  GlobalKey<FormState> formstate_title = GlobalKey();
  GlobalKey<FormState> formstate_desc = GlobalKey();
  GlobalKey<FormState> formstate_price = GlobalKey();
  TextEditingController priceController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  var Image_Controller = PageController();
  bool _isInitialized = false; // Flag to control refresh

  void update_post(BuildContext context, String postId) {
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
          GetPost getmypost = GetPost();

          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => DropJobsProvider(),
              ),
              ChangeNotifierProvider(
                create: (BuildContext context) => ProviderImages(),
              ),
              ChangeNotifierProvider(
                create: (BuildContext context) => ProviderLoading(),
              ),
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
                  Column(
                    children: [
                      Container(
                        color: const Color(0xFFA2A2A2),
                        height: 7,
                        width: 70,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 15.0, bottom: 20),
                        child: Text(
                          "Update my post",
                          style: TextStyle(
                            color: MyColors.mainorange,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        height: 0.1,
                        decoration:
                            const BoxDecoration(color: Colors.grey, boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, -1),
                          )
                        ]),
                      )
                    ],
                  ),
                  FutureBuilder<String>(
                      future: getmypost.getpost(TokenUser.token, postId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: const Center(
                                  child: SizedBox(
                                    child: CircularProgressIndicator(
                                      color: MyColors.mainblue,
                                    ),
                                    height: 40.0,
                                    width: 40.0,
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          if (!_isInitialized) {
                            titleController.text = getmypost.post["title"];
                            descController.text = getmypost.post["description"];
                            priceController.text =
                                getmypost.post["price"] ?? "";
                            _isInitialized = true;
                          }

                          return Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 20, 15, 20),
                                    child: Form(
                                      key: formstate_title,
                                      child: TextFormField(
                                        onChanged: (value) {
                                          formstate_title.currentState!
                                              .validate();
                                        },
                                        controller: titleController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter a title";
                                          }
                                          return null;
                                        },
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        maxLength: 70,
                                        cursorColor: MyColors.mainblue,
                                        decoration: const InputDecoration(
                                          label: Text(
                                            "Title :",
                                            style: TextStyle(
                                              color: MyColors.mainblue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          focusColor: Colors.white,
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                              width: 1.5,
                                              color: Colors.black,
                                            ),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                width: 2, color: Colors.black),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                              width: 2,
                                              color: Colors.red,
                                            ),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                              width: 1.5,
                                              color: Colors.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 10, 15, 20),
                                    child: Form(
                                      key: formstate_desc,
                                      child: SizedBox(
                                        height: 140,
                                        child: TextFormField(
                                          controller: descController,
                                          maxLengthEnforcement:
                                              MaxLengthEnforcement.enforced,
                                          maxLength: 200,
                                          maxLines: 7,
                                          cursorColor: MyColors.mainblue,
                                          decoration: const InputDecoration(
                                            label: Text(
                                              "Description :",
                                              style: TextStyle(
                                                color: MyColors.mainblue,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            alignLabelWithHint: true,
                                            focusColor: Colors.white,
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                width: 1.5,
                                                color: Colors.black,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              borderSide: BorderSide(
                                                  width: 2,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      DropJobs(
                                        inital: getmypost.post["job"],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 12.0),
                                        child: SizedBox(
                                          width: 120,
                                          height: 65,
                                          child: Form(
                                            key: formstate_price,
                                            child: TextFormField(
                                              maxLengthEnforcement:
                                                  MaxLengthEnforcement.enforced,
                                              maxLength: 10,
                                              maxLines: 1,
                                              validator: (value) {
                                                if (!RegExp(r'^[0-9]+$')
                                                        .hasMatch(value!) &&
                                                    value.isNotEmpty) {
                                                  return "";
                                                }
                                                return null;
                                              },
                                              keyboardType:
                                                  TextInputType.number,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
                                              textAlign: TextAlign.start,
                                              onChanged: (value) {
                                                formstate_price.currentState!
                                                    .validate();
                                              },
                                              controller: priceController,
                                              cursorColor: Colors.black,
                                              decoration: const InputDecoration(
                                                isDense: true,
                                                errorMaxLines: 3,
                                                errorStyle:
                                                    TextStyle(fontSize: 8),
                                                counterText: "",
                                                suffixStyle: TextStyle(
                                                  color: MyColors.mainblue,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                suffixText: " DA",
                                                hintText: "Price :",
                                                hintStyle: TextStyle(
                                                  color: MyColors.mainblue,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                focusColor: Colors.white,
                                                filled: true,
                                                fillColor: Colors.white,
                                                border: OutlineInputBorder(),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      width: 1.5,
                                                      color: Colors.black),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      width: 2,
                                                      color: Colors.black),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      width: 2,
                                                      color: Colors.red),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  borderSide: BorderSide(
                                                      width: 1.5,
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        bottom: 20.0, top: 20),
                                    child: SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width -
                                          120,
                                      child: Consumer<ProviderLoading>(builder:
                                          (context, providerloading, child) {
                                        return Consumer<DropJobsProvider>(
                                            builder:
                                                (context, providerdrop, child) {
                                          return ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                              ),
                                              onPressed: () async {
                                                print(
                                                    providerdrop.dropdownValue);
                                                if (formstate_title.currentState!.validate() &&
                                                    formstate_price
                                                        .currentState!
                                                        .validate() &&
                                                    Workers_Cat().cats.contains(
                                                        providerdrop
                                                            .dropdownValue)) {
                                                  if (!providerloading
                                                      .isLoading) {
                                                    providerloading
                                                        .setLoad(true);
                                                    UpdatePostService
                                                        updatemyPost =
                                                        UpdatePostService();
                                                    await updatemyPost
                                                        .updatePost(
                                                            titleController
                                                                .text,
                                                            priceController
                                                                .text,
                                                            descController.text,
                                                            providerdrop
                                                                .dropdownValue!,
                                                            postId,
                                                            TokenUser.token);

                                                    providerloading
                                                        .setLoad(false);
                                                  }
                                                } else {
                                                  print(providerdrop
                                                      .dropdownValue);
                                                  print("error");
                                                }
                                              },
                                              child: !providerloading.isLoading
                                                  ? const Text("Update",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                  : Center(
                                                      child: const SizedBox(
                                                        height: 20,
                                                        width: 20,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ));
                                        });
                                      }),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      }),
                ],
              ),
            ),
          );
        });
  }
}