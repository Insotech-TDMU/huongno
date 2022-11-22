part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable{
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationLoading extends AuthenticationState {
  const AuthenticationLoading();

  @override
  List<Object> get props => [];
}

class AuthenticationError extends AuthenticationState {
  const AuthenticationError(this.errorMessage);
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];
}

class AuthenticationSuccess extends AuthenticationState {
  const AuthenticationSuccess(this.userData);
  final User userData;

  @override
  List<Object> get props => [userData];
}


class RegisterSuccess extends AuthenticationState {
  const RegisterSuccess();
}
