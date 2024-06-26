import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  String? desc;
  String? createdAt;
  Details({
    required this.desc,
    required this.createdAt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height / 2,
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
                  "Details",
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
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Row(
                          children: [
                            const Text(
                              "Created At :",
                              style: TextStyle(
                                  color: MyColors.mainblue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Text(
                              createdAt!.substring(0, 10),
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 10.0,
                        ),
                        child: Text(
                          "Description :",
                          style: TextStyle(
                              color: MyColors.mainblue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Text(
                        desc!,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
