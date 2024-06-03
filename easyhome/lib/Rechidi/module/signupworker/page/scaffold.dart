part of 'index.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required Widget logo,
    required Widget form,
    required Widget submitButton,
  })  : _logo = logo,
        _form = form,
        _signupButton = submitButton;

  final Widget _logo;
  final Widget _form;
  final Widget _signupButton;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              height(22),
              _logo,
              height(10),
              _form,
              height(22),
              _signupButton,
            ],
          ),
        ),
      ),
    );
  }
}
