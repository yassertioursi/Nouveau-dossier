import 'package:easyhome/SnackBars/FlashMessage.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';

import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Provider/Change_Status.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Provider/Save_Text.dart';

import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Decline_Deal.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Delete_Deal.dart';
import 'package:easyhome/User/features/User_App/GetToken.dart';
import 'package:easyhome/Worker/features/Worker_App/F3_Deals_Requests/Service/Finish_Deal.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Get_My_Deals.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Update_Deal.dart';

import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

class DealWorker extends StatelessWidget {
  const DealWorker({super.key});

  @override
  Widget build(BuildContext context) {
    GetDeals getdeals = GetDeals();

    return FutureBuilder<String>(
      future: getdeals.getDeals(TokenWorker.token),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: SizedBox(
            height: 60.0,
            width: 60.0,
            child: CircularProgressIndicator(
              color: MyColors.mainblue,
            ),
          ));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return ListView.builder(
            itemCount: getdeals.deals.length,
            itemBuilder: (BuildContext context, int index) {
              return DealItem(
                dealId: getdeals.deals[index]["_id"],
                name: getdeals.deals[index]["user"]["name"],
                profilePicture: getdeals.deals[index]["user"]["profilePicture"],
                title: getdeals.deals[index]["workerTitle"] ?? "",
                description: getdeals.deals[index]["workerDescription"] ?? "",
                status: getdeals.deals[index]["status"],
                userId: getdeals.deals[index]["user"]["_id"],
                wilaya: getdeals.deals[index]["user"]["wilaya"],
                deal: getdeals.deals[index],
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
  String dealId;
  String userId;
  String name;
  String wilaya;
  String profilePicture;
  String title;
  String description;
  String status;
  Map deal;

  DealItem({
    super.key,
    required this.dealId,
    required this.userId,
    required this.name,
    required this.wilaya,
    required this.profilePicture,
    required this.title,
    required this.description,
    required this.status,
    required this.deal,
  });

  @override
  Widget build(BuildContext context) {
    bool yesorno = true;
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
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 0),
                          child: Text(
                            wilaya,
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
                                        TokenWorker.token,
                                        dealId,
                                        titleController.text);
                                    deal["workerTitle"] = titleController.text;

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
                        maxLength: 100,
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
                                          top: 13.0, right: 7),
                                      child: IconButton(
                                        icon: const Icon(
                                          size: 30,
                                          Icons.playlist_add_check_circle_sharp,
                                          color: MyColors.mainorange,
                                        ),
                                        onPressed: () async {
                                          bloc_save_text1.setChanged(false);
                                          UpdateDeal updateDeal = UpdateDeal();
                                          await updateDeal.updateDealdesc(
                                              TokenWorker.token,
                                              dealId,
                                              descriptionController.text);
                                          deal["workerDescription"] =
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
              Consumer<ChangeStatus>(builder: (context, providerstatus, child) {
                if (yesorno) {
                  providerstatus.setStatus(status);
                  yesorno = false;
                }
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
                    providerstatus.status == "OnGoing"
                        ? Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Consumer<ProviderLoading>(
                                    builder: (context, providerloading, child) {
                                  return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.red[800],
                                      ),
                                      onPressed: () async {
                                        if (!providerloading.isLoading) {
                                          providerloading.setLoad(true);
                                          DeleteDeal deleteDeal = DeleteDeal();
                                          if (await deleteDeal.deleteDeal(
                                              TokenWorker.token, dealId)) {
                                            deal["status"] = deleteDeal.status!;
                                            providerstatus
                                                .setStatus(deleteDeal.status!);
                                            context.showSuccessMessage(
                                                "Success",
                                                "The request of finishing the deal has been sent successfully.");
                                          } else {
                                            context.showErrorMessage("Error!",
                                                "Failed to finish the deal.");
                                          }

                                          providerloading.setLoad(false);
                                        }
                                      },
                                      child: !providerloading.isLoading
                                          ? const Text(
                                              "Discard",
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
                              ),
                              Consumer<ProviderLoading1>(
                                  builder: (context, providerloading1, child) {
                                return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: MyColors.green,
                                    ),
                                    onPressed: () async {
                                      if (!providerloading1.isLoading) {
                                        providerloading1.setLoad(true);
                                        FinishDeal finishDeal = FinishDeal();
                                        if (await finishDeal.finishDeal(
                                            TokenWorker.token, dealId)) {
                                          deal["status"] = finishDeal.status!;
                                          providerstatus
                                              .setStatus(finishDeal.status!);
                                          context.showSuccessMessage("Success",
                                              "The request of finishing the deal has been sent successfully.");
                                        } else {
                                          context.showErrorMessage("Error!",
                                              "Failed to send the request of finishing the deal.");
                                        }
                                        //  status = finishDeal.status!;

                                        providerloading1.setLoad(false);
                                      }
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
                        : providerstatus.status == "FinishRequestSent"
                            ? Consumer<ProviderLoading1>(
                                builder: (context, providerloading1, child) {
                                return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.red[800],
                                    ),
                                    onPressed: () async {
                                      if (!providerloading1.isLoading) {
                                        providerloading1.setLoad(true);

                                        DeclineDeal declineDeal = DeclineDeal();

                                        if (await declineDeal.declineDeal(
                                            TokenWorker.token, dealId)) {
                                          deal["status"] = declineDeal.status!;
                                          providerstatus
                                              .setStatus(declineDeal.status!);
                                          context.showSuccessMessage("Success",
                                              "The request of finishing the deal has been canceled successfully.");
                                        } else {
                                          context.showErrorMessage("Error!",
                                              "Failed to cancel the request of finishing the deal.");
                                        }

                                        providerloading1.setLoad(false);
                                      }
                                    },
                                    child: !providerloading1.isLoading
                                        ? const Text(
                                            "Cancel Finish",
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
                              })
                            : const Text(''),
                  ],
                );
              }),
            ],
          ),
        ));
  }
}
