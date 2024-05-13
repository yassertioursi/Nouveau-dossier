import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/Dwwira.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/Ok_Provider.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Services/Get_Worker_ById.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/filter__widget.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/BloC/Change_Status.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/BloC/Save_Text.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Accept_Finish.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Decline_Deal.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Delete_Deal.dart';
import 'package:easyhome/Worker/features/Worker_App/F3_Deals_Requests/Service/Finish_Deal.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Get_My_Deals.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Update_Deal.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'common_widgets/ReviewWidget.dart';

class Deal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetDeals getdeals = GetDeals();

    return FutureBuilder<String>(
      future: getdeals.getDeals(
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child:
                  Dwwira(color: MyColors.mainblue, height: 60.0, width: 60.0));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<bool> rvs = List.filled(getdeals.deals.length, false);
          return ListView.builder(
            itemCount: getdeals.deals.length,
            itemBuilder: (BuildContext context, int index) {
              return DealItem(
                dealId: getdeals.deals[index]["_id"],
                name: getdeals.deals[index]["worker"]["name"],
                job: getdeals.deals[index]["worker"]["job"],
                isCertified: getdeals.deals[index]["worker"]["isCertified"],
                profilePicture: getdeals.deals[index]["worker"]
                    ["profilePicture"],
                title: getdeals.deals[index]["userTitle"] ?? "",
                description: getdeals.deals[index]["userDescription"] ?? "",
                status: getdeals.deals[index]["status"],
                workerId: getdeals.deals[index]["worker"]["_id"],
                deal: getdeals.deals[index],
                reviews: rvs,
                index: index,
              );
            },
          );
        }
      },
    );
  }
}

class DealItem extends StatelessWidget {
  GlobalKey<FormState> formstate_title = GlobalKey();
  GlobalKey<FormState> formstate_desc = GlobalKey();

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool yesorno = true;
  String dealId;
  String workerId;
  String name;
  String job;
  bool isCertified;
  String profilePicture;
  String title;
  String description;
  String status;
  Map deal;
  List<bool> reviews;
  int index;

