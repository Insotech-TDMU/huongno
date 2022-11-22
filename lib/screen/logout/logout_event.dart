


import 'package:equatable/equatable.dart';

abstract class LogOutEvent extends  Equatable{
  const LogOutEvent();
  @override
  List<Object?> get props => [];
}

class LogOutLoadingEvent extends LogOutEvent{
  const LogOutLoadingEvent();
  @override
  List<Object?> get props => [];
}

class LogOutLoadedEvent extends LogOutEvent{
  const LogOutLoadedEvent();

  @override
  List<Object?> get props => [];
}
