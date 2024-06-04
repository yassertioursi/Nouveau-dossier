part of 'index.dart';

class _TabView extends StatelessWidget {
  const _TabView({
    required Widget portfolio,
    required Widget reviews,
    required Widget certificates,
  })  : _portfolio = portfolio,
        _reviews = reviews,
        _certificates = certificates,
        super(key: const Key('tab_view'));

  final Widget _portfolio;
  final Widget _reviews;
  final Widget _certificates;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkerProfileCubit, WorkerProfileState>(
      builder: (context, state) {
        final cubit = context.read<WorkerProfileCubit>();
        return Column(
          children: [
            _buildTabBar(cubit.tabIndex, cubit.changeTab),
            height(8),
            [_portfolio, _reviews, _certificates][cubit.tabIndex],
          ],
        );
      },
    );
  }

  Widget _buildTabBar(
    int currentIndex,
    void Function(int) onTap,
  ) {
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTabItem(
            title: 'Portfolio',
            onTap: () => onTap(0),
            isSelected: currentIndex == 0,
          ),
          _buildTabItem(
            title: 'Reviews',
            onTap: () => onTap(1),
            isSelected: currentIndex == 1,
          ),
          _buildTabItem(
            title: 'Certificates',
            onTap: () => onTap(2),
            isSelected: currentIndex == 2,
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required String title,
    required void Function() onTap,
    required bool isSelected,
  }) {
    return SizedBox(
      width: 100.w,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            height(20),
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? AppColors.white
                    : AppColors.white.withOpacity(0.6),
                fontSize: isSelected ? 18.sp : 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            height(15),
            if (isSelected)
              Container(
                height: 3,
                width: 45.w,
                color: AppColors.white,
              ),
          ],
        ),
      ),
    );
  }
}
