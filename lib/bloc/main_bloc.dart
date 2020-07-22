import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_bloc_event.dart';
part 'main_bloc_state.dart';

class MainBloc extends Bloc<MainBlocEvent, MainBlocState> {
  MainBloc() : super(InitialState());

  @override
  Stream<MainBlocState> mapEventToState(
    MainBlocEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is LogInEvent) {
      //
      yield LoadingState();
      yield LogedState();
    } else if (event is LogOutEvent) {
      //
      yield LoadingState();
      yield NotLogedState();
    } else if (event is SigunUpEvent) {
      //
      yield LoadingState();
      yield LogedState();
    } else if (event is LoginInEvent) {
      //
      yield LoadingState();
      yield RegistrateringState();
    }
  }
}
