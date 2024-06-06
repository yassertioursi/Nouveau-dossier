import 'package:easyhome/Worker/features/Worker_App/workerProfile/data/model/switch.dart';

sealed class SwitchState {}

final class SwitchInitial extends SwitchState {}

final class Loading extends SwitchState {}

final class Switche extends SwitchState {
 
  Switche();
}
