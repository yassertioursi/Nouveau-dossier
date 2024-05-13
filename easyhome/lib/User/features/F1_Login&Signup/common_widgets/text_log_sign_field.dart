import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/Validators.dart';
import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';

Validators validators = new Validators();

class Log_Field extends StatelessWidget {
  final GlobalKey<FormState> formstate;
  final String hint_text;
  final TextEditingController? controller;
  final Icon prefixIcon;
  final IconButton? suffixIcon;
  bool isObscure = true;
  String field_id;
  TextInputType keyboardtype;

  Log_Field({
    required this.formstate,
    required this.hint_text,
    required this.prefixIcon,
    required this.field_id,
    this.suffixIcon = null,
    this.controller,
    required this.keyboardtype,
  });
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => bloc_one()),
        ChangeNotifierProvider(create: (BuildContext context) => bloc_two()),
      ],
      child: Consumer<bloc_one>(builder: (context, bloc_1, child) {
        return Container(
          decoration: BoxDecoration(
            color: MyColors.loggrey1,
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
          child: Form(
              key: formstate,
              child: Consumer<bloc_two>(
                builder: (context, bloc_2, child) => TextFormField(
                  maxLines: 1,
                  keyboardType: keyboardtype,
                  cursorWidth: 3,
                  cursorColor: MyColors.mainblue,
                  style: TextStyle(
                    color: MyColors.mainblue,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                  onChanged: (value) {
                    switch (field_id) {
                      case "signup-password":
                        this.formstate.currentState!.validate();
                        break;
                    }
                  },
                  onEditingComplete: () {
                    switch (field_id) {
                      case "phone-nbr":
                        this.formstate.currentState!.validate();
                        break;
                    }
                  },
                  controller: controller,
                  validator: (value) {
                    switch (this.field_id) {
                      case "login-email":
                        //
                        break;
                      case "login-password":
                        //
                        break;

                      case "signup-email":
                        if (validators.Validate_email_signup(value!) ==
                            "Email not valid") {
                          bloc_1.setValidated(false);
                          return "Email not valid";
                        } else {
                          bloc_1.setValidated(true);
                        }

                        break;
                      case "signup-password":
                        if (validators.Validate_password_signup(value!) ==
                            "At least 6 characters") {
                          bloc_1.setValidated(false);
                          return "At least 6 characters";
                        } else
                          bloc_1.setValidated(true);
                        ;
                        break;
                      case "signup-fname" || "signup-lname":
                        if (validators.Validate_name(value!) ==
                            "Enter a valid name") {
                          bloc_1.setValidated(false);
                          return "Enter a valid name";
                        } else {
                          bloc_1.setValidated(true);
                        }

                        break;

                      case "phone-nbr":
                        if (validators.Validate_phone_number(value!) ==
                            "Enter a Valid number") {
                          bloc_1.setValidated(false);
                          return "Enter a Valid number:(exp: 0793818443)";
                        } else {
                          bloc_1.setValidated(true);
                        }
                        break;
                    }
                  },
                  obscureText: this.field_id == "signup-password" ||
                          this.field_id == "login-password"
                      ? bloc_2.isObscured
                      : false,
                  decoration: InputDecoration(
                    suffixIcon: this.field_id == "signup-password" ||
                            this.field_id == "login-password"
                        ? IconButton(
                            icon: Icon(
                              bloc_2.isObscured
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: MyColors.mainblue,
                            ),
                            onPressed: () {
                              bloc_2.setObscure(!bloc_2.isObscured);
                            })
                        : suffixIcon,
                    prefixIcon: prefixIcon,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: hint_text,
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
                  ),
                ),
              )),
        );
      }),
    );
  }
}
