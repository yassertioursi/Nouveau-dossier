part of 'index.dart';

class _Slider extends StatelessWidget {
  const _Slider();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ShowMapCubit>();
    return BlocBuilder<ShowMapCubit, MapState>(
      builder: (context, state) {
        return Slider(
          value: cubit.radius,
          max: 100,
          divisions: 10,
          activeColor: AppColors.primary,
          label: '${cubit.radius.round()} Km',
          onChanged: (double value) {
            cubit.updateRadius(value);
          },
        );
      },
    );
  }
}
