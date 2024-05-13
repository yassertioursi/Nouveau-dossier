import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/Dwwira.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/Ok_Provider.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/Bloc/images_bloc.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/Services/Create_post_service.dart';
import 'package:easyhome/User/features/User_App/F3_Create_Post/UploadImages.dart';
import 'package:easyhome/utils/constants/Categorys.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Drop__jobs.dart';

class Create_Post {
  GlobalKey<FormState> formstate_title = GlobalKey();
  GlobalKey<FormState> formstate_desc = GlobalKey();
  GlobalKey<FormState> formstate_price = GlobalKey();
  TextEditingController priceController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  var Image_Controller = PageController();

  void creat_post(BuildContext context) {
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
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => DropJobsProvider(),
            ),
            ChangeNotifierProvider(
              create: (BuildContext context) => Bloc_Image(),
            ),
            ChangeNotifierProvider(
              create: (BuildContext context) => bloc_five(),
            ),
          ],
          child: Consumer<Bloc_Image>(
            builder: (context, bloc_image, child) {
              return Container(
                padding: EdgeInsets.only(top: 20),
                height: MediaQuery.of(context).size.height - 50,
                decoration: BoxDecoration(
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
                          color: Color(0xFFA2A2A2),
                          height: 7,
                          width: 70,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 20),
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
                          decoration:
                              BoxDecoration(color: Colors.grey, boxShadow: [
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
                                  },
                                  maxLengthEnforcement:
                                      MaxLengthEnforcement.enforced,
                                  maxLength: 70,
                                  cursorColor: MyColors.mainblue,
                                  decoration: InputDecoration(
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
                                    decoration: InputDecoration(
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                DropJobs(),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
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
                                        },
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                        textAlign: TextAlign.start,
                                        onChanged: (value) {
                                          formstate_price.currentState!
                                              .validate();
                                        },
                                        controller: priceController,
                                        cursorColor: Colors.black,
                                        decoration: InputDecoration(
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
                                          hintStyle: TextStyle(fontSize: 18),
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
                            Consumer<Bloc_Image>(
                              builder: (context, bloc_image, child) {
                                ImagesUpload images_upload = ImagesUpload();
                                if (bloc_image.Images.isEmpty) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 30, 15, 20),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width -
                                          30,
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
                                              await images_upload.uploadImages(
                                                  context, bloc_image);

                                              bloc_image.just_notify();
                                            },
                                          ),
                                          Text(
                                            "Upload Images",
                                            style: TextStyle(
                                              color: MyColors.mainblue,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      height: 180,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFDCECFF),
                                        border: Border.all(
                                          color: MyColors.mainblue,
                                          width: 3,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
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
                                        child: Container(
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
                                            itemCount: bloc_image.Images.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return AspectRatio(
                                                aspectRatio: 1.0,
                                                child: Image.file(
                                                  bloc_image.Images[index],
                                                  fit: BoxFit.fill,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      bloc_image.Images.length > 1
                                          ? Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 25.0, bottom: 25),
                                                child: SmoothPageIndicator(
                                                  controller: Image_Controller,
                                                  count:
                                                      bloc_image.Images.length,
                                                  effect: ScrollingDotsEffect(
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
                                          : Text(""" """),
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
                                                Text(
                                                  "Add Images",
                                                  style: TextStyle(
                                                    color: MyColors.mainblue,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            onTap: () async {
                                              await images_upload
                                                  .uploadImageFromCamera(
                                                      context, bloc_image);
                                              bloc_image.just_notify();
                                            },
                                          ),
                                          InkWell(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(2),
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
                                              bloc_image.Images.clear();
                                              bloc_image.just_notify();
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
                                child: Consumer<bloc_five>(
                                    builder: (context, bloc_5, child) {
                                  return Consumer<DropJobsProvider>(
                                      builder: (context, providerdrop, child) {
                                    return ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.black,
                                        ),
                                        onPressed: () async {
                                          if (formstate_title.currentState!.validate() &&
                                              formstate_price.currentState!
                                                  .validate() &&
                                              Workers_Cat().cats.contains(
                                                  providerdrop.dropdownValue)) {
                                            if (!bloc_5.isLoading) {
                                              bloc_5.setLoad(true);
                                              CreatePostService
                                                  create_post_ser =
                                                  CreatePostService();
                                              await create_post_ser.createPost(
                                                titleController.text,
                                                priceController.text,
                                                descController.text,
                                                providerdrop.dropdownValue!,
                                                bloc_image.Images,
                                                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDQ3MTg1NSwiZXhwIjoxNzIyMjQ3ODU1fQ.qXVSs5UooaLHCjjhJzIfL5DsCVW5oxzEvBdFrPF07M4",
                                              );
                                              bloc_5.setLoad(false);
                                            }
                                          } else {
                                            print(providerdrop.dropdownValue);
                                            print("error");
                                          }
                                        },
                                        child: !bloc_5.isLoading
                                            ? Text("Create",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold))
                                            : SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(
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
