import 'package:easyhome/User/features/F1_Login&Signup/Animation/animation.dart';
import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Email_verification.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Forget_password.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Login.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/Dwwira.dart';
import 'package:easyhome/User/features/F1_Login&Signup/services/Forget_password.dart';
import 'package:easyhome/User/features/F1_Login&Signup/services/SendV_email.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dialogs {
  void showErrorDialog_login(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Error:",
            style: TextStyle(
                color: MyColors.mainorange, fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(MyColors.mainblue),
              ),
              child: Text(
                "OK",
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showSuccessDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Success",
            style: TextStyle(
                color: const Color.fromARGB(255, 7, 129, 11),
                fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(MyColors.mainblue),
              ),
              child: Text(
                "OK",
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showErrorDialog_login2(
      BuildContext context, String title, String message, String email) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (BuildContext context) => bloc_five()),
          ],
          child: AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                  color: MyColors.mainorange, fontWeight: FontWeight.bold),
            ),
            content: Text(
              message,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer<bloc_five>(builder: (context, bloc_5, child) {
                    return TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              MyColors.mainblue),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: bloc_5.isLoading
                            ? Dwwira(
                                color: MyColors.mainblue,
                                height: 20,
                                width: 20,
                              )
                            : Text(
                                "Verify",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                        onPressed: () async {
                          if (!bloc_5.isLoading) {
                            bloc_5.setLoad(true);
                            Send_ser verify_ser = new Send_ser();
                            if (await verify_ser.send_email_post(email)) {
                              Navigator.of(context).push(SlideRight(
                                  Page: Email_verifcation(
                                    email: email,
                                  ),
                                  begin: Offset(1, 0),
                                  end: Offset(0, 0)));
                            } else {
                              showErrorDialog_login(context, verify_ser.result);
                            }
                            bloc_5.setLoad(false);
                          } else {}
                        });
                  }),
                  SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(MyColors.mainblue),
                    ),
                    child: Text(
                      "OK",
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void showErrorDialog_forget_password(
      BuildContext context, String title, String message, String email) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (BuildContext context) => bloc_five()),
          ],
          child: AlertDialog(
            title: Text(
              title,
              style: TextStyle(
                  color: MyColors.mainorange, fontWeight: FontWeight.bold),
            ),
            content: Text(
              message,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(MyColors.mainblue),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    child: Text(
                      "Discard",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Consumer<bloc_five>(builder: (context, bloc_5, child) {
                    return bloc_5.isLoading
                        ? Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Dwwira(
                              color: MyColors.mainblue,
                              height: 20,
                              width: 20,
                            ),
                          )
                        : TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  MyColors.mainblue),
                            ),
                            child: Text(
                              "Confirm",
                            ),
                            onPressed: () async {
                              if (!bloc_5.isLoading) {
                                bloc_5.setLoad(true);
                                Forgot_pass_ser forgot_pass_ser =
                                    new Forgot_pass_ser();
                                if (await forgot_pass_ser
                                    .forgot_password_post(email)) {
                                  Navigator.of(context).push(SlideRight(
                                      Page: Forget_Pass(
                                        email: email,
                                      ),
                                      begin: Offset(1, 0),
                                      end: Offset(0, 0)));
                                } else {
                                  showErrorDialog_login(
                                      context, forgot_pass_ser.result);
                                }
                                bloc_5.setLoad(false);
                              } else {}
                            });
                  }),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void showErrorDialog_signup(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Error:",
            style: TextStyle(
                color: MyColors.mainorange, fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(MyColors.mainblue),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: Text(
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(SlideRight(
                        Page: Login(),
                        begin: Offset(-1, 0),
                        end: Offset(0, 0)));
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(MyColors.mainblue),
                  ),
                  child: Text(
                    "OK",
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
