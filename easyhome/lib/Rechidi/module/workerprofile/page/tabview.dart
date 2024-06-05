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
            _buildTabBar(),
            Expanded(
                child: TabBarView(
              children: [
                _portfolio,
                _reviews,
                _certificates,
              ],
            )),
          ],
        );
      },
    );
  }

  Widget _buildTabBar() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(children: [
        Container(
          color: Mycolors.myBlue,
          child: TabBar(
            padding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            labelStyle: TextStyle(
              fontSize: 19.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: TextStyle(
                fontSize: 15.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500),
            tabs: const [
              Tab(
                text: "Portfolio",
              ),
              Tab(
                text: "Reviews",
              ),
              Tab(
                text: "Certificates",
              ),
            ],
          ),
        ),
      ]),
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
