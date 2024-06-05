// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:easyhome/Rechidi/models/location.dart';
import 'package:easyhome/Rechidi/module/usermap/selectplace/logic/map_selector_cubit.dart';
import 'package:easyhome/Rechidi/module/usermap/selectplace/page/index.dart';
import 'package:easyhome/SnackBars/FlashMessage.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Animation/animation.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';

import 'package:easyhome/User/features/User_App/F3_Create_Post/Provider/ProviderImages.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/Services/Create_post_service.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/commonWidgets/UploadImages.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/commonWidgets/fromCameraOrGalery.dart';
import 'package:easyhome/User/features/User_App/GetToken.dart';
import 'package:easyhome/utils/constants/Categorys.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Services/drop_jobs_provider.dart';
import 'commonWidgets/Drop__jobs.dart';

class Create_Post {
  GlobalKey<FormState> formstate_title = GlobalKey();
  GlobalKey<FormState> formstate_location_title = GlobalKey();
  GlobalKey<FormState> formstate_desc = GlobalKey();
  GlobalKey<FormState> formstate_price = GlobalKey();
  TextEditingController priceController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController locationtitleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  var Image_Controller = PageController();

  void creat_post(BuildContext context) {
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
        ImagesUpload images_upload = ImagesUpload();
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
          child: Consumer<ProviderImages>(
            builder: (context, providerimages, child) {
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
                            "Create a new post",
                            style: TextStyle(
                              color: MyColors.mainorange,
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
                                )
                              ]),
                        )
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(15, 20, 15, 20),
                              child: Form(
                                key: formstate_title,
                                child: TextFormField(
                                  onChanged: (value) {
                                    formstate_title.currentState!.validate();
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                        width: 1.5,
                                        color: Colors.black,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.red,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
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
                              padding:
                                  const EdgeInsets.fromLTRB(15, 10, 15, 20),
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
                                            width: 2, color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(15, 20, 15, 20),
                              child: Form(
                                key: formstate_location_title,
                                child: TextFormField(
                                  onChanged: (value) {
                                    formstate_title.currentState!.validate();
                                  },
                                  controller: locationtitleController,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Enter a title for your location";
                                    }
                                    return null;
                                  },
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  maxLength: 40,
                                  cursorColor: MyColors.mainblue,
                                  decoration: const InputDecoration(
                                    label: Text(
                                      "Location Title :",
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                        width: 1.5,
                                        color: Colors.black,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 2, color: Colors.black),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.red,
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                        width: 1.5,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DropJobs(inital: "  Job :"),
                                Padding(
                                  padding: const EdgeInsets.only(top: 12.0),
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
                                              !value.isEmpty) {
                                            return "";
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.black),
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
                                          errorStyle: TextStyle(fontSize: 8),
                                          counterText: "",
                                          suffixStyle: TextStyle(
                                            color: MyColors.mainblue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          suffixText: " DA",
                                          hintText: "Price :",
                                          hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: MyColors.mainblue,
                                            fontWeight: FontWeight.w600,
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
                                                color: Colors.black),
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
                                                width: 2, color: Colors.red),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10)),
                                            borderSide: BorderSide(
                                                width: 1.5, color: Colors.red),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Consumer<ProviderImages>(
                              builder: (context, providerimages, child) {
                                if (providerimages.Images.isEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 30, 15, 20),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          30,
                                      height: 180,
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFDCECFF),
                                        border: Border.all(
                                          color: MyColors.mainblue,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            child: Image.asset(
                                              "lib/utils/images/photo.png",
                                              fit: BoxFit.fill,
                                            ),
                                            onTap: () async {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return CameraOrGalery(
                                                    onImagesSelected:
                                                        (List<File> images) {
                                                      providerimages.Add_Image(
                                                          images);
                                                      /* deal["status"] = status;
                                              providerstatus.setStatus(status);*/
                                                    },
                                                    providerImages:
                                                        providerimages,
                                                  );
                                                },
                                              );
                                              /*await images_upload.uploadImages(
                                                  context, providerimages);

                                              providerimages.just_notify();*/
                                            },
                                          ),
                                          const Text(
                                            "Upload Images",
                                            style: TextStyle(
                                              color: MyColors.mainblue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 30.0,
                                        ),
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width +
                                              20,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              20,
                                          child: PageView.builder(
                                            controller: Image_Controller,
                                            itemCount:
                                                providerimages.Images.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Stack(
                                                children: [
                                                  SizedBox(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            20,
                                                    child: Image.file(
                                                      providerimages
                                                          .Images[index],
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        Alignment.topRight,
                                                    child: InkWell(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Icon(
                                                          Icons.close,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      onTap: () {
                                                        providerimages
                                                            .Del_Image(index);
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      providerimages.Images.length > 1
                                          ? Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25.0, bottom: 25),
                                                child: SmoothPageIndicator(
                                                  controller: Image_Controller,
                                                  count: providerimages
                                                      .Images.length,
                                                  effect:
                                                      const ScrollingDotsEffect(
                                                    dotColor: Color(0xFFD7D4D4),
                                                    activeDotColor:
                                                        MyColors.mainorange,
                                                    dotHeight: 13,
                                                    dotWidth: 13,
                                                  ),
                                                  onDotClicked: (index) {},
                                                ),
                                              ),
                                            )
                                          : const Text(""" """),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                  "lib/utils/images/photo.png",
                                                  fit: BoxFit.fill,
                                                ),
                                                const Text(
                                                  "Add Images",
                                                  style: TextStyle(
                                                    color: MyColors.mainblue,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onTap: () async {
                                              showDialog(
                                                context: context,
                                                builder:
                                                    (BuildContext context) {
                                                  return CameraOrGalery(
                                                    onImagesSelected:
                                                        (List<File> images) {
                                                      providerimages.Add_Image(
                                                          images);
                                                      /* deal["status"] = status;
                                              providerstatus.setStatus(status);*/
                                                    },
                                                    providerImages:
                                                        providerimages,
                                                  );
                                                },
                                              );
                                              /*await images_upload
                                                  .uploadImageFromCamera(
                                                      context, providerimages);
                                              providerimages.just_notify(); */
                                            },
                                          ),
                                          InkWell(
                                            child: const Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.all(2),
                                                  child: Icon(
                                                    Icons.delete,
                                                    size: 30,
                                                    color: MyColors.mainorange,
                                                  ),
                                                ),
                                                Text(
                                                  "Delete All",
                                                  style: TextStyle(
                                                    color: MyColors.mainblue,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onTap: () async {
                                              providerimages.Images.clear();
                                              providerimages.just_notify();
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                }
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20.0, top: 20),
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width - 120,
                                child: Consumer<ProviderLoading>(
                                    builder: (context, providerloading, child) {
                                  return Consumer<DropJobsProvider>(
                                      builder: (context, providerdrop, child) {
                                    return ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                        ),
                                        onPressed: () async {
                                          final LocationEntity location =
                                              await Navigator.of(context).push(
                                                  SlideRight(
                                                      Page: MapPlaceSelector(),
                                                      begin: Offset(1, 0),
                                                      end: Offset(0, 0)));

                                          if (Workers_Cat().cats.contains(
                                              providerdrop.dropdownValue)) {
                                            if (formstate_title.currentState!
                                                    .validate() &&
                                                formstate_price.currentState!
                                                    .validate()) {
                                              if (!providerloading.isLoading) {
                                                providerloading.setLoad(true);
                                                CreatePostService
                                                    create_post_ser =
                                                    CreatePostService();
                                                if (await create_post_ser
                                                    .createPost(
                                                  titleController.text,
                                                  priceController.text,
                                                  descController.text,
                                                  providerdrop.dropdownValue!,
                                                  providerimages.Images,
                                                  TokenUser.token,
                                                  location.latitude,
                                                  location.longitude,
                                                  locationtitleController.text,
                                                )) {
                                                  Navigator.pop(context);
                                                  context.showSuccessMessage(
                                                      "Success",
                                                      "The post has been created successfully.");
                                                } else {
                                                  Navigator.pop(context);
                                                  context.showErrorMessage(
                                                      "Error!",
                                                      "Failed to create the post.");
                                                }
                                                providerloading.setLoad(false);
                                              }
                                            }
                                          } else {
                                            Navigator.pop(context);
                                            context.showErrorMessage("Error!",
                                                "You must select a job.");
                                          }
                                        },
                                        child: !providerloading.isLoading
                                            ? const Text("Create",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold))
                                            : const SizedBox(
                                                height: 15,
                                                width: 15,
                                                child:
                                                    CircularProgressIndicator(
                                                  strokeWidth: 2,
                                                  color: Colors.white,
                                                ),
                                              ));
                                  });
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
