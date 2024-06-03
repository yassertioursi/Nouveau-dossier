import 'package:easyhome/User/features/F1_Login&Signup/Screens/End.dart';

import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/dialogs.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Animation/animation.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';

import 'package:easyhome/User/features/F1_Login&Signup/Screens/Signup_1.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/text_log_sign_field.dart';
import 'package:easyhome/User/features/F1_Login&Signup/services/Login_ser.dart';

import 'package:easyhome/utils/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formstate_email = GlobalKey();

  GlobalKey<FormState> formstate_password = GlobalKey();

  @override
  Widget build(context) {
    Login_ser login_ser = Login_ser();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderLoading()),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: MyColors.loggrey1,
          body: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 160,
                      width: 300,
                      child: Image.asset(
                        "lib/utils/images/logo.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 27,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "Sign in to continue",
                        style: TextStyle(
                            color: MyColors.grey3,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Log_Field(
                        formstate: formstate_email,
                        hint_text: "EMAIL",
                        prefixIcon: const Icon(
                          Icons.email,
                          color: MyColors.mainblue,
                        ),
                        controller: emailController,
                        field_id: "login-email",
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
                        field_id: "login-password",
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 22.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              Dialogs dialogs = Dialogs();
                              dialogs.showErrorDialog_forget_password(
                                  context,
                                  "Don't remember your password",
                                  "If you forget your password for this email :${emailController.text} , press confirm to reset your password ",
                                  emailController.text);
                              /* Navigator.of(context).push(SlideRight(
                                  Page: Email_verifcation(
                                    email: emailController.text,
                                  ),
                                  begin: Offset(1, 0),
                                  end: Offset(0, 0)));*/
                            },
                            child: const Text(
                              "Forget Password?",
                              style: TextStyle(
                                  color: MyColors.mainorange,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                          if (!providerloading.isLoading) {
                            providerloading.setLoad(true);
                            if (await login_ser.login_post(emailController.text,
                                    passwordController.text) ==
                                true) {
                              Navigator.of(context).pushReplacement(SlideRight(
                                  Page: const End(),
                                  begin: const Offset(1, 0),
                                  end: const Offset(0, 0)));
                            } else {
                              Dialogs dialogs = Dialogs();
                              login_ser.result ==
                                      "You are not verified! Please verify your email account and login"
                                  ? dialogs.showErrorDialog_login2(
                                      context,
                                      "Error :",
                                      login_ser.result,
                                      emailController.text)
                                  : dialogs.showErrorDialog_login(
                                      context, login_ser.result);

                              print("false");
                            }
                            providerloading.setLoad(false);
                          } else {}
                        },
                        child: providerloading.isLoading
                            ? const SizedBox(
                                height: 25,
                                width: 25,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text(
                                "LOGIN",
                              ),
                      );
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have account?",
                          style: TextStyle(
                              color: MyColors.grey3,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(SlideRight(
                                Page: Signup(),
                                begin: const Offset(1, 0),
                                end: const Offset(0, 0)));
                          },
                          child: const Text(
                            "create a new account",
                            style: TextStyle(
                                color: MyColors.mainorange,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
