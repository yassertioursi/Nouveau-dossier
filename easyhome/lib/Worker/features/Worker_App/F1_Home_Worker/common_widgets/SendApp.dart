// ignore_for_file: prefer_const_constructors

import 'package:easyhome/SnackBars/FlashMessage.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';
import 'package:easyhome/User/features/User_App/GetToken.dart';

import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Service/Apply_For_Post.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SendAppWidget extends StatelessWidget {
  GlobalKey<FormState> formstate_desc = GlobalKey();

  TextEditingController descController = TextEditingController();
  final Function(bool status) onAppCreated;

  String postId;

  SendAppWidget({
    required this.postId,
    required this.onAppCreated,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderLoading(),
        ),
      ],
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height / 2 + 60,
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
                  width: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 15),
                  child: Text(
                    "Apply for post",
                    style: TextStyle(
                      color: MyColors.mainorange,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 0.05,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        offset: Offset(0, -1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                          child: Form(
                            key: formstate_desc,
                            child: SizedBox(
                              height: 140,
                              child: TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "You must send a description";
                                  }
                                  return null;
                                },
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
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 20.0, top: 20),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width - 120,
                              child: Consumer<ProviderLoading>(
                                  builder: (context, providerloading, child) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  onPressed: () async {
                                    if (formstate_desc.currentState!
                                        .validate()) {
                                      if (!providerloading.isLoading) {
                                        providerloading.setLoad(true);
                                        ApplyForPost applyForPost =
                                            ApplyForPost();
                                        if (await applyForPost.applyforPost(
                                          TokenWorker.token,
                                          postId,
                                          descController.text,
                                        )) {
                                          context.showSuccessMessage("Success",
                                              "The application has been sent successfully.");
                                          onAppCreated(true);
                                        } else {
                                          context.showErrorMessage("Error!",
                                              "Failed to send the application.");
                                          providerloading.setLoad(false);
                                        }
                                        Navigator.pop(context);
                                      }
                                    }
                                  },
                                  child: !providerloading.isLoading
                                      ? Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: const Text("Apply",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold)),
                                        )
                                      : const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            color: Colors.white,
                                          ),
                                        ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
