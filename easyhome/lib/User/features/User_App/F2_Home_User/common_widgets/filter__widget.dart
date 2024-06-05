// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:easyhome/User/features/User_App/F2_Home_User/Provider/Select_job.dart';

import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/SearchWorkers.dart';
import 'package:easyhome/utils/constants/Categorys.dart';
import 'package:easyhome/utils/constants/Wilayas.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../Provider/rating_provider.dart';
import '../Provider/sort_by_provider.dart';
import '../Provider/wilaya_provider.dart';

class FilterWidget extends StatelessWidget {
  List<String> jobs;
  String wilaya;
  double rating;
  String sortby;
  String postID;

  FilterWidget({
    required this.jobs,
    required this.wilaya,
    required this.rating,
    required this.sortby,
    required this.postID,
  });

  @override
  Widget build(BuildContext context) {
    bool yesorno = true;
    bool yesorno1 = true;
    bool yesorno2 = true;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => Select_Job()),
        ChangeNotifierProvider(
            create: (BuildContext context) => SortByProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => WilayaProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => RatingProvider()),
      ],
      child: AlertDialog(
        content: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Consumer<SortByProvider>(
              builder: (context, sortByProvider, child) {
                if (yesorno1) {
                  sortByProvider.setSelectedSort(sortby);
                  yesorno1 = false;
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Sort by :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Container(
                        height: 40,
                        margin: const EdgeInsets.only(left: 20),
                        child: DropdownButton<String>(
                          itemHeight: kMinInteractiveDimension,
                          alignment: Alignment.center,
                          borderRadius: BorderRadius.circular(10),
                          underline: Container(),
                          focusColor: Colors.white,
                          value: sortByProvider.selectedSort,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: MyColors.mainblue,
                            size: 30,
                          ),
                          onChanged: (newValue) {
                            sortByProvider.setSelectedSort(newValue!);
                          },
                          items: ["Default", "Rating"]
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  color: MyColors.mainblue,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Consumer<WilayaProvider>(
              builder: (context, wilayaProvider, child) {
                if (yesorno2) {
                  wilayaProvider.setSelectedWilaya(wilaya);
                  yesorno2 = false;
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Wilaya :",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        child: DropdownButton<String>(
                          alignment: Alignment.center,
                          borderRadius: BorderRadius.circular(10),
                          underline: Container(),
                          focusColor: Colors.white,
                          value: wilayaProvider.selectedWilaya,
                          icon: const Icon(
                            Icons.keyboard_arrow_down,
                            color: MyColors.mainblue,
                            size: 30,
                          ),
                          onChanged: (newValue) {
                            wilayaProvider.setSelectedWilaya(newValue!);
                          },
                          items: Wilayas()
                              .wilayasList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                value,
                                textAlign: TextAlign.left,
                                selectionColor: MyColors.mainblue,
                                style: const TextStyle(
                                    color: MyColors.mainblue, fontSize: 14),
                              ),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Rating :",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Consumer<RatingProvider>(
                      builder: (context, providerrating, child) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 5, left: 7),
                      child: RatingBar.builder(
                          itemSize: 20,
                          initialRating: 0,
                          minRating: 0.0,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => const Icon(
                                color: MyColors.stars,
                                FontAwesomeIcons.solidStar,
                              ),
                          onRatingUpdate: (rating) {
                            providerrating.setrating(rating);
                          }),
                    );
                  }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
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
                    builder: (context, provider_select, child) {
                      if (yesorno && !jobs.isEmpty) {
                        provider_select.selectedItems = jobs;
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
                                        provider_select.set_Selected(
                                            Workers_Cat().cats[index]);
                                      },
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: MyColors.mainblue),
                                          color: provider_select.selectedItems
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
                                                  left: 8.0, right: 8.0),
                                              child: Text(
                                                  "${Workers_Cat().cats[index]}",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: provider_select
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
                                    child: InkWell(
                                      onTap: () {
                                        provider_select.set_Selected(
                                            Workers_Cat().cats[index]);
                                      },
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: MyColors.mainblue),
                                          color: provider_select.selectedItems
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
                                                      color: provider_select
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
                                    child: InkWell(
                                      onTap: () {
                                        provider_select.set_Selected(
                                            Workers_Cat().cats[index]);
                                      },
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: MyColors.mainblue),
                                          color: provider_select.selectedItems
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
                                                  right: 8.0, left: 8),
                                              child: Text(
                                                  "${Workers_Cat().cats[index]}",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: provider_select
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
                                    child: InkWell(
                                      onTap: () {
                                        provider_select.set_Selected(
                                            Workers_Cat().cats[index]);
                                      },
                                      child: Container(
                                        height: 35,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: MyColors.mainblue),
                                          color: provider_select.selectedItems
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
                                                      color: provider_select
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Consumer<Select_Job>(
                      builder: (context, provider_select, child) {
                    return Consumer<WilayaProvider>(
                        builder: (context, provider_wilaya, child) {
                      return Consumer<SortByProvider>(
                          builder: (context, provider_sort, child) {
                        return Consumer<RatingProvider>(
                            builder: (context, provider_rating, child) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                              Navigator.pop(context);
                              showSearch(
                                  context: context,
                                  delegate: SearchWorkers(
                                    Id_Search: 3,
                                    jobs: provider_select.selectedItems,
                                    rating: provider_rating.rating,
                                    wilaya: provider_wilaya.selectedWilaya,
                                    sort: provider_sort.selectedSort,
                                    postId: postID,
                                  ));
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
                        });
                      });
                    });
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
