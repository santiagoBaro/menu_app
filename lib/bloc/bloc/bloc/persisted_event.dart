import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PersistedEvent extends Equatable {
  PersistedEvent([List props = const <dynamic>[]]) : super(props);
}

class LogInEvent extends PersistedEvent {}

class LoginInEvent extends PersistedEvent {}

class SigningUpEvent extends PersistedEvent {}

class LogOutEvent extends PersistedEvent {}

class SigunUpEvent extends PersistedEvent {}
