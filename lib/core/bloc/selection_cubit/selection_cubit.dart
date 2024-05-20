import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'selection_state.dart';

class SelectionCubit extends Cubit<SelectionState> {
  SelectionCubit() : super(SelectionInitial(0));

  void onSelection(int select) {
    emit(SelectionInitial(select));
  }
}
