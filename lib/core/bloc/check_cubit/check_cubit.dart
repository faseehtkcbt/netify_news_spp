import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_state.dart';

class CheckCubit extends Cubit<CheckState> {
  CheckCubit() : super(CheckLoaded(false));

  void onChecked(bool check) {
    print("hello");
    emit(CheckLoaded(!check));
  }
}
