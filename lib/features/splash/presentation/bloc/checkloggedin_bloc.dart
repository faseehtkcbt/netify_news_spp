import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/usecase/usecase.dart';

import '../../domain/usecase/is_logged_in_usecase.dart';

part 'checkloggedin_event.dart';
part 'checkloggedin_state.dart';

class CheckloggedinBloc extends Bloc<CheckloggedinEvent, CheckloggedinState> {
  final IsLoggedInUsecase _loggedIn;
  CheckloggedinBloc(IsLoggedInUsecase loggedIn)
      : _loggedIn = loggedIn,
        super(CheckloggedinInitial()) {
    on<CheckloggedinEvent>((event, emit) {
      final result = _loggedIn(NoParam());
      if (result == true) {
        emit(CheckloggedinLoaded(true));
      } else {
        emit(CheckloggedinLoaded(false));
      }
    });
  }
}
