import 'package:easyhome/Rechidi/core/constants/statics.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DropDownWilaya extends StatefulWidget {
  final GlobalKey<FormState> formstateWilaya;
  final void Function(String) onWilayaChanged;

  DropDownWilaya({
    Key? key,
    required this.formstateWilaya,
    required this.onWilayaChanged,
  }) : super(key: key);

  @override
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDownWilaya> {
  String? valueChoose;

  @override
  Widget build(BuildContext context) {
    setState(() {
      valueChoose = StaticStuf.wilayas[15];
    });
    return ChangeNotifierProvider(
      create: (context) => ProviderValidate(),
      child: Consumer<ProviderValidate>(
        builder: (context, providerValidate, child) {
          return Container(
            decoration: BoxDecoration(
              color: MyColors.loggrey1,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 0.5),
                  blurRadius: providerValidate.validated ? 18 : 2,
                  color: providerValidate.validated
                      ? Colors.black.withOpacity(0.25)
                      : Colors.black.withOpacity(0.0),
                ),
              ],
            ),
            child: Form(
              key: widget.formstateWilaya,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.place,
                    color: MyColors.mainblue,
                  ),
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
                ),
                borderRadius: BorderRadius.circular(10),
                iconEnabledColor: MyColors.mainblue,
                iconDisabledColor: Colors.red,
                dropdownColor: Colors.white,
                icon: const Icon(Icons.keyboard_arrow_down_rounded),
                iconSize: 36,
                isDense: true,
                isExpanded: false,
                value: valueChoose,
                onChanged: (String? newValue) {
                  setState(() {
                    valueChoose = newValue;
                    widget.formstateWilaya.currentState!.validate();
                    widget.onWilayaChanged(valueChoose!);
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    providerValidate.setValidated(false);
                    return 'Please select a wilaya';
                  } else {
                    providerValidate.setValidated(true);
                  }
                  return null;
                },
                items: StaticStuf.wilayas.map((valueItem) {
                  return DropdownMenuItem(
                    value: valueItem,
                    child: Text(
                      valueItem,
                      style: const TextStyle(
                        color: MyColors.mainblue,
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
