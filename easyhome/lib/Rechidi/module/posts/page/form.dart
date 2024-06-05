part of 'index.dart';

class _Form extends StatelessWidget {
  const _Form();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PortfolioPostCrudCubit>();
    return Column(
      children: [
        height(20),
        _buildTextField(
          label: 'Description',
          controller: cubit.description,
          maxLines: 6,
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    int maxLines = 1,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          alignLabelWithHint: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
