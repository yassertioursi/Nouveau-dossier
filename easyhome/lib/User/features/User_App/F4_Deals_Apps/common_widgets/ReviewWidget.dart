// ignore_for_file: file_names, use_build_context_synchronously

import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';

import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Accept_Finish.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Create_Review.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../F2_Home_User/Provider/rating_provider.dart';

// ignore: must_be_immutable
class Review extends StatelessWidget {
  GlobalKey<FormState> formstate_review = GlobalKey();
  TextEditingController reviewController = TextEditingController();
  String dealId;
  String id;
  String workerId;
  final Function(String status) onDealFinished;
  final Function(bool status) onReviewCreated;
  Review({
    super.key,
    required this.dealId,
    required this.id,
    required this.workerId,
    required this.onReviewCreated,
    required this.onDealFinished,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => RatingProvider()),
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderLoading()),
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderLoading1()),
      ],
      child: Center(
        child: AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Rating and Review",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF3E3E3E),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ],
          ),
          content: SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            width: MediaQuery.of(context).size.width - 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Consumer<RatingProvider>(
                    builder: (context, providerrating, child) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: RatingBar.builder(
                      itemSize: 30,
                      initialRating: 0,
                      minRating: 0.0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                      itemBuilder: (context, _) => const Icon(
                        color: MyColors.stars,
                        FontAwesomeIcons.solidStar,
                      ),
                      onRatingUpdate: (rating) {
                        providerrating.setrating(rating.toInt());
                      },
                    ),
                  );
                }),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                  child: Form(
                    key: formstate_review,
                    child: SizedBox(
                      height: 140,
                      child: TextFormField(
                        controller: reviewController,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        maxLength: 70,
                        maxLines: 7,
                        cursorColor: MyColors.mainblue,
                        decoration: const InputDecoration(
                          label: Text(
                            "Review :",
                            style: TextStyle(
                              color: MyColors.mainorange,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          alignLabelWithHint: true,
                          focusColor: Colors.white,
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide:
                                BorderSide(width: 2, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                id == "1"
                    ? Column(
                        children: [
                          Consumer<ProviderLoading1>(
                              builder: (context, providerloading1, child) {
                            return Consumer<RatingProvider>(
                                builder: (context, providerRating, child) {
                              return InkWell(
                                onTap: () async {
                                  if (!providerloading1.isLoading) {
                                    providerloading1.setLoad(true);
                                    AcceptFinishDeal acceptfinishDeal =
                                        AcceptFinishDeal();
                                    if (await acceptfinishDeal.acceptfinishDeal(
                                        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA",
                                        dealId)) {
                                      onDealFinished(acceptfinishDeal.status!);
                                      CreateReview createReview =
                                          CreateReview();
                                      if (await createReview.createReview(
                                          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA",
                                          dealId,
                                          providerRating.rating,
                                          reviewController.text)) {
                                        onReviewCreated(true);
                                      }
                                    }
                                    Navigator.pop(context);
                                    // providerstatus.setStatus(acceptfinishDeal.status!);
                                    providerloading1.setLoad(false);
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width / 2,
                                  decoration: BoxDecoration(
                                    color: MyColors.mainblue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: !providerloading1.isLoading
                                        ? const Text(
                                            "Save Review and Finish",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                            ),
                                          ),
                                  ),
                                ),
                              );
                            });
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          Consumer<ProviderLoading>(
                              builder: (context, providerloading, child) {
                            return InkWell(
                              onTap: () async {
                                if (!providerloading.isLoading) {
                                  providerloading.setLoad(true);
                                  AcceptFinishDeal acceptfinishDeal =
                                      AcceptFinishDeal();
                                  if (await acceptfinishDeal.acceptfinishDeal(
                                      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA",
                                      dealId)) {
                                    onDealFinished(acceptfinishDeal.status!);
                                  }
                                  Navigator.pop(context);
                                  // providerstatus.setStatus(acceptfinishDeal.status!);
                                  providerloading.setLoad(false);
                                }
                              },
                              child: Container(
                                height: 40,
                                width: MediaQuery.of(context).size.width / 2,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: !providerloading.isLoading
                                      ? const Text(
                                          "Skip Reviw and Finish",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : const SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                          ),
                                        ),
                                ),
                              ),
                            );
                          }),
                        ],
                      )
                    : Consumer<ProviderLoading1>(
                        builder: (context, providerloaing1, child) {
                        return Consumer<RatingProvider>(
                            builder: (context, providerRating, child) {
                          return InkWell(
                            onTap: () async {
                              if (!providerloaing1.isLoading) {
                                providerloaing1.setLoad(true);

                                CreateReview createReview = CreateReview();
                                if (await createReview.createReview(
                                    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA",
                                    dealId,
                                    providerRating.rating,
                                    reviewController.text)) {
                                  onReviewCreated(true);
                                }

                                ;
                                Navigator.pop(context);
                                // providerstatus.setStatus(acceptfinishDeal.status!);
                                providerloaing1.setLoad(false);
                              }
                            },
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 2,
                              decoration: BoxDecoration(
                                color: MyColors.mainblue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: !providerloaing1.isLoading
                                    ? const Text(
                                        "Save Review",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          );
                        });
                      }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
