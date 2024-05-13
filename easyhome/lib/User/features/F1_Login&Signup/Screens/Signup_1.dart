import 'package:easyhome/User/features/F1_Login&Signup/Animation/animation.dart';
import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Login.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Signup_2.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/text_log_sign_field.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common_widgets/confirm_field.dart';
import '../common_widgets/text_log_sign_field.dart';

class Signup extends StatelessWidget {
  Signup({Key? key}) : super(key: key);

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
        ChangeNotifierProvider(create: (BuildContext context) => bloc_three()),
      ],
      child: Consumer<bloc_three>(builder: (context, bloc_3, child) {
        return Scaffold(
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
                  Container(
                    height: 110,
                    width: 300,
                    child: Image.asset(
                      "lib/utils/images/logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      "Create Account",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Create a new account",
                      style: TextStyle(
                          color: const Color.fromRGBO(117, 117, 117, 1),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 12),
                    child: Log_Field(
                      formstate: formstate_email,
                      hint_text: "EMAIL",
                      prefixIcon: Icon(
                        Icons.email,
                        color: MyColors.mainblue,
                      ),
                      controller: emailController,
                      field_id: "signup-email",
                      keyboardtype: TextInputType.emailAddress,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20, left: 20, right: 20, bottom: 12),
                    child: Log_Field(
                      keyboardtype: TextInputType.text,
                      formstate: formstate_password,
                      hint_text: "PASSWORD",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: MyColors.mainblue,
                      ),
                      suffixIcon: IconButton(
                          icon: Icon(
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
                  SizedBox(
                    height: 22,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: MyColors.mainblue,
                        fixedSize: Size(330, 50),
                      ),
                      onPressed: () {
                        bool v1 = formstate_email.currentState!.validate();
                        bool v2 = formstate_password.currentState!.validate();
                        bool v3 =
                            formstate_confirm_password.currentState!.validate();
                        if (v1 && v2 && v3) {
                          Navigator.of(context).push(SlideRight(
                              Page: Signup_2(
                                email: emailController.text,
                                password: passwordController.text,
                                passwordConfirm:
                                    confirm_password_Controller.text,
                              ),
                              begin: Offset(1, 0),
                              end: Offset(0, 0)));
                        } else {}
                      },
                      child: Text(
                        "CONTINUE",
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: MyColors.grey3,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(SlideRight(
                              Page: Login(),
                              begin: Offset(-1, 0),
                              end: Offset(0, 0)));
                        },
                        child: Text(
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
        );
      }),
    );
  }
}
