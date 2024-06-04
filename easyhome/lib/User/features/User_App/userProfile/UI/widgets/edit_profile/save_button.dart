import 'package:easyhome/User/features/User_App/userProfile/BloC/update_cubit/update_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({super.key, required this.context, required this.isUser});
  final BuildContext context;
  final bool isUser;
  @override
  State<SaveButton> createState() => _SaveButtonState();
}

Map<String, String> userMap = {};

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    return _buildButton(context, widget.isUser);
  }

  Widget _buildButton(BuildContext context, bool isUser) {
    return Padding(
      padding: EdgeInsets.fromLTRB(60.w, 20, 60.w, 20.w),
      child: GestureDetector(
        onTap: () {
          showConfirmDialog(context, isUser);
        },
        child: Container(
          height: 60,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(
            child: Text(
              'Save',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void showConfirmDialog(BuildContext pageContext, bool isUser) {
  showDialog(
    context: pageContext,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Confirm',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Text(
          'Do you want to proceed?',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              savoo(pageContext, isUser);
            },
            child: const Text(
              'Confirm',
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Handle cancel action

              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(
            color: Colors.grey,
            width: 2,
          ),
        ),
      );
    },
  );
}

// TODO fix the push replacement
void savoo(BuildContext context, bool isUser) {
  BlocProvider.of<UpdateCubit>(context)
      .emitUpdateUser('66380575b0a95c051bb5e786', userMap);

  userMap = <String, String>{};
}
