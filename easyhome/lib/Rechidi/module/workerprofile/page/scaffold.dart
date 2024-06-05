part of 'index.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required Widget personalInfo,
    required Widget workInfo,
    required Widget tabView,
    required Widget drawer,
    required Widget floationgActionButton,
  })  : _personalInfo = personalInfo,
        _workInfo = workInfo,
        _tabView = tabView,
        _drawer = drawer,
        _floationgActionButton = floationgActionButton;

  final Widget _personalInfo;
  final Widget _workInfo;
  final Widget _tabView;
  final Widget _drawer;
  final Widget _floationgActionButton;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkerProfileCubit, WorkerProfileState>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: context.watch<WorkerProfileCubit>().worker != null,
          builder: (context) => _Profile(
            _personalInfo,
            _workInfo,
            _tabView,
            _drawer,
            _floationgActionButton,
          ),
          fallback: (context) =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
        );
      },
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile(this._personalInfo, this._workInfo, this._tabView,
      this._drawer, this._floationgActionButton);

  final Widget _personalInfo;
  final Widget _workInfo;
  final Widget _tabView;
  final Widget _drawer;
  final Widget _floationgActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [_personalInfo, _workInfo],
                ),
              ),
            ];
          },
          body: _tabView,
        ),
      ),
      endDrawer: _drawer,
      floatingActionButton: _floationgActionButton,
    );
  }
}
