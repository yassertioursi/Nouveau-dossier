// ignore_for_file: unused_import, prefer_const_constructors

import 'package:easyhome/User/features/F1_Login&Signup/Screens/End.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/dialogs.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Animation/animation.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Login.dart';

import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/text_verify_field.dart';
import 'package:easyhome/User/features/F1_Login&Signup/services/SendV_email.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Email_verifcation extends StatelessWidget {
  Email_verifcation({super.key, required this.email});

  GlobalKey<FormState> formstate_code = GlobalKey();
  String email;
  TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderLoading())
      ],
      child: SafeArea(
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
                              begin: const Offset(-1, 0),
                              end: const Offset(0, 0)));
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
                  const Padding(
                    padding: EdgeInsets.only(top: 30.0),
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
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
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
                  Consumer<ProviderLoading>(
                      builder: (context, providerloading, child) {
                    return TextButton(
                      onPressed: () async {
                        if (!providerloading.isLoading) {
                          providerloading.setLoad(true);
                          Send_ser verify_ser = Send_ser();
                          if (await verify_ser.send_email_post(email)) {
                            Navigator.of(context).pushReplacement(SlideRight(
                                Page: const End(),
                                begin: const Offset(1, 0),
                                end: const Offset(0, 0)));
                          } else {
                            Dialogs dialogs = Dialogs();
                            dialogs.showErrorDialog_login(
                                context, verify_ser.result);
                          }
                          providerloading.setLoad(false);
                        } else {}
                      },
                      child: providerloading.isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: MyColors.mainblue,
                              ),
                            )
                          : const Text(
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
      ),
    );
  }
}
