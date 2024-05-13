import 'package:easyhome/User/features/User_App/F2_Home_User/Services/Search_Main.dart';
import 'package:easyhome/utils/constants/Categorys.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/SearchWorkers.dart';

import 'package:easyhome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'common_widgets/Worker_One.dart';

class HomeUser extends StatelessWidget {
  GlobalKey<FormState> formstate = GlobalKey();
  var Image_Controller = PageController();

  @override
  Widget build(BuildContext context) {
    Workers_Cat workers_cat = Workers_Cat();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 120,
                width: 80,
                child: Image.asset(
                  "lib/utils/images/logo.png",
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0, right: 15),
                  child: Container(
                    height: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MyColors.loggrey1,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0.5),
                          blurRadius: 1,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Form(
                      key: formstate,
                      child: TextFormField(
                        readOnly: true,
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: SearchWorkers(
                              Id_Search: 1,
                              jobs: [],
                              rating: 0,
                              wilaya: "All",
                              sort: 'Default',
                              postId: "",
                            ),
                          );
                        },
                        maxLines: 1,
                        cursorWidth: 3,
                        cursorColor: MyColors.mainblue,
                        style: TextStyle(
                          color: MyColors.mainblue,
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(20),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search",
                          hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          hintMaxLines: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 13),
            child: Text(
              "Categorys",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3E3E3E),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Container(
              height: 70,
              child: ListView.builder(
                itemCount: workers_cat.cats.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(13.0, 15, 5, 15),
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColors.mainblue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Center(
                          child: TextButton(
                            child: Text("${workers_cat.cats[index]}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              showSearch(
                                  context: context,
                                  delegate: SearchWorkers(
                                      jobs: workers_cat.cats
                                          .sublist(index, index + 1),
                                      Id_Search: 2,
                                      rating: 0,
                                      wilaya: "All",
                                      sort: "Default",
                                      postId: ""));
                              ;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0, 0, 5),
            child: Container(
              height: 220,
              child: PageView(
                controller: Image_Controller,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "lib/utils/images/pageview1.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        "lib/utils/images/worker.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 7.0, bottom: 20),
              child: SmoothPageIndicator(
                  controller: Image_Controller,
                  count: 3,
                  effect: ExpandingDotsEffect(
                      dotColor: Color(0xFFD7D4D4),
                      activeDotColor: Color(0xFF666363),
                      dotHeight: 13,
                      dotWidth: 13),
                  onDotClicked: (index) {}),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, bottom: 20),
            child: Text(
              "Best Workers",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF3E3E3E),
              ),
            ),
          ),
          Worker_One(
            firstName: "Levi",
            lastName: "Ackeraman",
            email: "levi@gmail.com",
            wilaya: "Tlemcen",
            phoneNumber: "0799999999",
            rating: "4.8",
            ratingsNumber: "99",
            experience: "150",
            profilePicture:
                "https://m.media-amazon.com/images/I/41AY0W4qFOL._AC_UF894,1000_QL80_.jpg",
            job: "CLeaner",
            isCertified: true,
          ),
        ],
      ),
    );
  }
}
