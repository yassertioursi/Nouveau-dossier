import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/Validators.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Validators validators = Validators();

// ignore: must_be_immutable
class Log_Field extends StatelessWidget {
  final GlobalKey<FormState> formstate;
  final String hint_text;
  final TextEditingController? controller;
  final Icon prefixIcon;
  final IconButton? suffixIcon;
  bool? isObscure;
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
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderValidate()),
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderObscure()),
      ],
      child: Consumer<ProviderValidate>(
          builder: (context, providervalidate, child) {
        return Container(
          decoration: BoxDecoration(
            color: MyColors.loggrey1,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0.2),
                blurRadius: providervalidate.validated ? 8 : 2,
                color: providervalidate.validated
                    ? Colors.black.withOpacity(0.25)
                    : Colors.black.withOpacity(0.0),
              ),
            ],
          ),
          child: Form(
              key: formstate,
              child: Consumer<ProviderObscure>(
                builder: (context, bloc_2, child) => TextFormField(
                  maxLines: 1,
                  keyboardType: keyboardtype,
                  cursorWidth: 3,
                  cursorColor: MyColors.mainblue,
                  style: const TextStyle(
                    color: MyColors.mainblue,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                  onChanged: (value) {
                    switch (field_id) {
                      case "signup-password" || "login-email":
                        formstate.currentState!.validate();
                        break;
                    }
                  },
                  onEditingComplete: () {
                    switch (field_id) {
                      case "phone-nbr":
                        formstate.currentState!.validate();
                        break;
                    }
                  },
                  controller: controller,
                  validator: (value) {
                    switch (field_id) {
                      case "login-email":
                        if (value!.isEmpty) {
                          providervalidate.setValidated(false);
                          return "Email can't be empty";
                        } else {
                          providervalidate.setValidated(true);
                        }
                        ;
                        break;
                      case "login-password":
                        //
                        break;

                      case "signup-email":
                        if (validators.Validate_email_signup(value!) ==
                            "Email not valid") {
                          providervalidate.setValidated(false);
                          return "Email not valid";
                        } else {
                          providervalidate.setValidated(true);
                        }

                        break;
                      case "signup-password":
                        if (validators.Validate_password_signup(value!) ==
                            "At least 6 characters") {
                          providervalidate.setValidated(false);
                          return "At least 6 characters";
                        } else
                          providervalidate.setValidated(true);
                        ;
                        break;
                      case "signup-name" || "signup-lname":
                        if (validators.Validate_name(value!) ==
                            "Enter a valid name") {
                          providervalidate.setValidated(false);
                          return "Enter a valid name";
                        } else {
                          providervalidate.setValidated(true);
                        }

                        break;

                      case "phone-nbr":
                        if (validators.Validate_phone_number(value!) ==
                            "Enter a Valid number") {
                          providervalidate.setValidated(false);
                          return "Enter a Valid number:(exp: 0793818443)";
                        } else {
                          providervalidate.setValidated(true);
                        }
                        break;
                    }
                    return null;
                  },
                  obscureText: field_id == "signup-password" ||
                          field_id == "login-password"
                      ? bloc_2.isObscured
                      : false,
                  decoration: InputDecoration(
                    suffixIcon: field_id == "signup-password" ||
                            field_id == "login-password"
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
                    border: const OutlineInputBorder(),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide: BorderSide(
                        color: MyColors.loggrey1,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
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
