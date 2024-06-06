part of 'index.dart';

class _PersonalInfo extends StatelessWidget {
  const _PersonalInfo(this._isMe);

  final bool _isMe;

  @override
  Widget build(BuildContext context) {
    final worker = context.watch<WorkerProfileCubit>().worker!;
    return Stack(
      children: [
        Container(
          height: 170.h,
          width: double.infinity,
          color: AppColors.primary,
        ),
        Column(
          children: [
            height(170 - 75),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildExperience(worker.experience!),
                // width(30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProfilePicture(worker.profilePicture!),
                    height(8),
                    _buildName(worker.name!),
                    _buildBio(worker.bio),
                  ],
                ),
                // width(30),
                _buildRating(worker.rating!),
              ],
            ),
          ],
        ),
        _isMe
            ? PositionedDirectional(
                end: 10.w,
                top: 35.h,
                child: IconButton(
                  icon: Icon(Icons.menu, color: AppColors.white, size: 46.r),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ))
            : PositionedDirectional(
                start: 10.w,
                top: 35.h,
                child: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: AppColors.white, size: 46.r),
                  onPressed: () {
                    context.back();
                  },
                )),
      ],
    );
  }

  Widget _buildBio(String? bio) {
    return SizedBox(
      height: 50.h,
      child: Text(
        bio ?? '',
        maxLines: 2,
        textAlign: TextAlign.center,
        style: TextStyle(
          overflow: TextOverflow.ellipsis,
          color: AppColors.grey,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Text _buildName(String name) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.black,
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildRating(double rating) {
    return SizedBox(
      width: 95.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            FontAwesomeIcons.solidStar,
            color: AppColors.orange,
            size: 24.sp,
          ),
          Text(
            rating.toStringAsFixed(1),
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfilePicture(String profilePicture) {
    return Container(
      height: 150.r,
      width: 150.r,
      decoration: BoxDecoration(
        color: AppColors.primaryDark,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(profilePicture),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: AppColors.white,
          width: 4,
        ),
      ),
    );
  }

  Widget _buildExperience(double experience) {
    return SizedBox(
      width: 95.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$experience',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '(Experience)',
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
