// ignore_for_file: prefer_const_constructors

import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class Worker_One extends StatelessWidget {
  String name;
  String id;

  String wilaya;
  String profilePicture;
  double rating;
  String experience;
  String job;
  bool isCertified;
  Worker_One({
    required this.id,
    required this.name,
    required this.wilaya,
    required this.rating,
    required this.experience,
    required this.profilePicture,
    required this.job,
    required this.isCertified,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String ratingStr = rating.toString();
    double roundedRating = double.parse(rating.toStringAsFixed(1));
    return SizedBox(
      height: 200,
      width: 170,
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 8),
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
                    padding: isCertified
                        ? const EdgeInsets.fromLTRB(8, 4, 8, 0)
                        : const EdgeInsets.fromLTRB(8, 8, 8, 0),
                    child: Text(
                      "$name ",
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
                            padding: const EdgeInsets.only(left: 4.0, top: 3.0),
                            child: Text(
                              "$roundedRating ",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "EXP",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "$experience",
                            style: const TextStyle(color: Color(0xFFC7C7C7)),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: !isCertified
                        ? const EdgeInsets.only(top: 0.0)
                        : const EdgeInsets.only(top: 0),
                    child: Text(
                      "$job",
                      overflow: TextOverflow.ellipsis,
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
                    height: 70,
                    width: 70,
                    child: profilePicture == "default.jpg" ||
                            profilePicture.isEmpty
                        ? Image.asset("lib/utils/images/default.jpg")
                        : Image.network(
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
    );
  }
}
