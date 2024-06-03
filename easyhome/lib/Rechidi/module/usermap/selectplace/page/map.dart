part of 'index.dart';

class _Map extends StatelessWidget {
  const _Map();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapSelectorCubit, MapSelectorState>(
      builder: (context, state) {
        final cubit = context.read<MapSelectorCubit>();
        return MapBuilder(
          initialCameraPosition: cubit.cameraPosition,
          controller: cubit.controller,
          markerList: {cubit.marker},
          onTap: (place) {
            cubit.setMyLocation(place: place);
            context.showBottomSheet(
              page: _BottomSheet(
                LocationEntity(
                  title: "",
                  latitude: place.latitude,
                  longitude: place.longitude,
                  

                ),
              ),
            );
          },
        );
      },
    );
  }
}
