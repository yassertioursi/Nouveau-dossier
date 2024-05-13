import 'package:bloc/bloc.dart';
import 'package:easyhome/User/features/User_App/userProfile/data/repository/repo.dart';
import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/worker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'worker_state.dart';

class WorkerCubit extends Cubit<WorkerState> {
  final Repo repo;
  WorkerCubit(this.repo) : super(WorkerInitial()) {
    emitGetWorkerDetails("66380575b0a95c051bb5e786");
  }

  Future<void> emitGetWorkerDetails(String workerId) async {
    emit(Loading());
    await repo.getWorkerById(workerId).then((workerDetails) {
      emit(GetWorkerDetails(worker: workerDetails));
    });
  }
}
