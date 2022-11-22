import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huongno/constant/app_secure_storage.dart';
import 'package:huongno/controller/user_controller.dart';
import 'package:huongno/model/user.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';


class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>{
  AuthenticationBloc() : super(const AuthenticationLoading()) {
    on<GetLoginAccountEvent>(_onLoginUser);

  }

  final UserController _userController = UserController();

  void _onLoginUser(
      GetLoginAccountEvent event,
      Emitter<AuthenticationState> emit,
      ) async {
    emit(const AuthenticationLoading());
    try {

      final User user = await _userController.loginUser(
        event.username,
        event.password,
      );
      await AppStorage.saveUserAuthentication(user);
      emit(AuthenticationSuccess(user));
    } catch (ex) {
      emit(AuthenticationError(ex.toString()));
    }
  }

}
