import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:huongno/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppStorage {
  AppStorage._();

  static const _storage = FlutterSecureStorage();


  static Future<void> saveUserAuthentication(User userModel) async {
    if (userModel.token != null) {
      await _storage.write(key: 'token', value: userModel.token);
      await _storage.write(key: 'isLogin', value: 'TRUE');
    }
  }

  static Future<String> getUserToken() async {
    final token = await _storage.read(key: 'token');

    return token ?? 'NO_TOKEN';
  }


  static Future<User> getUserInfo() async {
    final id = await _storage.read(key: 'userId');
    return User(
      id: int.parse(id ?? '0'),
      username: '',
      password: '',
    );
  }
  

}
