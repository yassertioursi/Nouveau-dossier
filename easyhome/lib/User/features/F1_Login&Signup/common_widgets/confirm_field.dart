import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';
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
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderValidate()),
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderObscure()),
      ],
      child: Consumer<ProviderValidate>(
          builder: (context, providervalidate, child) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0.2),
                  blurRadius: providervalidate.validated ? 4 : 2,
                  color: providervalidate.validated
                      ? Colors.black.withOpacity(0.25)
                      : Colors.black.withOpacity(0.0),
                ),
              ],
            ),
            child: Consumer<ProviderObscure>(
              builder: (context, providerobscure, child) => Form(
                key: formstate_confirm_password,
                child: TextFormField(
                  cursorWidth: 3,
                  cursorColor: MyColors.mainblue,
                  style: const TextStyle(
                    color: MyColors.mainblue,
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  ),
                  controller: confirm_password_Controller,
                  validator: (value) {
                    if (value != passwordController.text) {
                      providervalidate.setValidated(false);
                      return "Password not confitmed";
                    } else {
                      providervalidate.setValidated(true);
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: providerobscure.isObscured,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
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
                      suffixIcon: IconButton(
                          icon: Icon(
                            providerobscure.isObscured
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: MyColors.mainblue,
                          ),
                          onPressed: () {
                            providerobscure
                                .setObscure(!providerobscure.isObscured);
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
