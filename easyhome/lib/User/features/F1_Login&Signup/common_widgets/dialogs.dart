// ignore_for_file: sort_child_properties_last

import 'package:easyhome/User/features/F1_Login&Signup/Animation/animation.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Email_verification.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Forget_password.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Login.dart';

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
          title: const Text(
            "Error:",
            style: TextStyle(
                color: MyColors.mainorange, fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(MyColors.mainblue),
              ),
              child: const Text(
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
          title: const Text(
            "Success",
            style: TextStyle(
                color: Color.fromARGB(255, 7, 129, 11),
                fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          actions: <Widget>[
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                backgroundColor:
                    MaterialStateProperty.all<Color>(MyColors.mainblue),
              ),
              child: const Text(
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
                create: (BuildContext context) => ProviderLoading()),
          ],
          child: AlertDialog(
            title: Text(
              title,
              style: const TextStyle(
                  color: MyColors.mainorange, fontWeight: FontWeight.bold),
            ),
            content: Text(
              message,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer<ProviderLoading>(
                      builder: (context, providerloading, child) {
                    return TextButton(
                        style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(
                              MyColors.mainblue),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                        ),
                        child: providerloading.isLoading
                            ? const SizedBox(
                                child: CircularProgressIndicator(
                                  color: MyColors.mainblue,
                                ),
                                height: 20,
                                width: 20,
                              )
                            : const Text(
                                "Verify",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                        onPressed: () async {
                          if (!providerloading.isLoading) {
                            providerloading.setLoad(true);
                            Send_ser verify_ser = Send_ser();
                            if (await verify_ser.send_email_post(email)) {
                              Navigator.of(context).push(SlideRight(
                                  Page: Email_verifcation(
                                    email: email,
                                  ),
                                  begin: const Offset(1, 0),
                                  end: const Offset(0, 0)));
                            } else {
                              showErrorDialog_login(context, verify_ser.result);
                            }
                            providerloading.setLoad(false);
                          } else {}
                        });
                  }),
                  const SizedBox(
                    width: 10,
                  ),
                  TextButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(MyColors.mainblue),
                    ),
                    child: const Text(
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
                create: (BuildContext context) => ProviderLoading()),
          ],
          child: AlertDialog(
            title: Text(
              title,
              style: const TextStyle(
                  color: MyColors.mainorange, fontWeight: FontWeight.bold),
            ),
            content: Text(
              message,
              style: const TextStyle(fontWeight: FontWeight.w600),
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
                    child: const Text(
                      "Discard",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Consumer<ProviderLoading>(
                      builder: (context, providerloading, child) {
                    return providerloading.isLoading
                        ? const Padding(
                            padding: EdgeInsets.only(right: 12.0),
                            child: SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: MyColors.mainblue,
                              ),
                            ))
                        : TextButton(
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  MyColors.mainblue),
                            ),
                            child: const Text(
                              "Confirm",
                            ),
                            onPressed: () async {
                              if (!providerloading.isLoading) {
                                providerloading.setLoad(true);
                                Forgot_pass_ser forgot_pass_ser =
                                    Forgot_pass_ser();
                                if (await forgot_pass_ser
                                    .forgot_password_post(email)) {
                                  Navigator.of(context).push(SlideRight(
                                      Page: Forget_Pass(
                                        email: email,
                                      ),
                                      begin: const Offset(1, 0),
                                      end: const Offset(0, 0)));
                                } else {
                                  showErrorDialog_login(
                                      context, forgot_pass_ser.result);
                                }
                                providerloading.setLoad(false);
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
          title: const Text(
            "Error:",
            style: TextStyle(
                color: MyColors.mainorange, fontWeight: FontWeight.bold),
          ),
          content: Text(
            message,
            style: const TextStyle(fontWeight: FontWeight.w600),
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
                  child: const Text(
                    "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(SlideRight(
                        Page: Login(),
                        begin: const Offset(-1, 0),
                        end: const Offset(0, 0)));
                  },
                ),
                const SizedBox(
                  width: 10,
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(MyColors.mainblue),
                  ),
                  child: const Text(
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
