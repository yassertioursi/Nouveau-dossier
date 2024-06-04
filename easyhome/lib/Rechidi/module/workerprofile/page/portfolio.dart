part of 'index.dart';

class _Portfolio extends StatelessWidget {
  const _Portfolio(this._isMe);

  final bool _isMe;

  @override
  Widget build(BuildContext context) {
    final posts = context.watch<WorkerProfileCubit>().portfolioPosts;
    final poster = context.watch<WorkerProfileCubit>().worker!;
    return BlocBuilder<WorkerProfileCubit, WorkerProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            ...posts
                .map((post) => _buildPost(
                      post: post,
                      poster: poster,
                      onLike: (post) {
                        context.read<WorkerProfileCubit>().likePost(post);
                      },
                      onDelete: (post) {
                        context.read<WorkerProfileCubit>().deletePost(post);
                      },
                      onReport: (post) {},
                    ))
                .toList(),
          ],
        );
      },
    );
  }

  Widget _buildPost({
    required PortfolioPostEntity post,
    required WorkerEntity poster,
    required void Function(PortfolioPostEntity) onLike,
    required void Function(PortfolioPostEntity) onDelete,
    required void Function(PortfolioPostEntity) onReport,
  }) {
    final images = post.images;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 35.r,
                backgroundImage: NetworkImage(poster.profilePicture!),
              ),
              width(12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    poster.name!,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    post.createdAt,
                    style: TextStyle(
                      color: AppColors.grey,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              PopupMenuButton(
                color: AppColors.white,
                itemBuilder: (x) {
                  return [
                    _isMe
                        ? PopupMenuItem(
                            value: 'delete',
                            child: InkWell(
                              onTap: () {
                                onDelete(post);
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.delete),
                                  Text(' Delete'),
                                ],
                              ),
                            ),
                          )
                        : PopupMenuItem(
                            value: 'report',
                            child: InkWell(
                              onTap: () {
                                onReport(post);
                              },
                              child: const Row(
                                children: [
                                  Icon(Icons.report),
                                  Text(' Report'),
                                ],
                              ),
                            ),
                          ),
                  ];
                },
              )
            ],
          ),
          height(20),
          SizedBox(
            height: 320.r,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                ...images.map((image) {
                  return Container(
                    margin: EdgeInsets.only(right: 10.w),
                    width: 320.r,
                    height: 320.r,
                    alignment: AlignmentDirectional.topEnd,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      image: DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.contain,
                      ),
                      border:
                          Border.all(color: AppColors.black.withOpacity(0.2)),
                    ),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                      margin: EdgeInsetsDirectional.only(top: 10.h, end: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.r),
                        color: AppColors.black.withOpacity(0.2),
                      ),
                      child: Text(
                        '${images.indexOf(image) + 1} / ${images.length}',
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          height(20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text(
              post.description!,
              maxLines: 5,
              style: TextStyle(
                color: AppColors.black.withOpacity(0.7),
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          height(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '${post.likes}',
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              width(5),
              GestureDetector(
                onTap: () {
                  if (!_isMe) onLike(post);
                },
                child: Icon(
                  post.isLiked == true || _isMe
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: post.isLiked == true || _isMe
                      ? Colors.red
                      : AppColors.black,
                  size: 25.r,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
