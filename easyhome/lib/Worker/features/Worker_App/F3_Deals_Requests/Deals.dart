import 'package:easyhome/User/features/F1_Login&Signup/BLoC/bloc_auth.dart';
import 'package:easyhome/User/features/F1_Login&Signup/common_widgets/Dwwira.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Bloc/Ok_Provider.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Services/Get_Worker_ById.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/BloC/Change_Status.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/BloC/Save_Text.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Accept_Finish.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Decline_Deal.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Delete_Deal.dart';
import 'package:easyhome/Worker/features/Worker_App/F3_Deals_Requests/Service/Finish_Deal.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Get_My_Deals.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Update_Deal.dart';
import 'package:easyhome/Worker/features/Worker_App/F3_Deals_Requests/Service/Get_User_ById.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class DealWorker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GetDeals getdeals = GetDeals();

    return FutureBuilder<String>(
      future: getdeals.getDeals(
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE0Njg5OTI1LCJleHAiOjE3MjI0NjU5MjV9.7V_Vl_kuzSpqKppoJsnZgeuaTBzxZXWHgrWsGHtn2-g"),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child:
                  Dwwira(color: MyColors.mainblue, height: 60.0, width: 60.0));
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
          ChangeNotifierProvider(create: (BuildContext context) => bloc_five()),
          ChangeNotifierProvider(
              create: (BuildContext context) => bloc_five_One()),
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
                        Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0, left: 0),
                          child: Text(
                            wilaya,
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
                                        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE0Njg5OTI1LCJleHAiOjE3MjI0NjU5MjV9.7V_Vl_kuzSpqKppoJsnZgeuaTBzxZXWHgrWsGHtn2-g",
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
                                              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE0Njg5OTI1LCJleHAiOjE3MjI0NjU5MjV9.7V_Vl_kuzSpqKppoJsnZgeuaTBzxZXWHgrWsGHtn2-g",
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
                    providerstatus.status == "OnGoing"
                        ? Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Consumer<bloc_five>(
                                    builder: (context, bloc_5_1, child) {
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.red[800],
                                    ),
                                    onPressed: () async {
                                      if (!bloc_5_1.isLoading) {
                                        bloc_5_1.setLoad(true);
                                        DeleteDeal deleteDeal = DeleteDeal();
                                        await deleteDeal.deleteDeal(
                                            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE0Njg5OTI1LCJleHAiOjE3MjI0NjU5MjV9.7V_Vl_kuzSpqKppoJsnZgeuaTBzxZXWHgrWsGHtn2-g",
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
                              ),
                              Consumer<bloc_five_One>(
                                  builder: (context, bloc_5_2, child) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: MyColors.green,
                                  ),
                                  onPressed: () async {
                                    if (!bloc_5_2.isLoading) {
                                      bloc_5_2.setLoad(true);
                                      FinishDeal finishDeal = FinishDeal();
                                      await finishDeal.finishDeal(
                                          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE0Njg5OTI1LCJleHAiOjE3MjI0NjU5MjV9.7V_Vl_kuzSpqKppoJsnZgeuaTBzxZXWHgrWsGHtn2-g",
                                          dealId);
                                      //  status = finishDeal.status!;
                                      deal["status"] = finishDeal.status!;
                                      providerstatus
                                          .setStatus(finishDeal.status!);
                                      bloc_5_2.setLoad(false);
                                    }
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
                        : providerstatus.status == "FinishRequestSent"
                            ? Consumer<bloc_five_One>(
                                builder: (context, bloc_5_2, child) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red[800],
                                  ),
                                  onPressed: () async {
                                    if (!bloc_5_2.isLoading) {
                                      bloc_5_2.setLoad(true);

                                      DeclineDeal declineDeal = DeclineDeal();

                                      await declineDeal.declineDeal(
                                          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZWY3NDZkOTcwODZjYmQ4ZWU2M2FlOCIsImN1cnJlbnRSb2xlIjoiV29ya2VyIiwiaWF0IjoxNzE0Njg5OTI1LCJleHAiOjE3MjI0NjU5MjV9.7V_Vl_kuzSpqKppoJsnZgeuaTBzxZXWHgrWsGHtn2-g",
                                          dealId);

                                      deal["status"] = declineDeal.status!;
                                      providerstatus
                                          .setStatus(declineDeal.status!);

                                      bloc_5_2.setLoad(false);
                                    }
                                  },
                                  child: !bloc_5_2.isLoading
                                      ? Text(
                                          "Cancel Finish",
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
                              })
                            : Text(''),
                  ],
                );
              }),
            ],
          ),
        ));
  }
}
