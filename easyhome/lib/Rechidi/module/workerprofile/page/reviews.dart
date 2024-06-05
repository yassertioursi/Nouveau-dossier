part of 'index.dart';

class _Reviews extends StatelessWidget {
  const _Reviews();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkerProfileCubit, WorkerProfileState>(
      builder: (context, state) {
        final reviews = context.read<WorkerProfileCubit>().reviews;

        return ListView(
          children: [
            ...reviews.map(
              (review) => _buidlReviewCard(
                review: review,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buidlReviewCard({
    required ReviewEntity review,
  }) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(review.user!.profilePicture!),
                child: Icon(
                  Icons.person,
                  size: 30.sp,
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                review.user!.name!,
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
            children: stars(review.rating!),
          ),
          SizedBox(
            height: 10.h,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: ReadMoreText(
              review.review!,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
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
    );
  }

  List<Widget> stars(num rating) {
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
