part of 'index.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required Widget personalInfo,
    required Widget workInfo,
    required Widget tabView,
    required Widget drawer,
  })  : _personalInfo = personalInfo,
        _workInfo = workInfo,
        _tabView = tabView,
        _drawer = drawer;

  final Widget _personalInfo;
  final Widget _workInfo;
  final Widget _tabView;
  final Widget _drawer;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkerProfileCubit, WorkerProfileState>(
      builder: (context, state) {
        return ConditionalBuilder(
          condition: context.watch<WorkerProfileCubit>().worker != null,
          builder: (context) =>
              _Profile(_personalInfo, _workInfo, _tabView, _drawer),
          fallback: (context) =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
        );
      },
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile(
      this._personalInfo, this._workInfo, this._tabView, this._drawer);

  final Widget _personalInfo;
  final Widget _workInfo;
  final Widget _tabView;
  final Widget _drawer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _personalInfo,
            height(24),
            _workInfo,
            height(12),
            _tabView,
          ],
        ),
      ),
      endDrawer: _drawer,
    );
  }
}
