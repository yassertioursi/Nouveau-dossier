import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class Worker_One extends StatelessWidget {
  late String firstName;
  late String lastName;
  late String email;
  late String wilaya;
  late String phoneNumber;
  late String _id;
  late String rating;
  late String ratingsNumber;
  late String experience;
  late String profilePicture;
  late String job;
  late bool isCertified;
  Worker_One({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.wilaya,
    required this.phoneNumber,
    required this.rating,
    required this.ratingsNumber,
    required this.experience,
    required this.profilePicture,
    required this.job,
    required this.isCertified,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      height: 180,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10),
          child: Container(
            padding: const EdgeInsets.only(bottom: 0),
            width: 170,
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 45.0),
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5, top: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            isCertified
                                ? const Icon(
                                    Icons.verified_user_rounded,
                                    color: Color(0xFF137A23),
                                  )
                                : const Text(''),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "$firstName $lastName",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Icon(
                                  FontAwesomeIcons.solidStar,
                                  color: Color(0xFFED8A19),
                                  size: 17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 4.0, top: 3.0),
                                  child: Text(
                                    "$rating",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              "$experience",
                              style: const TextStyle(color: Color(0xFFC7C7C7)),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            "$job",
                            style: const TextStyle(
                                color: MyColors.mainorange,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 4,
                        ),
                      ),
                      child: ClipOval(
                        child: SizedBox(
                          height: 80,
                          width: 80,
                          child: Image.network(
                            profilePicture,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
