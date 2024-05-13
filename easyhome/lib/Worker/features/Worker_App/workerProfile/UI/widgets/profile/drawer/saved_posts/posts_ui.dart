import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/savePosts/save_posts_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/saved_posts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeWorker extends StatelessWidget {
  const HomeWorker({Key? key, required this.posts}) : super(key: key);
  final List<Datapost> posts;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 55.w),
          child: Text(
            "Saved posts",
            style: TextStyle(
                fontSize: 25.sp,
                color: Mycolors.myBlue,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return SafeArea(child: Post(post: posts[index]));
        },
      ),
    );
  }
}

class Post extends StatelessWidget {
  var Image_Controller = PageController();
  Post({Key? key, required this.post}) : super(key: key);
  final Datapost post;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal:
                  BorderSide(color: Colors.grey.withOpacity(0.3), width: 0.3))),
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      height: (post.post!.images!.isNotEmpty) ? 700.sp : 250.sp,
      width: MediaQuery.of(context).size.width - 80,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12.0, right: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: SizedBox(
                        height: 55,
                        width: 55,
                        child: Image.network(
                          post.post?.user?.profilePicture ?? 'default.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            post.post?.user!.name ?? '',
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              post.post!.user!.wilaya!,
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
                // Padding(
                //   padding: const EdgeInsets.only(bottom: 10.0),
                //   child: IconButton(
                //       onPressed: () {},
                //       icon: const Icon(
                //         size: 40,
                // Icons.more_vert,
                //         color: Colors.black,
                //       )),
                // )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 5),
              child: PageView.builder(
                controller: Image_Controller,
                itemCount: post.post!.images!.length,
                itemBuilder: (BuildContext context, int index) {
                  return AspectRatio(
                    aspectRatio: 1.0,
                    child: Image.network(
                      post.post!.images![index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: Icon(
                    Icons.work_outline,
                    size: 40,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  onTap: () {},
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: SmoothPageIndicator(
                      controller: Image_Controller,
                      count: post.post!.images!.length,
                      effect: const ScrollingDotsEffect(
                        dotColor: Color(0xFFD7D4D4),
                        activeDotColor: Mycolors.myOrange,
                        dotHeight: 9,
                        dotWidth: 9,
                      ),
                      onDotClicked: (index) {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                  width: 60.w,
                  child: InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: IconButton(
                        onPressed: () {
                          BlocProvider.of<SavePostsCubit>(context)
                              .emitUnsavePost(post.post!);
                        },
                        icon: const Icon(Icons.save),
                        iconSize: 40.sp,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  post.post!.title ?? '',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp),
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(17, 10.0, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "MaxPrice : ",
                      style: TextStyle(
                          color: const Color(0xFF3E3E3E),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp),
                    ),
                    Text(
                      '${post.post!.price} DA',
                      style: TextStyle(
                          color: const Color(0xFF137A23),
                          fontSize: 15.sp,
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
                        return Details(
                          post: post.post!,
                        );
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
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.post,
  });
  final Posts post;

  @override
  Widget build(
    BuildContext context,
  ) {
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
                              "${post.createdAt!.substring(0, 10)}",
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
                        post.description!,
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
