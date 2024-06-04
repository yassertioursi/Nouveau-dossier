part of 'index.dart';

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton(this._isMe);

  final bool _isMe;

  @override
  Widget build(BuildContext context) {
    return _isMe
        ? FloatingActionButton(
            onPressed: () {},
            backgroundColor: AppColors.primary,
            child: Icon(
              Icons.add,
              color: AppColors.white,
              size: 24.sp,
            ),
          )
        : const SizedBox();
  }
}
