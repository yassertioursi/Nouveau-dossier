import 'package:easyhome/User/features/User_App/userProfile/utils/constants/colors.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/Bloc/reviews/reviews_cubit.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:readmore/readmore.dart';

class BuildReviews extends StatefulWidget {
  const BuildReviews({super.key});

  @override
  State<BuildReviews> createState() => _BuildReviewsState();
}

class _BuildReviewsState extends State<BuildReviews> {
  @override
  Widget build(BuildContext context) {
    return _buildBloc();
  }

  Widget _buildBloc() {
    return BlocBuilder<ReviewsCubit, ReviewsState>(
      builder: (context, state) {
        final cubit = context.read<ReviewsCubit>();
        if (!(state is Loading && cubit.reviews.isEmpty)) {
          return buildReviews(cubit.reviews);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget buildReviews(List<ReviewsData> posts) {
    return Container(
      color: Colors.white,
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return _review(posts[index]);
          }),
    );
  }

  Widget _review(ReviewsData review) {
    return Container(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(
                    Icons.person,
                    size: 30.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                Text(
                  review.user!,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              children: stars(4.1),
            ),
            SizedBox(
              height: 10.h,
            ),
            if (review.review != '')
              Align(
                alignment: Alignment.bottomLeft,
                child: ReadMoreText(
                  review.review!,
                  style:
                      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
                  trimMode: TrimMode.Line,
                  trimLines: 3,
                  colorClickableText: Mycolors.myBlue,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: '  Show less',
                  moreStyle:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                  lessStyle:
                      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                ),
              ),
            SizedBox(
              height: 5.h,
            ),
            Divider(
              endIndent: 20.w,
              indent: 20.w,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> stars(double rating) {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      if (rating >= 1) {
        list.add(Icon(
          Icons.star,
          size: 25.sp,
          color: Mycolors.myOrange,
        ));
      } else if (rating < 1 && rating > 0) {
        list.add(Icon(
          Icons.star_half,
          size: 25.sp,
          color: Mycolors.myOrange,
        ));
      } else {
        list.add(Icon(
          Icons.star_outline,
          size: 25.sp,
          color: Mycolors.myOrange,
        ));
      }
      rating = rating - 1;
    }
    return list;
  }
}
