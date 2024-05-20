part of 'selection_cubit.dart';

@immutable
abstract class SelectionState {}

class SelectionInitial extends SelectionState {
  final int index;

  SelectionInitial(this.index);
}
