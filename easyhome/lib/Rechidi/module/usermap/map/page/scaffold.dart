part of 'index.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required Widget jobList,
    required Widget map,
    required Widget radiusSlider,
    required Widget floatingActionButton,
  })  : _jobList = jobList,
        _map = map,
        _radiusSlider = radiusSlider,
        _floatingActionButton = floatingActionButton;

  final Widget _jobList;
  final Widget _map;
  final Widget _radiusSlider;
  final Widget _floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _map,
          Column(
            children: [
              height(30),
              _jobList,
            ],
          ),
          PositionedDirectional(
            bottom: 15.h,
            start: 0,
            end: 0,
            child: _radiusSlider,
          ),
          PositionedDirectional(
            bottom: 30.h,
            end: 20.w,
            child: _floatingActionButton,
          ),
        ],
      ),
    );
  }
}
