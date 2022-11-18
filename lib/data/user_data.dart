import 'package:dio/dio.dart';
import 'package:huongno/constant/api_mapping.dart';
import 'package:huongno/constant/app_secure_storage.dart';
import 'package:huongno/data/dio_base.dart';

class UserData extends DioBase{
  Future<dynamic> userAccountLogin(String username, String password) async {
    final response = await super.dio.post(APIMapping.login, data: {
      'username': username,
      'password': password,
    });

    print(response.data);

    if (response.statusCode == 200) {
      if (response.data['status'] == 200) {
        return response.data;
      } else {
        throw (response.data['status']);
      }
    }

    throw 'AppErrorCode.serverInternal';
  }

  Future<dynamic> logout() async{
    String token = await AppStorage.getUserToken();
    final response = await dio.get(APIMapping.logout,
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