// ignore_for_file: sort_child_properties_last

import 'package:easyhome/SnackBars/FlashMessage.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Provider/Ok_Provider.dart';

import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Provider/Change_Status.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Provider/Save_Text.dart';

import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Decline_Deal.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Delete_Deal.dart';

import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Get_My_Deals.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Update_Deal.dart';
import 'package:easyhome/User/features/User_App/GetToken.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'common_widgets/ReviewWidget.dart';

class Deal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetDeals getdeals = GetDeals();

    return FutureBuilder<String>(
      future: getdeals.getDeals(TokenUser.token),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              child: CircularProgressIndicator(
                color: MyColors.mainblue,
              ),
              height: 50.0,
              width: 50.0,
            ),
          );
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

// ignore: must_be_immutable
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
          ChangeNotifierProvider(
              create: (BuildContext context) => ProviderLoading()),
          ChangeNotifierProvider(
              create: (BuildContext context) => ProviderLoading1()),
          ChangeNotifierProvider(
              create: (BuildContext context) => ProviderOk()),
        ],
        child: Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          height: 450,
          width: MediaQuery.of(context).size.width - 40,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  print("+++");
                },
                child: Row(
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
                        child: SizedBox(
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
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              isCertified
                                  ? const Icon(
                                      Icons.verified_user_rounded,
                                      color: Color(0xFF137A23),
                                    )
                                  : const Text(''),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0, left: 0),
                            child: Text(
                              job,
                              style: const TextStyle(
                                  color: MyColors.mainorange,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
                        maxLength: 70,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        cursorColor: MyColors.mainblue,
                        decoration: InputDecoration(
                          disabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.black,
                            ),
                          ),
                          suffixIcon: bloc_save_text.changed
                              ? IconButton(
                                  icon: const Icon(
                                    Icons.playlist_add_check_circle_sharp,
                                    color: MyColors.mainorange,
                                  ),
                                  onPressed: () async {
                                    bloc_save_text.setChanged(false);
                                    UpdateDeal updateDeal = UpdateDeal();
                                    await updateDeal.updateDealtitle(
                                        TokenUser.token,
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
                          label: const Text(
                            "Title",
                            style: TextStyle(
                              color: MyColors.mainblue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          focusColor: Colors.white,
                          filled: true,
                          fillColor: Colors.white,
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
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
                        maxLength: 200,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        maxLines: 7,
                        cursorColor: MyColors.mainblue,
                        decoration: InputDecoration(
                          disabledBorder: const OutlineInputBorder(
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
                                          top: 13.0, right: 1),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.playlist_add_check_circle_sharp,
                                          color: MyColors.mainorange,
                                        ),
                                        onPressed: () async {
                                          bloc_save_text1.setChanged(false);
                                          UpdateDeal updateDeal = UpdateDeal();
                                          await updateDeal.updateDealdesc(
                                              TokenUser.token,
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
                          label: const Text(
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
                          border: const OutlineInputBorder(),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                              width: 1.5,
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
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
                            providerstatus.status == "FinishRequestSent"
                                ? "Finish\nRequest\nSent"
                                : providerstatus.status,
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
                                Consumer<ProviderLoading>(
                                    builder: (context, providerloading, child) {
                                  return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red[800],
                                      ),
                                      onPressed: () async {
                                        if (!providerloading.isLoading) {
                                          providerloading.setLoad(true);
                                          DeclineDeal declinedeal =
                                              DeclineDeal();
                                          if (await declinedeal.declineDeal(
                                              TokenUser.token, dealId)) {
                                            providerstatus
                                                .setStatus(declinedeal.status!);
                                            deal["status"] =
                                                declinedeal.status!;
                                            context.showSuccessMessage(
                                                "Success",
                                                "The deal has been declined successfully.");
                                          } else {
                                            context.showErrorMessage("Error!",
                                                "Failed to decline the deal.");
                                          }

                                          providerloading.setLoad(false);
                                        }
                                      },
                                      child: !providerloading.isLoading
                                          ? const Text(
                                              "Decline",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : const SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                color: Colors.white,
                                              ),
                                            ));
                                }),
                                const SizedBox(
                                  width: 20,
                                ),
                                Consumer<ProviderLoading1>(builder:
                                    (context, providerloading1, child) {
                                  return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: MyColors.green,
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
                                                providerstatus
                                                    .setStatus(status);
                                              },
                                            );
                                          },
                                        );
                                      },
                                      child: !providerloading1.isLoading
                                          ? const Text(
                                              "Finish",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : const SizedBox(
                                              height: 15,
                                              width: 15,
                                              child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                color: Colors.white,
                                              ),
                                            ));
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
                                      const Text("Review",
                                          style: TextStyle(
                                              color: MyColors.mainorange,
                                              fontWeight: FontWeight.bold)),
                                      !providerok.isOk
                                          ? const Icon(
                                              FontAwesomeIcons.star,
                                              // color: MyColors.stars,
                                              size: 17,
                                            )
                                          : const Icon(
                                              FontAwesomeIcons.solidStar,
                                              color: MyColors.stars,
                                              size: 17,
                                            ),
                                    ],
                                  ),
                                )
                              : providerstatus.status == "OnGoing"
                                  ? Consumer<ProviderLoading>(builder:
                                      (context, providerloading, child) {
                                      return ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.red[800],
                                          ),
                                          onPressed: () async {
                                            if (!providerloading.isLoading) {
                                              providerloading.setLoad(true);
                                              DeleteDeal deleteDeal =
                                                  DeleteDeal();
                                              if (await deleteDeal.deleteDeal(
                                                  TokenUser.token, dealId)) {
                                                deal["status"] =
                                                    deleteDeal.status!;
                                                providerstatus.setStatus(
                                                    deleteDeal.status!);
                                                context.showSuccessMessage(
                                                    "Success",
                                                    "The deal was finished successfully.");
                                              } else {
                                                context.showErrorMessage(
                                                    "Error!",
                                                    "Failed to discard the deal.");
                                              }
                                            }

                                            providerloading.setLoad(false);
                                          },
                                          child: !providerloading.isLoading
                                              ? const Text(
                                                  "Discard",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )
                                              : const SizedBox(
                                                  height: 15,
                                                  width: 15,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    color: Colors.white,
                                                  ),
                                                ));
                                    })
                                  : const Text(""),
                    ],
                  );
                });
              }),
            ],
          ),
        ));
  }
}
