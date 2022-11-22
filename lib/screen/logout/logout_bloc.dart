import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huongno/constant/app_secure_storage.dart';
import 'package:huongno/controller/user_controller.dart';
import 'package:huongno/screen/logout/logout_state.dart';

import 'logout_event.dart';




class LogoutBloc extends Bloc<LogOutEvent, LogOutState> {
  LogoutBloc() : super(const LogOutLoadingState()) {
    on<LogOutLoadedEvent>(_checkOut);
  }
  final UserController _userController = UserController();

  void _checkOut(
      LogOutLoadedEvent event,
      Emitter<LogOutState> emit,
      ) async {
    emit(const LogOutLoadingState());
    try {
      await _userController.logout();
      await AppStorage.clearUser();
      emit( const LogOutSuccess());
    } catch (ex) {
      emit( LogOutErrorState(ex.toString()));
    }
  }
}
