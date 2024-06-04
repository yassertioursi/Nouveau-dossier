import 'package:easyhome/User/features/F1_Login&Signup/Animation/animation.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Login.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Signup_2.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/text_log_sign_field.dart';
import 'package:easyhome/utils/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common_widgets/confirm_field.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirm_password_Controller = TextEditingController();

  GlobalKey<FormState> formstate_email = GlobalKey();

  GlobalKey<FormState> formstate_password = GlobalKey();
  GlobalKey<FormState> formstate_confirm_password = GlobalKey();

  @override
  Widget build(context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderEqual()),
      ],
      child: Consumer<ProviderEqual>(builder: (context, providerequal, child) {
        return SafeArea(
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
                            /*Navigator.of(context).push(SlideRight(
                                Page: Login(),
                                begin: Offset(-1, 0),
                                end: Offset(0, 0)));*/
                          },*/
                          color: MyColors.mainblue,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 110,
                      width: 300,
                      child: Image.asset(
                        "lib/utils/images/logo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Create a new account",
                        style: TextStyle(
                            color: Color.fromRGBO(117, 117, 117, 1),
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 12),
                      child: Log_Field(
                        formstate: formstate_email,
                        hint_text: "EMAIL",
                        prefixIcon: const Icon(
                          Icons.email,
                          color: MyColors.mainblue,
                        ),
                        controller: emailController,
                        field_id: "signup-email",
                        keyboardtype: TextInputType.emailAddress,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20, left: 20, right: 20, bottom: 12),
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
                        confirm_password_Controller:
                            confirm_password_Controller,
                        passwordController: passwordController),
                    const SizedBox(
                      height: 22,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColors.mainblue,
                          fixedSize: const Size(330, 50),
                        ),
                        onPressed: () {
                          bool v1 = formstate_email.currentState!.validate();
                          bool v2 = formstate_password.currentState!.validate();
                          bool v3 = formstate_confirm_password.currentState!
                              .validate();
                          if (v1 && v2 && v3) {
                            Navigator.of(context).push(SlideRight(
                                Page: Signup_2(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  passwordConfirm:
                                      confirm_password_Controller.text,
                                ),
                                begin: const Offset(1, 0),
                                end: const Offset(0, 0)));
                          } else {}
                        },
                        child: const Text(
                          "CONTINUE",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                              color: MyColors.grey3,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        TextButton(
                          onPressed: () {
                            // Navigator.of(context).pushReplacement(SlideRight(
                            //     Page: Login(),
                            //     begin: const Offset(-1, 0),
                            //     end: const Offset(0, 0)));
                            Navigator.of(context).pop();
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                color: MyColors.mainorange,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
