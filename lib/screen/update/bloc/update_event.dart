part of 'update_bloc.dart';


abstract class UpdateEvent extends  Equatable{
  const UpdateEvent();
  @override
  List<Object?> get props => [];
}

class UpdateLoadingEvent extends UpdateEvent{
  const UpdateLoadingEvent();
  @override
  List<Object?> get props => [];
}

class UpdateLoadedEvent extends UpdateEvent{
  final int id;
  final String image1;
  final String image2;
  final String image3;
  const UpdateLoadedEvent(this.id, this.image1,this.image2,this.image3);

  @override
  List<Object?> get props => [];
}
