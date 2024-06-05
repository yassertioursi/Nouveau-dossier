// ignore_for_file: unnecessary_new

import 'package:easyhome/User/features/F1_Login&Signup/Animation/animation.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';

import 'package:easyhome/User/features/F1_Login&Signup/Screens/Login.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/dialogs.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/text_log_sign_field.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/text_verify_field.dart';
import 'package:easyhome/User/features/F1_Login&Signup/services/Forget_password.dart';
import 'package:easyhome/User/features/F1_Login&Signup/services/Reset_password.dart';
import 'package:easyhome/utils/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common_widgets/confirm_field.dart';

// ignore: must_be_immutable
class Forget_Pass extends StatelessWidget {
  Forget_Pass({Key? key, required this.email}) : super(key: key);

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirm_password_Controller = TextEditingController();
  TextEditingController codeController = TextEditingController();

  GlobalKey<FormState> formstate_password = GlobalKey();
  GlobalKey<FormState> formstate_confirm_password = GlobalKey();
  String email;

  @override
  Widget build(context) {
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
                        /*onPressed: () {
                          Navigator.of(context).push(SlideRight(
                              Page: Login(),
                              begin: Offset(1, 0),
                              end: Offset(0, 0)));
                        },*/
                        color: MyColors.mainblue,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 150,
                    width: 300,
                    child: Image.asset(
                      "lib/utils/images/Authentication-rafiki.png",
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  const Text(
                    "New Password",
                    style: TextStyle(
                      color: MyColors.mainorange,
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20.0, 20, 0),
                      child: Text(
                        """We have sent you a code.Enter it before 10 minutes to verify your email : $email and reset your password.""",
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Verify_Field(
                        id: "forget-password",
                        email: email,
                        codeController: codeController,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                    child: Consumer<ProviderLoading>(
                        builder: (context, bloc_5, child) {
                      return bloc_5.isLoading
                          ? const SizedBox(
                              height: 15,
                              width: 15,
                              child: CircularProgressIndicator(
                                color: MyColors.mainblue,
                                strokeWidth: 2,
                              ),
                            )
                          : TextButton(
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        MyColors.mainblue),
                              ),
                              child: const Text(
                                "Resend!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              onPressed: () async {
                                if (!bloc_5.isLoading) {
                                  bloc_5.setLoad(true);
                                  Forgot_pass_ser forgot_pass_ser =
                                      Forgot_pass_ser();
                                  if (await forgot_pass_ser
                                      .forgot_password_post(email)) {
                                  } else {
                                    Dialogs dialogs = Dialogs();
                                    dialogs.showErrorDialog_login(
                                        context, forgot_pass_ser.result);
                                  }
                                  bloc_5.setLoad(false);
                                } else {}
                              });
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 0, left: 20, right: 20, bottom: 12),
                    child: Log_Field(
                      keyboardtype: TextInputType.text,
                      formstate: formstate_password,
                      hint_text: "PASSWORD",
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: MyColors.mainblue,
                      ),
                      suffixIcon: IconButton(
                          icon: const Icon(
                            Icons.visibility,
                            color: MyColors.mainblue,
                          ),
                          onPressed: () {}),
                      controller: passwordController,
                      field_id: "signup-password",
                    ),
                  ),
                  Confirm_field(
                      formstate_confirm_password: formstate_confirm_password,
                      confirm_password_Controller: confirm_password_Controller,
                      passwordController: passwordController),
                  const SizedBox(
                    height: 22,
                  ),
                  Consumer<ProviderLoading>(
                      builder: (context, providerloading, child) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.mainblue,
                          fixedSize: const Size(330, 50),
                        ),
                        onPressed: () async {
                          bool v1 = formstate_password.currentState!.validate();
                          bool v2 = formstate_confirm_password.currentState!
                              .validate();

                          if (v1 && v2) {
                            bool key;
                            if (!providerloading.isLoading) {
                              providerloading.setLoad(true);
                              Reset_pass_ser reset_pass_ser = Reset_pass_ser();
                              if (await reset_pass_ser.reset_password_post(
                                  email,
                                  codeController.text,
                                  passwordController.text,
                                  confirm_password_Controller.text)) {
                                key = true;

                                Navigator.of(context).pushReplacement(
                                    SlideRight(
                                        Page: Login(),
                                        begin: const Offset(-1, 0),
                                        end: const Offset(0, 0)));
                              } else {
                                Dialogs dialogs = Dialogs();
                                // ignore: use_build_context_synchronously
                                dialogs.showErrorDialog_login(
                                    context, reset_pass_ser.result);
                                key = false;
                              }
                              providerloading.setLoad(false);
                              if (key) {
                                Dialogs dialogs = new Dialogs();
                                dialogs.showSuccessDialog(context,
                                    "Your password has successfully changed.");
                              }
                            } else {}
                          }
                        },
                        child: const Text(
                          "CONFIRM",
                          style: TextStyle(color: Colors.white),
                        ));
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
