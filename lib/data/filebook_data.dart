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

  Future<dynamic> updateFileBook(int id, String image1, String image2 , String image3) async{

    String token = await AppStorage.getUserToken();
    final response = await dio.post(APIMapping.updateImageNormalBrief,data: {
      'id' : id,
      'image1' : image1,
      'image2' : image2,
      'image3': image3,
    },
        options: Options(headers:
        {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }
        ));
    if(response.statusCode == 200){
      return response.data;
    } else {
      throw response.data;
    }
  }
}