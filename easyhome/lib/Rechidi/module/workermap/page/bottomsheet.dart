part of 'index.dart';

class _BottomSheet extends StatelessWidget {
  const _BottomSheet(this._post);

  final PostCard _post;

  @override
  Widget build(BuildContext context) {
    final user = _post.user;
    return Column(
      children: [
        Row(
          children: [
            _buildProfilePic(user.profilePicture ?? ''),
            width(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildName(user.name ?? ''),
                _buildWillaya(user.willaya ?? ''),
              ],
            ),
            const Spacer(),
            _buildCallButton(call: () async {
              await FlutterPhoneDirectCaller.callNumber(
             _post.phone);
            }),
          ],
        ),
        _divider(),
        _buildTitle(_post.title),
        _divider(width: 50),
        _buildDescription(_post.description),
        height(12),
        _buildApplyButton(apply: () {}),
      ],
    );
  }

  Widget _buildApplyButton({required void Function() apply}) {
    return ElevatedButton(
      onPressed: apply,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(
        'Apply',
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildDescription(String description) {
    return Text(
      description,
      style: TextStyle(
        fontSize: 14.sp,
        color: AppColors.primary.withOpacity(0.8),
      ),
    );
  }

  Widget _buildTitle(String title) {
    return Text(
      title,
      textAlign: TextAlign.start,
      maxLines: 3,
      style: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.orange,
      ),
    );
  }

  Widget _divider({double? width}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 2.h,
      width: (width ?? 120).w,
      color: AppColors.grey,
    );
  }

  Widget _buildCallButton({required void Function() call}) {
    return IconButton(
      onPressed: call,
      icon: Icon(
        Icons.call,
        color: AppColors.primary,
        size: 30.sp,
      ),
    );
  }

  Widget _buildWillaya(String willaya) {
    return Text(
      willaya,
      style: TextStyle(
        fontSize: 14.sp,
        color: AppColors.primary,
      ),
    );
  }

  Text _buildName(String name) {
    return Text(
      name,
      style: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
        color: AppColors.primary,
      ),
    );
  }

  Widget _buildProfilePic(String imgUrl) {
    return Container(
      height: 70.r,
      width: 70.r,
      decoration: BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
