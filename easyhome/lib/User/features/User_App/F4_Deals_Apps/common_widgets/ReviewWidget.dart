import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/filter__widget.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Accept_Finish.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Create_Review.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

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
            create: (BuildContext context) => bloc_five_One()),
        ChangeNotifierProvider(create: (BuildContext context) => bloc_five()),
      ],
      child: Center(
        child: AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
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
                child: Icon(
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
                      itemPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      itemBuilder: (context, _) => Icon(
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
                        decoration: InputDecoration(
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
                          Consumer<bloc_five_One>(
                              builder: (context, bloc_5_1, child) {
                            return Consumer<RatingProvider>(
                                builder: (context, provider_rating, child) {
                              return InkWell(
                                onTap: () async {
                                  if (!bloc_5_1.isLoading) {
                                    bloc_5_1.setLoad(true);
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
                                          provider_rating.rating,
                                          reviewController.text)) {
                                        onReviewCreated(true);
                                      }
                                    }
                                    ;
                                    Navigator.pop(context);
                                    // providerstatus.setStatus(acceptfinishDeal.status!);
                                    bloc_5_1.setLoad(false);
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
                                    child: !bloc_5_1.isLoading
                                        ? Text(
                                            "Save Review and Finish",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          )
                                        : SizedBox(
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
                          SizedBox(
                            height: 20,
                          ),
                          Consumer<bloc_five>(
                              builder: (context, bloc_5_2, child) {
                            return InkWell(
                              onTap: () async {
                                if (!bloc_5_2.isLoading) {
                                  bloc_5_2.setLoad(true);
                                  AcceptFinishDeal acceptfinishDeal =
                                      AcceptFinishDeal();
                                  if (await acceptfinishDeal.acceptfinishDeal(
                                      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA",
                                      dealId)) {
                                    onDealFinished(acceptfinishDeal.status!);
                                  }
                                  Navigator.pop(context);
                                  // providerstatus.setStatus(acceptfinishDeal.status!);
                                  bloc_5_2.setLoad(false);
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
                                  child: !bloc_5_2.isLoading
                                      ? Text(
                                          "Skip Reviw and Finish",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : SizedBox(
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
                    : Consumer<bloc_five_One>(
                        builder: (context, bloc_5_1, child) {
                        return Consumer<RatingProvider>(
                            builder: (context, provider_rating, child) {
                          return InkWell(
                            onTap: () async {
                              if (!bloc_5_1.isLoading) {
                                bloc_5_1.setLoad(true);

                                CreateReview createReview = CreateReview();
                                if (await createReview.createReview(
                                    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA",
                                    dealId,
                                    provider_rating.rating,
                                    reviewController.text)) {
                                  onReviewCreated(true);
                                }

                                ;
                                Navigator.pop(context);
                                // providerstatus.setStatus(acceptfinishDeal.status!);
                                bloc_5_1.setLoad(false);
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
                                child: !bloc_5_1.isLoading
                                    ? Text(
                                        "Save Review",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      )
                                    : SizedBox(
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
