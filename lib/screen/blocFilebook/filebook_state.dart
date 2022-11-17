part of 'filebook_bloc.dart';

abstract class FileBookState extends Equatable{
  const FileBookState();

  @override
  List<Object?> get props => [];
}


class FileBookLoadingState extends FileBookState{
  const FileBookLoadingState();
}

class FileBookLoadedState extends FileBookState{
  final List<FileBook> filebook;
  const FileBookLoadedState(this.filebook);
}

class FileBookSuccess extends FileBookState{
  const FileBookSuccess();

  @override
  List<Object?> get props => [];
}

