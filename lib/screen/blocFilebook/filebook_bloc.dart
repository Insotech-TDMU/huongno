import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:huongno/controller/filebook_controller.dart';
import 'package:huongno/model/filebook.dart';
import 'package:meta/meta.dart';

part 'filebook_event.dart';
part 'filebook_state.dart';

class FileBookBloc extends Bloc<FileBookEvent, FileBookState> {
  FileBookBloc() : super(const FileBookLoadingState()) {
    on<getAllFileBookEvent>(_getAllFileBook);

  }
  final FileBookController bookController = FileBookController();

  void _getAllFileBook(getAllFileBookEvent event , Emitter<FileBookState> emit) async{
    try{
      final result = await bookController.getBrief();
      emit(FileBookLoadedState(result));
    }catch(ex){
      print(ex.toString() + 'Loi ');
    }
  }
}
