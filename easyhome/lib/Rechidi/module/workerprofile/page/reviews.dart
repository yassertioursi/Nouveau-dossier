part of 'index.dart';

class _Reviews extends StatelessWidget {
  const _Reviews(this._isMe);

  final bool _isMe;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkerProfileCubit, WorkerProfileState>(
      builder: (context, state) {
        final reviews = context.read<WorkerProfileCubit>().reviews;

        return Column(
          children: [
            ...reviews.map(
              (review) => _buidlReviewCard(
                review: review,
                onDelete: () {
                  context.read<WorkerProfileCubit>().deleteReview(review);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buidlReviewCard({
    required ReviewEntity review,
    required VoidCallback onDelete,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 22.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey.withOpacity(0.5),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30.r,
            backgroundImage: NetworkImage(review.user!.profilePicture!),
          ),
          width(8),
          Column(
            children: [
              Text(
                review.user!.name!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: AppColors.black,
                ),
              ),
              height(4),
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.star,
                    height: 20.r,
                    width: 20.r,
                  ),
                  width(5),
                  Text(
                    review.rating.toString(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          if (_isMe)
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete),
            ),
        ],
      ),
    );
  }
}