  DealItem({
    required this.dealId,
    required this.workerId,
    required this.name,
    required this.job,
    required this.isCertified,
    required this.profilePicture,
    required this.title,
    required this.description,
    required this.status,
    required this.deal,
    required this.index,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    titleController.text = title;
    descriptionController.text = description;

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) => Save_Text()),
          ChangeNotifierProvider(
              create: (BuildContext context) => Save_Text_One()),
          ChangeNotifierProvider(
              create: (BuildContext context) => ChangeStatus()),
          ChangeNotifierProvider(create: (BuildContext context) => bloc_five()),
          ChangeNotifierProvider(
              create: (BuildContext context) => bloc_five_One()),
          ChangeNotifierProvider(
              create: (BuildContext context) => ProviderOk()),
        ],
        child: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 400,
          width: MediaQuery.of(context).size.width - 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Container(
                          height: 60,
                          width: 60,
                          child: profilePicture != "default.jpg"
                              ? Image.network(
                                  profilePicture,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  "lib/utils/images/default.jpg",
                                  fit: BoxFit.cover,
                                )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            isCertified
                                ? Icon(
                                    Icons.verified_user_rounded,
                                    color: Color(0xFF137A23),
                                  )
                                : Text(''),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 0),
                          child: Text(
                            job,
                            style: TextStyle(
                                color: MyColors.mainorange,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Consumer<ChangeStatus>(builder: (context, providerstatus, child) {
                if (yesorno) {
                  providerstatus.setStatus(status);
                }
                return Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                  child: Consumer<Save_Text>(
                      builder: (context, bloc_save_text, child) {
                    return Form(
                      key: formstate_title,
                      child: TextFormField(
                        readOnly: providerstatus.status == "Finished" ||
                            providerstatus.status == "Deleted",
                        controller: titleController,
                        onChanged: (value) {
                          bloc_save_text.setChanged(true);
                        },
                        maxLength: 100,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        cursorColor: MyColors.mainblue,
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon: bloc_save_text.changed
                              ? IconButton(
                                  icon: Icon(
                                    Icons.playlist_add_check_circle_sharp,
                                    color: MyColors.mainorange,
                                  ),
                                  onPressed: () async {
                                    bloc_save_text.setChanged(false);
                                    UpdateDeal updateDeal = UpdateDeal();
                                    await updateDeal.updateDealtitle(
                                        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA",
                                        dealId,
                                        titleController.text);
                                    deal["userTitle"] = titleController.text;

                                    SystemChannels.textInput
                                        .invokeMethod('TextInput.hide');
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                  },
                                )
                              : null,
                          label: Text(
                            "Title",
                            style: TextStyle(
                              color: MyColors.mainblue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                    );
                  }),
                );
              }),
              Consumer<ChangeStatus>(builder: (context, providerstatus, child) {
                if (yesorno) {
                  providerstatus.setStatus(status);
                }
                return Consumer<Save_Text_One>(
                    builder: (context, bloc_save_text1, child) {
                  return Form(
                    key: formstate_desc,
                    child: SizedBox(
                      height: 140,
                      child: TextFormField(
                        readOnly: providerstatus.status == "Finished" ||
                            providerstatus.status == "Deleted",
                        onChanged: (value) {
                          bloc_save_text1.setChanged(true);
                        },
                        controller: descriptionController,
                        maxLength: 100,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        maxLines: 7,
                        cursorColor: MyColors.mainblue,
                        decoration: InputDecoration(
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon: bloc_save_text1.changed
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13.0, right: 7),
                                      child: IconButton(
                                        icon: Icon(
                                          size: 30,
                                          Icons.playlist_add_check_circle_sharp,
                                          color: MyColors.mainorange,
                                        ),
                                        onPressed: () async {
                                          bloc_save_text1.setChanged(false);
                                          UpdateDeal updateDeal = UpdateDeal();
                                          await updateDeal.updateDealdesc(
                                              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA",
                                              dealId,
                                              descriptionController.text);
                                          deal["userDescription"] =
                                              descriptionController.text;

                                          SystemChannels.textInput
                                              .invokeMethod('TextInput.hide');
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : null,
                          label: Text(
                            "Description",
                            style: TextStyle(
                              color: MyColors.mainblue,
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
                  );
                });
              }),

              ////
              ///

              Consumer<ChangeStatus>(builder: (context, providerstatus, child) {
                if (yesorno) {
                  providerstatus.setStatus(status);
                  yesorno = false;
                }
                return Consumer<ProviderOk>(
                    builder: (context, providerok, child) {
                  providerok.setOk(reviews[index]);

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            providerstatus.status,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: providerstatus.status == "Deleted"
                                  ? Colors.red[800]
                                  : MyColors.green,
                            ),
                          ),
                        ),
                      ),
                      providerstatus.status == "FinishRequestSent"
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Consumer<bloc_five>(
                                    builder: (context, bloc_5_1, child) {
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red[800],
                                    ),
                                    onPressed: () async {
                                      if (!bloc_5_1.isLoading) {
                                        bloc_5_1.setLoad(true);
                                        DeclineDeal declinedeal = DeclineDeal();
                                        await declinedeal.declineDeal(
                                            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNTQzMjAwMywiZXhwIjoxNzIzMjA4MDAzfQ.jC-aZ2mvvmFXtm-QaIbRVHi-TuEejefkb8OQ9JiBrfc",
                                            dealId);

                                        deal["status"] = declinedeal.status!;
                                        providerstatus
                                            .setStatus(declinedeal.status!);
                                        bloc_5_1.setLoad(false);
                                      }
                                    },
                                    child: !bloc_5_1.isLoading
                                        ? Text(
                                            "Decline",
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
                                  );
                                }),
                                SizedBox(
                                  width: 20,
                                ),
                                Consumer<bloc_five_One>(
                                    builder: (context, bloc_5_2, child) {
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: MyColors.green,
                                    ),
                                    onPressed: () async {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Review(
                                            dealId: dealId,
                                            id: "1",
                                            workerId: workerId,
                                            onReviewCreated: (bool status) {
                                              providerok.setOk(status);
                                              reviews[index] = status;
                                            },
                                            onDealFinished: (String status) {
                                              deal["status"] = status;
                                              providerstatus.setStatus(status);
                                            },
                                          );
                                        },
                                      );

                                      /*  if (!bloc_5_2.isLoading) {
                                      bloc_5_2.setLoad(true);
                                      AcceptFinishDeal acceptfinishDeal =
                                          AcceptFinishDeal();
                                      await acceptfinishDeal.acceptfinishDeal(
                                          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA",
                                          dealId);
                                      providerstatus
                                          .setStatus(acceptfinishDeal.status!);
                                      bloc_5_2.setLoad(false);
                                    }*/
                                    },
                                    child: !bloc_5_2.isLoading
                                        ? Text(
                                            "Finish",
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
                                  );
                                }),
                              ],
                            )
                          : providerstatus.status == "Finished"
                              ? InkWell(
                                  onTap: () {
                                    if (!providerok.isOk) {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return Review(
                                            dealId: dealId,
                                            id: "2",
                                            workerId: workerId,
                                            onReviewCreated: (bool status) {
                                              providerok.setOk(status);
                                              reviews[index] = status;
                                            },
                                            onDealFinished: (String status) {
                                              deal["status"] = status;
                                              providerstatus.setStatus(status);
                                            },
                                          );
                                        },
                                      );
                                    } else {}
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Review",
                                          style: TextStyle(
                                              color: MyColors.mainorange,
                                              fontWeight: FontWeight.bold)),
                                      !providerok.isOk
                                          ? Icon(
                                              FontAwesomeIcons.star,
                                              // color: MyColors.stars,
                                              size: 17,
                                            )
                                          : Icon(
                                              FontAwesomeIcons.solidStar,
                                              color: MyColors.stars,
                                              size: 17,
                                            ),
                                    ],
                                  ),
                                )
                              : providerstatus.status == "OnGoing"
                                  ? Consumer<bloc_five>(
                                      builder: (context, bloc_5_1, child) {
                                      return ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.red[800],
                                        ),
                                        onPressed: () async {
                                          if (!bloc_5_1.isLoading) {
                                            bloc_5_1.setLoad(true);
                                            DeleteDeal deleteDeal =
                                                DeleteDeal();
                                            await deleteDeal.deleteDeal(
                                                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNTQzMjAwMywiZXhwIjoxNzIzMjA4MDAzfQ.jC-aZ2mvvmFXtm-QaIbRVHi-TuEejefkb8OQ9JiBrfc",
                                                dealId);

                                            deal["status"] = deleteDeal.status!;
                                            providerstatus
                                                .setStatus(deleteDeal.status!);
                                            bloc_5_1.setLoad(false);
                                          }
                                        },
                                        child: !bloc_5_1.isLoading
                                            ? Text(
                                                "Discard",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            : SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                      );
                                    })
                                  : Text(""),
                    ],
                  );
                });
              }),
            ],
          ),
        ));
  }
}
