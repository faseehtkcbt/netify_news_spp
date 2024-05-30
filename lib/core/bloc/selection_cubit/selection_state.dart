part of 'selection_cubit.dart';

abstract class SelectionState {}

class SelectionInitial extends SelectionState {
  final int index;

  SelectionInitial(this.index);
}
