part of 'index.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required Widget updatePic,
    required Widget personalInfo,
    required Widget workInfo,
    required Widget submitButton,
  })  : _updatePic = updatePic,
        _personalInfo = personalInfo,
        _workInfo = workInfo,
        _submitButton = submitButton;

  final Widget _updatePic;
  final Widget _personalInfo;
  final Widget _workInfo;
  final Widget _submitButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile'), centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            height(20),
            _updatePic,
            height(20),
            _personalInfo,
            height(5),
            _workInfo,
            height(25),
            _submitButton,
            height(8),
          ],
        ),
      ),
    );
  }
}
