import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PersistedState extends Equatable {
  PersistedState([List props = const []]) : super(props);
}

class InitialState extends PersistedState {}

class LoadingState extends PersistedState {}

class RegistrateringState extends PersistedState {}

class NotLogedState extends PersistedState {}

class LogedState extends PersistedState {}
