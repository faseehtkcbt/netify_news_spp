part of 'check_cubit.dart';

@immutable
abstract class CheckState {}

class CheckLoaded extends CheckState {
  bool isChecked;
  CheckLoaded(this.isChecked);
}
