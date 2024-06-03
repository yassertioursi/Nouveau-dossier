part of 'index.dart';

class _Map extends StatelessWidget {
  const _Map();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowMapCubit, MapState>(
      builder: (context, state) {
        final cubit = context.read<ShowMapCubit>();
        return MapBuilder(
          initialCameraPosition: cubit.cameraPosition,
          controller: cubit.controller,
          markerList: cubit.markerList(showInfo: (x){
            context.showBottomSheet(page: _BottomSheet(x));
          }),
          circles: {cubit.circle},
          onTap: (place) {
            cubit.setMyLocation(place: place);
          },
        );
      },
    );
  }
}
