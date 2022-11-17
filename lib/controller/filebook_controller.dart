
import 'package:huongno/data/filebook_data.dart';
import 'package:huongno/model/filebook.dart';

class FileBookController{
  final FileBookData _briefData = FileBookData();

  Future<List<FileBook>> getBrief() async{
    try{
      final List<dynamic> result = await _briefData.getAllBrief();
      return List<FileBook>.from(result.map((e) => FileBook.fromMap(e)));
    }catch(ex, t){
      print(t);
    }
    throw '';
  }

  Future<List<FileBook>> searchFileBook(String query) async{
    try{
      final List<dynamic> result = await _briefData.searchFile();
      return  List<FileBook>.from(result.map((e) => FileBook.fromMap(e)).where((filebook){
        final phone = filebook.customer!.phone!.toLowerCase();
        final searchFileBook = query.toLowerCase();
        return phone.contains(searchFileBook);
      }));
    }
    catch(ex){
      print(ex.toString());
    }
    throw '';
  }

}