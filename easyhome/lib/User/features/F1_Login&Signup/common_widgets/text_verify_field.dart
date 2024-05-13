import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/dialogs.dart';
import 'package:easyhome/User/features/F1_Login&Signup/services/Verify_email.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Verify_Field extends StatelessWidget {
  Verify_Field(
      {Key? key,
      required this.email,
      required this.id,
      required this.codeController});
  String email;
  String id;
  TextEditingController codeController;
  GlobalKey<FormState> formstate_code = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<bloc_five>(builder: (context, bloc_5, child) {
      return Form(
        key: formstate_code,
        child: SizedBox(
          width: 150,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            maxLength: 4,
            keyboardType: TextInputType.number,
            cursorWidth: 3,
            textAlign: TextAlign.center,
            cursorColor: MyColors.mainblue,
            style: TextStyle(
                color: MyColors.mainblue,
                fontWeight: FontWeight.w800,
                fontSize: 24,
                letterSpacing: 7),
            decoration: InputDecoration(
              counterText: '',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: MyColors.mainblue,
                  width: 0.8,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: MyColors.mainblue,
                  width: 2,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(
                  color: Colors.red,
                  width: 2,
                ),
              ),
            ),
            controller: codeController,
            validator: (value) {
              if (value!.length < 4) {
                return "Enter a valid code";
              }
            },
            onChanged: (value) async {
              if (value.length == 4) {
                SystemChannels.textInput.invokeMethod('TextInput.hide');
                if (id == "verify-email") {
                  Verify_ser verify_ser = new Verify_ser();
                  bloc_5.setLoad(true);
                  if (await verify_ser.verify_email_post(email, value)) {
                    print("true");
                  } else {
                    Dialogs dialogs = new Dialogs();
                    dialogs.showErrorDialog_login(context, verify_ser.result);
                  }
                  bloc_5.setLoad(false);
                } else {}
              }
            },
            onEditingComplete: () {
              formstate_code.currentState!.validate();
            },
          ),
        ),
      );
    });
  }
}
