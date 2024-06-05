part of 'index.dart';

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PortfolioPostCrudCubit, PortfolioPostCrudState>(
      builder: (context, state) {
        final cubit = context.read<PortfolioPostCrudCubit>();
        return ConditionalBuilder(
          condition: state.maybeWhen(orElse: () => true, saving: () => false),
          builder: (context) => InkWell(
            onTap: () {
              cubit.savePost();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 35.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          fallback: (context) => const CircularProgressIndicator(),
        );
      },
    );
  }
}
