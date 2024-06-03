import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/profile_Page/uper_profile.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/portfolio/portfolio_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/UI/screens/worker_profile_sceen.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/portfolio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:readmore/readmore.dart';

Widget portPostUI(BuildContext context, PortfolioData post) {
  final image_Controller = PageController();
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
            horizontal: BorderSide(
                color: const Color.fromARGB(255, 20, 19, 19).withOpacity(0.8),
                width: 0.3))),
    padding: EdgeInsets.only(top: 10, bottom: 30.h),
    height: (post.images?.length != 0) ? 500.h : 200.h,
    width: MediaQuery.of(context).size.width - 80,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 7),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: SizedBox(
                        height: 55,
                        width: 55,
                        child: profilepic(
                            workerDetails?.worker?.profilePicture, false)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      workerDetails?.worker?.name ?? '',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, top: 10),
                  child: _popmenu(post))
            ],
          ),
        ),
        if ((post.images?.length != 0))
          Expanded(
            child: Container(
              padding: EdgeInsets.only(bottom: 5, left: 5.sp, right: 5.sp),
              child: PageView.builder(
                controller: image_Controller,
                itemCount: post.images?.length,
                itemBuilder: (BuildContext context, int imageIndex) {
                  return AspectRatio(
                      aspectRatio: 1.0,
                      child: profilepic(post.images?[imageIndex], true));
                },
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 10),
          child: Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.h, top: 3.h),
                child: SmoothPageIndicator(
                  controller: image_Controller,
                  count: post.images?.length ?? 0,
                  effect: ScrollingDotsEffect(
                    dotColor: const Color.fromARGB(255, 91, 107, 128),
                    activeDotColor: Mycolors.myOrange,
                    dotHeight: 9.sp,
                    dotWidth: 9.sp,
                  ),
                  onDotClicked: (index) {},
                ),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: ReadMoreText(
                    post.description ?? '',
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                    trimMode: TrimMode.Line,
                    trimLines: 2,
                    colorClickableText: Mycolors.myBlue,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: '  Show less',
                    moreStyle:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                    lessStyle:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(3.w, 0, 10.w, 0.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Created : ${post.createdAt!.substring(0, 10)}",
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      )),
                  Row(
                    children: [
                      Text(
                        "${post.likes}",
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: post.isLiked!
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border_outlined),
                        color: Colors.red,
                        iconSize: 35.sp,
                        onPressed: () {},
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget _popmenu(PortfolioData post) {
  return PopupMenuButton(
      itemBuilder: (context) => [
            PopupMenuItem(
              textStyle: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w600,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    const Icon(Icons.edit),
                    Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Edit Post",
                          style:
                              TextStyle(fontSize: 16.sp, color: Colors.black),
                        )),
                  ],
                ),
              ),
            ),
            PopupMenuItem(
                textStyle: TextStyle(
                  fontSize: 35.sp,
                  fontWeight: FontWeight.w800,
                ),
                child: InkWell(
                  onTap: () {
                    BlocProvider.of<PortfolioCubit>(context)
                        .emitDeletePortfolioPost(post);

                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red[800],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Delete Post",
                          style: TextStyle(
                              fontSize: 16.sp, color: Colors.red[800]),
                        ),
                      ),
                    ],
                  ),
                )),
          ]);
}
// if (userDetails.data?.currentRole == 'worker')
//   SizedBox(
//     height: 60,
//     width: 60,
//     child: InkWell(
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: Image.asset(
//           "lib/utils/images/save-instagram1.png",
//           fit: BoxFit.cover,
//         ),
//       ),
//     ),
//   )
