import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/failure/Failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecase/get_sources.dart';

part 'source_event.dart';
part 'source_state.dart';

class SourceBloc extends Bloc<SourceEvent, SourceState> {
  final GetSourcesDetails _getSourcesDetails;

  SourceBloc({required GetSourcesDetails getSourcesDetails})
      : _getSourcesDetails = getSourcesDetails,
        super(SourceInitial()) {
    on<SourceEvent>((event, emit) {
      emit(SourceLoading());
    });
    on<GetSources>(_onGetSources);
  }
  void _onGetSources(GetSources event, Emitter<SourceState> emit) async {
    final result = await _getSourcesDetails(NoParam());
    result.fold((l) => emit(SourceFailure(l)), (r) => emit(SourceLoaded(r)));
  }
}
