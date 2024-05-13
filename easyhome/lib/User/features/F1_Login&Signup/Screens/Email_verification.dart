import 'package:easyhome/User/features/F1_Login&Signup/Screens/End.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/dialogs.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Animation/animation.dart';
import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Login.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Signup_1.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/text_verify_field.dart';
import 'package:easyhome/User/features/F1_Login&Signup/services/SendV_email.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../common_widgets/Dwwira.dart';

class Email_verifcation extends StatelessWidget {
  Email_verifcation({super.key, required this.email});

  GlobalKey<FormState> formstate_code = GlobalKey();
  String email;
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => bloc_five())
      ],
      child: Scaffold(
        backgroundColor: MyColors.loggrey1,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(
                      color: MyColors.mainblue,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(SlideRight(
                            Page: Login(),
                            begin: Offset(-1, 0),
                            end: Offset(0, 0)));
                      },
                    ),
                  ],
                ),
                Container(
                  child: Image.asset(
                    width: 100,
                    height: 150,
                    "lib/utils/images/Confirmed-bro.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Text(
                    "Enter your code :",
                    style: TextStyle(
                      color: MyColors.mainorange,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 30.0, 20, 20),
                    child: Text(
                      """We have sent you a code.Enter it before 10 minutes to verify your email : $email""",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Verify_Field(
                      email: email,
                      id: "verify-email",
                      codeController: codeController,
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Consumer<bloc_five>(builder: (context, bloc_5, child) {
                  return TextButton(
                    onPressed: () async {
                      if (!bloc_5.isLoading) {
                        bloc_5.setLoad(true);
                        Send_ser verify_ser = new Send_ser();
                        if (await verify_ser.send_email_post(email)) {
                          Navigator.of(context).pushReplacement(SlideRight(
                              Page: End(),
                              begin: Offset(1, 0),
                              end: Offset(0, 0)));
                        } else {
                          Dialogs dialogs = new Dialogs();
                          dialogs.showErrorDialog_login(
                              context, verify_ser.result);
                        }
                        bloc_5.setLoad(false);
                      } else {}
                    },
                    child: bloc_5.isLoading
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: MyColors.mainblue,
                            ),
                          )
                        : Text(
                            "Resend !",
                            style: TextStyle(
                                color: MyColors.mainblue,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
