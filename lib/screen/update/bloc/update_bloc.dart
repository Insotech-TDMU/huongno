import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:huongno/controller/filebook_controller.dart';
import 'package:huongno/model/filebook.dart';
import 'package:meta/meta.dart';

part 'update_event.dart';
part 'update_state.dart';

class UpdateBloc extends Bloc<UpdateEvent, UpdateState> {
  UpdateBloc() : super(const UpdateLoadingState()) {
    on<UpdateLoadedEvent>(_updateFileBook);
  }
  final FileBookController _fileBookController = FileBookController();
  void _updateFileBook(
      UpdateLoadedEvent event,
      Emitter<UpdateState> emit,
      ) async {
    emit(const UpdateLoadingState());
    try {
      await _fileBookController.updateFileBook(
        event.id,
        event.image1,
        event.image2,
        event.image3,
      );
      emit( const UpdateSuccessState());
    } catch (ex) {
     emit(const UpdateErrorState());
    }
  }
}
