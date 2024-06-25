import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/failure/failures.dart';
import 'package:news_app/core/usecase/usecase.dart';

import '../../domain/usecase/delete_data_usecase.dart';
import '../../domain/usecase/is_logged_in_usecase.dart';

part 'checkloggedin_event.dart';
part 'checkloggedin_state.dart';

class CheckloggedinBloc extends Bloc<CheckloggedinEvent, CheckloggedinState> {
  final IsLoggedInUsecase _loggedIn;
  final DeleteDataUsecase _delete;

  CheckloggedinBloc(IsLoggedInUsecase loggedIn, DeleteDataUsecase delete)
      : _loggedIn = loggedIn,
        _delete = delete,
        super(CheckloggedinInitial()) {
    on<CheckloggedinEvent>((event, emit) {
      final result = _loggedIn(NoParam());
      if (result == true) {
        emit(CheckloggedinLoaded(true));
      } else {
        emit(CheckloggedinLoaded(false));
      }
    });

    on<LoggedOut>((event, emit) async {
      final response = await _delete(NoParam());
      response.fold(
          (l) => CheckloggedinError(l), (r) => CheckloggedinLoaded(false));
    });
  }
}
