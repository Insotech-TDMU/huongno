

import 'package:equatable/equatable.dart';

abstract class LogOutState extends Equatable{
  const LogOutState() ;

  @override
  List<Object?> get props => [];
}


class LogOutLoadingState extends LogOutState{
  const LogOutLoadingState();

}

class LogOutErrorState extends LogOutState{
  const LogOutErrorState(this.errorMessage);
  final String errorMessage;

  @override
  List<Object> get props => [errorMessage];


}

class LogOutLoadedState extends LogOutState{
  const LogOutLoadedState();
}

class LogOutSuccess extends LogOutState{
  const LogOutSuccess();
  @override
  List<Object?> get props => [];
}
