part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
  @override
  List<Object> get props => [];
}

class GetLoginAccountEvent extends AuthenticationEvent {
  const GetLoginAccountEvent(this.username, this.password);
  final String username;
  final String password;

  @override
  List<Object> get props => [];
}

class LogoutAccountEvent extends AuthenticationEvent {
  const LogoutAccountEvent();
}


class StaffRegisterAccountEvent extends AuthenticationEvent {
  const StaffRegisterAccountEvent(this.userData);
  final User userData;

  @override
  List<Object> get props => [];
}

class CustomerRegisterAccountEvent extends AuthenticationEvent {
  const CustomerRegisterAccountEvent(this.userData);
  final User userData;

  @override
  List<Object> get props => [];
}


