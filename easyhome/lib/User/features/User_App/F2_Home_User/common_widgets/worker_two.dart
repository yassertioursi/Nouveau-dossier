import 'package:easyhome/User/features/F1_Login&Signup/Provider/ProviderAuth.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Provider/Ok_Provider.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/Services/Add_Fav.dart';

import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Worker_two extends StatelessWidget {
  String name;
  String email;
  String wilaya;
  String phoneNumber;
  String id;
  double rating;

  double experience;
  String profilePicture;
  String job;
  bool isCertified;
  bool isFav;
  Worker_two({
    required this.name,
    required this.email,
    required this.wilaya,
    required this.phoneNumber,
    required this.rating,
    required this.experience,
    required this.profilePicture,
    required this.job,
    required this.isCertified,
    required this.id,
    required this.isFav,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    bool yesorno = true;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (BuildContext context) => ProviderOk()),
        ChangeNotifierProvider(
            create: (BuildContext context) => ProviderLoading()),
      ],
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 25, 20, 20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 140,
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              height: 120,
              width: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 5),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
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
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 18.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            const Icon(
                              Icons.verified_user_rounded,
                              color: MyColors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0, left: 20),
                        child: Text(
                          job,
                          style: const TextStyle(
                              color: MyColors.mainorange,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Consumer<ProviderOk>(
                            builder: (context, providerok, child) {
                          return Consumer<ProviderLoading>(
                              builder: (context, providerload, child) {
                            if (yesorno) {
                              providerok.setOk(isFav);
                              yesorno = false;
                            }
                            return InkWell(
                                onTap: () async {
                                  if (!providerload.isLoading) {
                                    providerload.setLoad(true);
                                    AddFav addFav = AddFav();

                                    providerok.setOk(!providerok.isOk);
                                    if (await addFav.addFav(
                                        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1ZjQ4M2MyMDEyOGRjNzM0N2UwZjQ1OCIsImN1cnJlbnRSb2xlIjoiVXNlciIsImlhdCI6MTcxNDg2MjEwMSwiZXhwIjoxNzIyNjM4MTAxfQ.8laIC_xG-0deFsBKHfR4Ie_wVv6oiqHLnHYSHBCmpRA",
                                        id)) providerload.setLoad(false);
                                  }
                                },
                                child: providerok.isOk
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Color(0xFFFF1100),
                                      )
                                    : const Icon(Icons.favorite_outline,
                                        color: Colors.black));
                          });
                        }),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15.0, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  FontAwesomeIcons.solidStar,
                                  color: MyColors.stars,
                                  size: 17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0, top: 3.0),
                                  child: Text(
                                    "$rating ",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Text(
                          wilaya,
                          style: const TextStyle(
                            color: MyColors.mainblue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "(${experience.toInt()})",
                          style: const TextStyle(color: Color(0xFFC7C7C7)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
