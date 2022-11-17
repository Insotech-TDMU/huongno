import 'package:dio/dio.dart';
import 'package:huongno/constant/api_mapping.dart';
import 'package:huongno/constant/app_secure_storage.dart';
import 'package:huongno/data/dio_base.dart';
import 'package:huongno/model/filebook.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileBookData extends DioBase{

  Future<dynamic> getAllBrief() async{
    String token = await AppStorage.getUserToken();
    final response = await dio.get(APIMapping.getListNormalBrief,
        options: Options(headers:
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }
        )
    );
    if(response.statusCode == 200){
      return response.data[1]['contents'];
    }
    throw response.statusMessage ?? 'Exception';

  }
  Future<dynamic> searchFile() async{
    String token = await AppStorage.getUserToken();
    final response = await dio.get(APIMapping.getListNormalBrief,
        options: Options(headers:
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }
        )
    );
    if(response.statusCode == 200){
      return response.data[1]['contents'];
    }
    throw response.statusMessage ?? 'Exception';

  }
}