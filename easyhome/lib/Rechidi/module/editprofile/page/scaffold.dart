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
      appBar: _buildAppBar(context),
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

  AppBar _buildAppBar(BuildContext context) => AppBar(
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.white),
          onPressed: () => context.back(),
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: AppColors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      );
}
