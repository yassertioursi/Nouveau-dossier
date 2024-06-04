part of 'index.dart';

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        final cubit = context.read<EditProfileCubit>();
        final isLoading = state.maybeWhen(
          submitting: () => true,
          orElse: () => false,
        );

        if (isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              backgroundColor: AppColors.primary,
              color: Colors.white,
            ),
          );
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 45.w),
          child: InkWell(
            onTap: () {
              cubit.submit();
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
