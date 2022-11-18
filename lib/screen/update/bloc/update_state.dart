part of 'update_bloc.dart';

abstract class UpdateState extends Equatable{
  const UpdateState();

  @override
  List<Object?> get props => [];
}


class UpdateLoadingState extends UpdateState{
  const UpdateLoadingState();

}

class UpdateErrorState extends UpdateState{
  const UpdateErrorState();

}

class UpdateLoadedState extends UpdateState{
  const UpdateLoadedState();
}

class UpdateSuccessState extends UpdateState{
  const UpdateSuccessState();
  @override
  List<Object?> get props => [];
}
