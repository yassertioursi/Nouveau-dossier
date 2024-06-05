part of 'index.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required String title,
    required Widget form,
    required Widget images,
    required Widget submitButton,
  })  : _title = title,
        _form = form,
        _images = images,
        _submitButton = submitButton;

  final String _title;
  final Widget _form;
  final Widget _images;
  final Widget _submitButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => context.back(),
        ),
        title: Text(
          _title,
          style: const TextStyle(color: AppColors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _form,
            height(20),
            _images,
            height(20),
            _submitButton,
            height(20),
          ],
        ),
      ),
    );
  }
}
