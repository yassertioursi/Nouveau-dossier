part of 'worker_cubit.dart';

@immutable
sealed class WorkerState {}

final class WorkerInitial extends WorkerState {}

final class Loading extends WorkerState {}

class GetWorkerDetails extends WorkerState {
  late final MyWorker worker;
  GetWorkerDetails({required this.worker});
}
