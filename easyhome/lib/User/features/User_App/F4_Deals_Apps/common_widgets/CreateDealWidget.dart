import 'package:easyhome/Rechidi/core/helper/cache.dart';
import 'package:easyhome/SnackBars/FlashMessage.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Provider/Change_Status.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Create_Deal.dart';
import 'package:easyhome/User/features/User_App/GetToken.dart';
import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CreateDealWidget extends StatelessWidget {
  GlobalKey<FormState> formstate_title = GlobalKey();
  GlobalKey<FormState> formstate_desc = GlobalKey();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  final Function(String status) onDealCreated;
  String? workerName;
  String? appId;
  CreateDealWidget({
    required this.workerName,
    required this.appId,
    required this.onDealCreated,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderLoading(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangeStatus(),
        ),
      ],
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        height: MediaQuery.of(context).size.height - 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  color: const Color(0xFFA2A2A2),
                  height: 6,
                  width: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 15),
                  child: Text(
                    "Create Deal",
                    style: TextStyle(
                      color: MyColors.mainorange,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 0.05,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0.5,
                        blurRadius: 0.5,
                        offset: Offset(0, -1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 30, 15, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'After you accept the application, a ',
                            style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'deal',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const TextSpan(
                                text: ' will be created between you and ',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              TextSpan(
                                text: '$workerName',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: MyColors.mainblue),
                              ),
                              const TextSpan(
                                text:
                                    '.\n \nEnter the information for this deal:',
                                style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                          child: Form(
                            key: formstate_title,
                            child: TextFormField(
                              controller: titleController,
                              maxLengthEnforcement:
                                  MaxLengthEnforcement.enforced,
                              maxLength: 70,
                              cursorColor: MyColors.mainblue,
                              decoration: const InputDecoration(
                                label: Text(
                                  "Title :",
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
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
                          child: Form(
                            key: formstate_desc,
                            child: SizedBox(
                              height: 140,
                              child: TextFormField(
                                controller: descController,
                                maxLengthEnforcement:
                                    MaxLengthEnforcement.enforced,
                                maxLength: 200,
                                maxLines: 7,
                                cursorColor: MyColors.mainblue,
                                decoration: const InputDecoration(
                                  label: Text(
                                    "Description :",
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
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 20.0, top: 12),
                            child: SizedBox(
                              height: 40,
                              width: MediaQuery.of(context).size.width - 120,
                              child: Consumer<ProviderLoading>(
                                  builder: (context, providerloading, child) {
                                return Consumer<ChangeStatus>(
                                    builder: (context, providerstatus, child) {
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                    ),
                                    onPressed: () async {
                                      if (!providerloading.isLoading) {
                                        providerloading.setLoad(true);
                                        CreateDeal createDeal = CreateDeal();
                                        if (await createDeal.createDeal(
                                            AuthCache.token!,
                                            appId!,
                                            titleController.text,
                                            descController.text)) {
                                          onDealCreated("Accepted");
                                          context.showSuccessMessage("Success",
                                              "The deal has been created successfully.");
                                        } else {
                                          context.showErrorMessage("Error!",
                                              "Failed to create the deal.");
                                        }

                                        providerloading.setLoad(false);
                                      }
                                      // ignore: use_build_context_synchronously
                                      Navigator.pop(context);
                                    },
                                    child: !providerloading.isLoading
                                        ? const Text("Create",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold))
                                        : const SizedBox(
                                            height: 15,
                                            width: 15,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              color: Colors.white,
                                            ),
                                          ),
                                  );
                                });
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
