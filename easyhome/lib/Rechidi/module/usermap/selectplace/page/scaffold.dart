part of 'index.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required Widget search,
    required Widget map,
    required Widget floatingButton,
  })  : _search = search,
        _map = map,
        _floatingButton = floatingButton;

  final Widget _search;
  final Widget _map;
  final Widget _floatingButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _map,
          Column(
            children: [
              height(50),
              _search,
              const Spacer(),
              height(20),
            ],
          ),
        ],
      ),
      floatingActionButton: _floatingButton,
    );
  }
}
