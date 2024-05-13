import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Confirm_field extends StatelessWidget {
  const Confirm_field({
    super.key,
    required this.formstate_confirm_password,
    required this.confirm_password_Controller,
    required this.passwordController,
  });

  final GlobalKey<FormState> formstate_confirm_password;
  final TextEditingController confirm_password_Controller;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => bloc_one()),
        ChangeNotifierProvider(create: (BuildContext context) => bloc_two()),
      ],
      child: Consumer<bloc_one>(builder: (context, bloc_1, child) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0.5),
                  blurRadius: bloc_1.validated ? 18 : 2,
                  color: bloc_1.validated
                      ? Colors.black.withOpacity(0.25)
                      : Colors.black.withOpacity(0.0),
                ),
              ],
            ),
            child: Consumer<bloc_two>(
              builder: (context, bloc_2, child) => Form(
                key: formstate_confirm_password,
                child: TextFormField(
                  cursorWidth: 3,
                  cursorColor: MyColors.mainblue,
                  style: TextStyle(
                    color: MyColors.mainblue,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                  controller: confirm_password_Controller,
                  validator: (value) {
                    if (value != passwordController.text) {
                      bloc_1.setValidated(false);
                      return "Password not confitmed";
                    } else {
                      bloc_1.setValidated(true);
                    }
                  },
                  keyboardType: TextInputType.text,
                  obscureText: bloc_2.isObscured,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.check,
                        color: MyColors.mainblue,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "CONFIRM PASSWORD",
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w600,
                        fontSize: 17,
                      ),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide(
                          color: MyColors.loggrey1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      hintMaxLines: 1,
                      suffixIcon: IconButton(
                          icon: Icon(
                            bloc_2.isObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: MyColors.mainblue,
                          ),
                          onPressed: () {
                            bloc_2.setObscure(!bloc_2.isObscured);
                          })),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
