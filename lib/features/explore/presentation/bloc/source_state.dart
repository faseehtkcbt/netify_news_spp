part of 'source_bloc.dart';

abstract class SourceState {}

class SourceInitial extends SourceState {}

class SourceLoading extends SourceState {}

class SourceLoaded<SuccessType> extends SourceState {
  final List<SuccessType> data;
  SourceLoaded(this.data);
}

class SourceFailure extends SourceState {
  final Failures failures;
  SourceFailure(this.failures);
}
