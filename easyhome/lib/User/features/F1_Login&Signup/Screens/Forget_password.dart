import 'package:easyhome/User/features/F1_Login&Signup/Animation/animation.dart';
import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Email_verification.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Login.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/dialogs.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/text_log_sign_field.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/text_verify_field.dart';
import 'package:easyhome/User/features/F1_Login&Signup/services/Forget_password.dart';
import 'package:easyhome/User/features/F1_Login&Signup/services/Reset_password.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../common_widgets/confirm_field.dart';
import '../common_widgets/text_log_sign_field.dart';

class Forget_Pass extends StatelessWidget {
  Forget_Pass({Key? key, required this.email}) : super(key: key);

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirm_password_Controller = TextEditingController();
  TextEditingController codeController = TextEditingController();

  GlobalKey<FormState> formstate_password = new GlobalKey();
  GlobalKey<FormState> formstate_confirm_password = new GlobalKey();
  String email;

  @override
  Widget build(context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => bloc_three()),
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
                Container(
                  height: 150,
                  width: 300,
                  child: Image.asset(
                    "lib/utils/images/Authentication-rafiki.png",
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Text(
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
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Verify_Field(
                      id: "forget-password",
                      email: email,
                      codeController: codeController,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 20),
                  child: Consumer<bloc_five>(builder: (context, bloc_5, child) {
                    return bloc_5.isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: MyColors.mainblue,
                            ),
                          )
                        : TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  MyColors.mainblue),
                            ),
                            child: Text(
                              "Resend!",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            onPressed: () async {
                              if (!bloc_5.isLoading) {
                                bloc_5.setLoad(true);
                                Forgot_pass_ser forgot_pass_ser =
                                    new Forgot_pass_ser();
                                if (await forgot_pass_ser
                                    .forgot_password_post(email)) {
                                } else {
                                  Dialogs dialogs = new Dialogs();
                                  dialogs.showErrorDialog_login(
                                      context, forgot_pass_ser.result);
                                }
                                bloc_5.setLoad(false);
                              } else {}
                            });
                  }),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 12),
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
                Consumer<bloc_five>(builder: (context, bloc_5, child) {
                  return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: MyColors.mainblue,
                        fixedSize: Size(330, 50),
                      ),
                      onPressed: () async {
                        bool v1 = formstate_password.currentState!.validate();
                        bool v2 =
                            formstate_confirm_password.currentState!.validate();

                        if (v1 && v2) {
                          bool key;
                          if (!bloc_5.isLoading) {
                            bloc_5.setLoad(true);
                            Reset_pass_ser reset_pass_ser =
                                new Reset_pass_ser();
                            if (await reset_pass_ser.reset_password_post(
                                email,
                                codeController.text,
                                passwordController.text,
                                confirm_password_Controller.text)) {
                              key = true;

                              Navigator.of(context).pushReplacement(SlideRight(
                                  Page: Login(),
                                  begin: Offset(-1, 0),
                                  end: Offset(0, 0)));
                            } else {
                              Dialogs dialogs = new Dialogs();
                              dialogs.showErrorDialog_login(
                                  context, reset_pass_ser.result);
                              key = false;
                            }
                            bloc_5.setLoad(false);
                            if (key) {
                              Dialogs dialogs = new Dialogs();
                              dialogs.showSuccessDialog(context,
                                  "Your password was successfully changed.");
                            }
                          } else {}
                        }
                      },
                      child: Text(
                        "CONFIRM",
                      ));
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
