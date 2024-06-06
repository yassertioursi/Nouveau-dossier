import 'package:easyhome/SnackBars/FlashMessage.dart';
import 'package:easyhome/User/features/User_App/F2_Home_User/common_widgets/SearchWorkers.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Service/Get_PostByID.dart';
import 'package:easyhome/User/features/User_App/GetToken.dart';
import 'package:easyhome/User/features/User_App/userProfile/BloC/post_cubit/post_cubit.dart';
import 'package:easyhome/User/features/User_App/userProfile/UI/widgets/profile/profile_Page/uper_profile.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/model/post.dart';
import 'package:easyhome/User/features/User_App/userProfile/updatePost.dart/updatemyPost.dart';
import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

Widget postUI(BuildContext context, PData post) {
  final image_Controller = PageController();
  return Padding(
    padding: EdgeInsets.only(bottom: 20.h),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(
              horizontal: BorderSide(
                  color: const Color.fromARGB(255, 20, 19, 19).withOpacity(0.3),
                  width: 0.3))),
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      height: post.images?.length != 0
          ? 700.h
          : post.title!.length > 40
              ? 320.h
              : 270.h,
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
                          height: 65,
                          width: 65,
                          child: profilepic(post.user?.profilePicture, false)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            post.user?.name ?? '',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.h, left: 3),
                            child: Text(
                              post.user?.wilaya ?? '',
                              style: const TextStyle(
                                  color: Mycolors.myOrange,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: _popupmenu(post))
              ],
            ),
          ),
          if (post.images?.length != 0)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 5),
                child: PageView.builder(
                  controller: image_Controller,
                  itemCount: post.images?.length,
                  itemBuilder: (BuildContext context, int imageIndex) {
                    return AspectRatio(
                        aspectRatio: 1.0,
                        child: Image.network(
                          post.images![imageIndex],
                          fit: BoxFit.cover,
                        ));
                  },
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // if (userDetails.data?.currentRole == 'worker')
                //   InkWell(
                //     child: Icon(
                //       Icons.work_outline,
                //       size: 40,
                //       color: Colors.black.withOpacity(0.7),
                //     ),
                //     onTap: () {},
                //   ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 20.h, top: 15.h),
                      child: SmoothPageIndicator(
                        controller: image_Controller,
                        count: post.images?.length ?? 0,
                        effect: ScrollingDotsEffect(
                          dotColor: const Color(0xFFD7D4D4),
                          activeDotColor: Mycolors.myOrange,
                          dotHeight: 9.sp,
                          dotWidth: 9.sp,
                        ),
                        onDotClicked: (index) {},
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      showSearch(
                          context: context,
                          delegate: SearchWorkers(
                            Id_Search: 1,
                            jobs: [],
                            rating: 0,
                            wilaya: "All",
                            sort: 'Default',
                            postId: post.id!,
                          ));
                    },
                    child: Icon(
                      Icons.send,  
                      
                      color: Colors.black,
                      size: 30,
                    ),
                  ),
                ),
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
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  post.title ?? '',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 10.0, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "MaxPrice :",
                      style: TextStyle(
                          color: Color(0xFF3E3E3E),
                          fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    Text(
                      "  ${post.price ?? "Not Mentioned"} DA",
                      style: const TextStyle(
                          color: Color(0xFF137A23),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      useSafeArea: true,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        ),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return details(context, post);
                      },
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.only(
                      left: 12.0,
                      right: 12,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Details",
                          style: TextStyle(
                              color: Color(0xFF3E3E3E),
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF3E3E3E),
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget details(BuildContext context, PData post) {
  return Container(
    padding: EdgeInsets.only(top: 20, bottom: 30.w),
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
                  color: Mycolors.myOrange,
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
                                color: Mycolors.myBlue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            post.createdAt?.substring(0, 10) ?? '',
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
                            color: Mycolors.myBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Text(
                      post.description ?? "",
                      style: const TextStyle(color: Colors.black, fontSize: 16),
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

Widget _popupmenu(PData post) {
  return Container(
    color: Colors.white,
    child: PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          textStyle: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
          child: InkWell(
            onTap: () async {
              UpdateMyPost updateMyPost = UpdateMyPost();
              Navigator.pop(context);
              updateMyPost.update_post(context, post.id!);
            },
            child: const Row(
              children: [
                Icon(Icons.edit),
                Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text("Edit Post")),
              ],
            ),
          ),
        ),
        PopupMenuItem(
            textStyle: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w800,
            ),
            child: InkWell(
              onTap: () {
                // post.id ?? ''
                BlocProvider.of<PostCubit>(context).emitDeletePost(post);
                context.showSuccessMessage(
                    "Success", "The post has been deleted successfully.");
                Navigator.of(context).pop();
              },
              child: const Row(
                children: [
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Delete Post",
                    ),
                  ),
                ],
              ),
            )),
      ],
      color: Colors.white,
    ),
  );
}
