part of 'index.dart';

class _Slider extends StatelessWidget {
  const _Slider();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<PostsMapCubit>();
    return BlocBuilder<PostsMapCubit, PostsMapState>(
      builder: (context, state) {
        return Slider(
          value: cubit.raduis,
          max: 100,
          divisions: 5,
          activeColor: AppColors.primary,
          label: '${cubit.raduis.round()} Km',
          onChanged: (double value) {
            cubit.updateRadius(value);
          },
        );
      },
    );
  }
}
