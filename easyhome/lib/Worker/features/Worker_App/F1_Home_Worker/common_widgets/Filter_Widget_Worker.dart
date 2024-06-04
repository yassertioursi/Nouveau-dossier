// ignore_for_file: prefer_const_constructors

import 'package:easyhome/SnackBars/FlashMessage.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Provider/Select_job.dart';

import 'package:easyhome/utils/constants/Categorys.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class FilterWidgetWorker extends StatelessWidget {
  GlobalKey<FormState> formstate_min = GlobalKey();
  GlobalKey<FormState> formstate_max = GlobalKey();
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();
  String minPrice;
  String maxPrice;
  var Image_Controller = PageController();
  List<String> jobs;
  final Function(String min, String max, List<String> jobs) onFilter;
  FilterWidgetWorker({
    required this.jobs,
    required this.minPrice,
    required this.maxPrice,
    required this.onFilter,
  });

  @override
  Widget build(BuildContext context) {
    minController.text = minPrice;
    maxController.text = maxPrice;
    bool yesorno = true;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => Select_Job()),
      ],
      child: AlertDialog(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Price :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 90,
                        child: Form(
                          key: formstate_min,
                          child: TextFormField(
                            //  initialValue: "$minPrice",
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            maxLength: 10,
                            maxLines: 1,
                            validator: (value) {
                              if (!RegExp(r'^[0-9]+$').hasMatch(value!) &&
                                  !value.isEmpty) {
                                return "";
                              }
                              if (value.isNotEmpty &&
                                  maxController.text.isNotEmpty) {
                                int minValue = int.parse(value);
                                int maxValue = int.parse(maxController.text);
                                if (minValue > maxValue) {
                                  return "Min must be\nless than max";
                                }
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                            textAlign: TextAlign.start,
                            onChanged: (value) {
                              formstate_min.currentState!.validate();
                            },
                            controller: minController,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              errorMaxLines: 3,
                              errorStyle: TextStyle(fontSize: 8),
                              counterText: "",
                              suffixStyle: TextStyle(
                                  color: MyColors.mainblue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              suffixText: " DA",
                              hintText: "Min",
                              focusColor: Colors.white,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.red,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                        width: 90,
                        child: Form(
                          key: formstate_max,
                          child: TextFormField(
                            //     initialValue: "$maxPrice",
                            maxLength: 10,
                            maxLengthEnforcement: MaxLengthEnforcement.enforced,
                            validator: (value) {
                              if (!RegExp(r'^[0-9]+$').hasMatch(value!) &&
                                  !value.isEmpty) {
                                return "";
                              }
                              if (value.isNotEmpty &&
                                  maxController.text.isNotEmpty) {
                                int maxValue = int.parse(value);
                                int minValue = int.parse(minController.text);
                                if (minValue > maxValue) {
                                  return "Max must be \ngreater than Min";
                                }
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black),
                            onChanged: (value) {
                              formstate_max.currentState!.validate();
                            },
                            controller: maxController,
                            cursorColor: Colors.black,
                            decoration: const InputDecoration(
                              errorMaxLines: 3,
                              errorStyle: TextStyle(fontSize: 8),
                              counterText: "",
                              suffixStyle: TextStyle(
                                  color: MyColors.mainblue,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              suffixText: " DA",
                              hintText: "Max",
                              focusColor: Colors.white,
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Colors.black,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide:
                                    BorderSide(width: 2, color: Colors.black),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.red,
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 0.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5.0),
                      child: Text(
                        "Jobs:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Consumer<Select_Job>(
                    builder: (context, bloc_select, child) {
                      if (yesorno && !jobs.isEmpty) {
                        bloc_select.selectedItems = jobs;
                        yesorno = false;
                      }
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                for (int index = 0; index < 3; index++)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: InkWell(
                                      onTap: () {
                                        bloc_select.set_Selected(
                                            Workers_Cat().cats[index]);
                                      },
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: MyColors.mainblue),
                                          color: bloc_select.selectedItems
                                                  .contains(
                                                      Workers_Cat().cats[index])
                                              ? MyColors.mainblue
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 0, bottom: 0.0),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0, left: 8.0),
                                              child: Text(
                                                  "${Workers_Cat().cats[index]}",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: bloc_select
                                                              .selectedItems
                                                              .contains(
                                                                  Workers_Cat()
                                                                          .cats[
                                                                      index])
                                                          ? Colors.white
                                                          : MyColors.mainblue,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                for (int index = 3; index < 6; index++)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: MyColors.mainblue),
                                        color: bloc_select.selectedItems
                                                .contains(
                                                    Workers_Cat().cats[index])
                                            ? MyColors.mainblue
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0, bottom: 0.0),
                                        child: Center(
                                          child: InkWell(
                                            onTap: () {
                                              bloc_select.set_Selected(
                                                  Workers_Cat().cats[index]);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0, left: 8.0),
                                              child: Text(
                                                  "${Workers_Cat().cats[index]}",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: bloc_select
                                                              .selectedItems
                                                              .contains(
                                                                  Workers_Cat()
                                                                          .cats[
                                                                      index])
                                                          ? Colors.white
                                                          : MyColors.mainblue,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Row(
                              children: [
                                for (int index = 6; index < 8; index++)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: MyColors.mainblue),
                                        color: bloc_select.selectedItems
                                                .contains(
                                                    Workers_Cat().cats[index])
                                            ? MyColors.mainblue
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0, bottom: 0.0),
                                        child: Center(
                                          child: InkWell(
                                            onTap: () {
                                              bloc_select.set_Selected(
                                                  Workers_Cat().cats[index]);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0, left: 8.0),
                                              child: Text(
                                                  "${Workers_Cat().cats[index]}",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: bloc_select
                                                              .selectedItems
                                                              .contains(
                                                                  Workers_Cat()
                                                                          .cats[
                                                                      index])
                                                          ? Colors.white
                                                          : MyColors.mainblue,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                for (int index = 8;
                                    index < Workers_Cat().cats.length;
                                    index++)
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Container(
                                      height: 35,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: MyColors.mainblue),
                                        color: bloc_select.selectedItems
                                                .contains(
                                                    Workers_Cat().cats[index])
                                            ? MyColors.mainblue
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 0, bottom: 0.0),
                                        child: Center(
                                          child: InkWell(
                                            onTap: () {
                                              bloc_select.set_Selected(
                                                  Workers_Cat().cats[index]);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0, left: 8.0),
                                              child: Text(
                                                  "${Workers_Cat().cats[index]}",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: bloc_select
                                                              .selectedItems
                                                              .contains(
                                                                  Workers_Cat()
                                                                          .cats[
                                                                      index])
                                                          ? Colors.white
                                                          : MyColors.mainblue,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Consumer<Select_Job>(
                          builder: (context, bloc_select, child) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            if (formstate_min.currentState!.validate()) {
                              String minp = minController.text.isNotEmpty
                                  ? minController.text
                                  : '';
                              String maxp = maxController.text.isNotEmpty
                                  ? maxController.text
                                  : '';

                              int minValue = int.tryParse(minp) ?? 0;
                              int? maxValue;
                              if (maxp.isNotEmpty) {
                                maxValue = int.tryParse(maxp);
                              }

                              if (maxValue == null || minValue <= maxValue) {
                                onFilter(minp, maxp, bloc_select.selectedItems);

                                Navigator.pop(context);
                              } else {
                                context.showErrorMessage("Error!",
                                    "Min must be less than or equal to Max");
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              "Apply",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
