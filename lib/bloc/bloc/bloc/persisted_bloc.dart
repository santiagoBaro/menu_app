import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'persisted_event.dart';
import 'persisted_state.dart';

class PersistedBloc extends HydratedBloc<PersistedEvent, PersistedState> {
  @override
  PersistedState get initialState {
    return super.initialState ?? InitialState();
  }

  @override
  Stream<PersistedState> mapEventToState(
    PersistedEvent event,
  ) async* {
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

  @override
  PersistedState fromJson(Map<String, dynamic> json) {
    try {
      // final state = User.fromJson(json);
      // return LogedState(state, lightTheme);
      //return LogedState(state, darkTheme);
      return null;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(PersistedState state) {
    if (state is LogedState) {
      //return state.user.toJson();
      return null;
    } else {
      return null;
    }
  }
}
