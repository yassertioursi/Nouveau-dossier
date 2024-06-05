import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/dialogs.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Animation/animation.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Email_verification.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/dropdownwilayas.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/text_log_sign_field.dart';
import 'package:easyhome/User/features/F1_Login&Signup/services/Signup_ser.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
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

  TextEditingController nameController = TextEditingController();
  // TextEditingController lnameController = TextEditingController();
  TextEditingController phonenbrController = TextEditingController();
  GlobalKey<FormState> formstate_name = GlobalKey<FormState>();

  GlobalKey<FormState> formstate_pnonenbr = GlobalKey<FormState>();
  final GlobalKey<FormState> formstate_wilaya = GlobalKey<FormState>();
  String selectedWilaya = "16 Alger";

  @override
  Widget build(BuildContext context) {
    Signup_ser signup_ser = Signup_ser();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderLoading()),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.loggrey1,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
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
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
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
                            formstate: formstate_name,
                            hint_text: "FULL NAME",
                            prefixIcon: const Icon(
                              Icons.person,
                              color: MyColors.mainblue,
                            ),
                            field_id: "signup-name",
                            controller: nameController,
                            keyboardtype: TextInputType.name,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Log_Field(
                      keyboardtype: TextInputType.phone,
                      formstate: formstate_pnonenbr,
                      hint_text: "PHONE NUMBER",
                      prefixIcon: const Icon(
                        Icons.phone,
                        color: MyColors.mainblue,
                      ),
                      controller: phonenbrController,
                      field_id: "phone-nbr",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 40, 20),
                    child: DropDownWilaya(
                      onWilayaChanged: (wilya) {
                        selectedWilaya = wilya;
                      },
                      formstateWilaya: formstate_wilaya,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Consumer<ProviderLoading>(
                        builder: (context, providerloading, child) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.mainblue,
                          fixedSize: const Size(330, 50),
                        ),
                        onPressed: () async {
                          bool v1 = formstate_name.currentState!.validate();

                          bool v3 = formstate_pnonenbr.currentState!.validate();

                          bool v4 = formstate_wilaya.currentState!.validate();

                          if (v1 && v3 && v4) {
                            if (!providerloading.isLoading) {
                              providerloading.setLoad(true);
                              if (await signup_ser.sign_up_post(
                                  nameController.text,
                                  selectedWilaya,
                                  phonenbrController.text,
                                  this.email,
                                  this.password,
                                  this.passwordConfirm)) {
                                Navigator.of(context)
                                    .pushReplacement(SlideRight(
                                        Page: Email_verifcation(
                                          email: email,
                                        ),
                                        begin: const Offset(1, 0),
                                        end: const Offset(0, 0)));
                              } else {
                                Dialogs dialogs = Dialogs();
                                signup_ser.result.contains(
                                        "E11000 duplicate key error collection")
                                    ? dialogs.showErrorDialog_signup(context,
                                        "User for email already exists , Try to login ")
                                    : dialogs.showErrorDialog_signup(
                                        context, signup_ser.result);
                              }
                              providerloading.setLoad(false);
                            } else {}
                          }
                        },
                        child: providerloading.isLoading
                            ? const SizedBox(
                                height: 18,
                                width: 18,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                "CREATE ACCOUNT",
                                style: TextStyle(color: Colors.white),
                              ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
