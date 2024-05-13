import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/BloC/Change_Status.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Create_Deal.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Service/Apply_For_Post.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SendAppWidget extends StatelessWidget {
  GlobalKey<FormState> formstate_title = GlobalKey();
  GlobalKey<FormState> formstate_desc = GlobalKey();
  TextEditingController titleController = TextEditingController();
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
          create: (context) => bloc_five(),
        ),
        ChangeNotifierProvider(
          create: (context) => bloc_five(),
        ),
      ],
      child: Container(
        padding: EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height / 2 + 60,
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
                  height: 6,
                  width: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 15),
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
                  decoration: BoxDecoration(
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
                              child: Consumer<bloc_five>(
                                  builder: (context, bloc_5, child) {
                                return Consumer<bloc_five>(
                                    builder: (context, providerok, child) {
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                    ),
                                    onPressed: () async {
                                      if (!bloc_5.isLoading) {
                                        bloc_5.setLoad(true);
                                        ApplyForPost applyForPost =
                                            ApplyForPost();
                                        if (await applyForPost.applyforPost(
                                          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE0OTk3MTQxLCJleHAiOjE3MjI3NzMxNDF9.uCvlps3RC7k8FcGccytiPgbRmK7cejk60LujUU6znJs",
                                          postId!,
                                          descController.text,
                                        )) {
                                          onAppCreated(true);
                                        }

                                        bloc_5.setLoad(false);
                                      }
                                      Navigator.pop(context);
                                    },
                                    child: !bloc_5.isLoading
                                        ? Text("Apply",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))
                                        : SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                  );
                                });
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
