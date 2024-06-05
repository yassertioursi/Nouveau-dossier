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
}
