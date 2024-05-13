import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/Dwwira.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/dialogs.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Animation/animation.dart';
import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Email_verification.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/dropdownwilayas.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/text_log_sign_field.dart';
import 'package:easyhome/User/features/F1_Login&Signup/services/Signup_ser.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Signup_2 extends StatelessWidget {
  final String email;
  final String password;
  final String passwordConfirm;

  Signup_2(
      {Key? key,
      required this.email,
      required this.password,
      required this.passwordConfirm})
      : super(key: key);

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController phonenbrController = TextEditingController();
  GlobalKey<FormState> formstate_fname = GlobalKey<FormState>();
  GlobalKey<FormState> formstate_lname = GlobalKey<FormState>();
  GlobalKey<FormState> formstate_pnonenbr = GlobalKey<FormState>();
  final GlobalKey<FormState> formstate_wilaya = GlobalKey<FormState>();
  String selectedWilaya = '';

  @override
  Widget build(BuildContext context) {
    Signup_ser signup_ser = new Signup_ser();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => bloc_five()),
      ],
      child: Scaffold(
        backgroundColor: MyColors.loggrey1,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(
                      color: MyColors.mainblue,
                    ),
                  ],
                ),
                Container(
                  child: Image.asset(
                    "lib/utils/images/Mobile login-bro.png",
                    width: 100,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Enter your information",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 180,
                        child: Log_Field(
                          formstate: formstate_fname,
                          hint_text: "FIRST NAME",
                          prefixIcon: Icon(
                            Icons.person,
                            color: MyColors.mainblue,
                          ),
                          field_id: "signup-fname",
                          controller: fnameController,
                          keyboardtype: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        width: 180,
                        child: Log_Field(
                          keyboardtype: TextInputType.name,
                          formstate: formstate_lname,
                          hint_text: "LAST NAME",
                          prefixIcon: Icon(
                            Icons.person,
                            color: MyColors.mainblue,
                          ),
                          field_id: "signup-lname",
                          controller: lnameController,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30),
                  child: Log_Field(
                    keyboardtype: TextInputType.phone,
                    formstate: formstate_pnonenbr,
                    hint_text: "PHONE NUMBER(0XXXXXXXXX)",
                    prefixIcon: Icon(
                      Icons.phone,
                      color: MyColors.mainblue,
                    ),
                    controller: phonenbrController,
                    field_id: "phone-nbr",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 40, 20),
                  child: DropDown(
                    formstate_wilaya: formstate_wilaya,
                    onWilayaChanged: (wilya) {
                      selectedWilaya = wilya;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Consumer<bloc_five>(builder: (context, bloc_5, child) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: MyColors.mainblue,
                        fixedSize: Size(330, 50),
                      ),
                      onPressed: () async {
                        bool v1 = formstate_fname.currentState!.validate();
                        bool v2 = formstate_lname.currentState!.validate();
                        bool v3 = formstate_pnonenbr.currentState!.validate();

                        bool v4 = formstate_wilaya.currentState!.validate();

                        if (v1 && v2 && v3 && v4) {
                          if (!bloc_5.isLoading) {
                            bloc_5.setLoad(true);
                            if (await signup_ser.sign_up_post(
                                fnameController.text,
                                lnameController.text,
                                selectedWilaya,
                                phonenbrController.text,
                                this.email,
                                this.password,
                                this.passwordConfirm)) {
                              Navigator.of(context).push(SlideRight(
                                  Page: Email_verifcation(
                                    email: email,
                                  ),
                                  begin: Offset(1, 0),
                                  end: Offset(0, 0)));
                            } else {
                              Dialogs dialogs = new Dialogs();
                              signup_ser.result.contains(
                                      "E11000 duplicate key error collection")
                                  ? dialogs.showErrorDialog_signup(context,
                                      "User for email already exists , Try to login ")
                                  : dialogs.showErrorDialog_signup(
                                      context, signup_ser.result);
                            }
                            bloc_5.setLoad(false);
                          } else {}
                        }
                      },
                      child: bloc_5.isLoading
                          ? SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(
                                color: MyColors.mainblue,
                              ),
                            )
                          : Text(
                              "CREATE ACCOUNT",
                            ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
