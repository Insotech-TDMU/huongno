import 'package:dio/dio.dart';
import 'package:huongno/data/user_data.dart';
import 'package:huongno/model/user.dart';

class UserController{
  final UserData _userData = UserData();
  Future<User> loginUser(String username, String password) async {
    try {
      final result = await _userData.userAccountLogin(username, password);
      return User.fromMap(result);
    } on DioError catch (ex) {
      if (ex.response != null) {
        throw ex.response!.statusCode.toString();
      } else {
        throw 'AppErrorCode.serverUnreachable';
      }
    } catch (ex) {
      print(ex);
      rethrow;
    }
  }
  Future<void> logout() async {
    try {
      await _userData.logout();
    } on DioError catch (ex) {
      if (ex.response != null) {
        throw ex.response!.statusCode.toString();
      } else {
        throw 'AppErrorCode.serverUnreachable';
      }
    } catch (ex) {
      rethrow;
    }
  }

}