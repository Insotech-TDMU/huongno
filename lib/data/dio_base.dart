import 'package:dio/dio.dart';
import 'package:huongno/constant/api_mapping.dart';

class DioBase {
  static final BaseOptions _options = BaseOptions(
    baseUrl: APIMapping.hostName,
    connectTimeout: 10000,
    receiveTimeout: 30000,
  );

  final Dio dio = Dio(_options);

}
