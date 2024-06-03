part of 'index.dart';

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignUpWorkerCubit>();
    final isSubmitting = context
        .watch<SignUpWorkerCubit>()
        .state
        .maybeWhen(orElse: () => false, submitting: () => true);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => cubit.submit(),
            child: Container(
              height: 50.h,
              width: double.infinity,
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          if (isSubmitting) ...[
            height(5),
            const LinearProgressIndicator(
              color: AppColors.primary,
            ),
          ],
        ],
      ),
    );
  }
}
