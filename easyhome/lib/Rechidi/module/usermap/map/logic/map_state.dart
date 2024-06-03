part of 'map_cubit.dart';

@freezed
class MapState with _$MapState {
  const factory MapState.initial() = _Initial;

  const factory MapState.setJobLoading() = _SetJobLoading;
  const factory MapState.setJobSuccess() = _SetJobSuccess;

  const factory MapState.setRadiusLoading() = _SetRadiusLoading;
  const factory MapState.setRadiusSuccess() = _SetRadiusSuccess;

  const factory MapState.fetchingWorkers() = _FetchingMarkerList;
  const factory MapState.fetchWorkersListSuccess() = _FetchMarkerListSuccess;
}
