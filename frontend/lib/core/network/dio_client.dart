import 'package:dio/dio.dart';

class DioClient {
  static Dio get instance {
    return Dio(
      BaseOptions(
        baseUrl: 'http://10.0.2.2:5147/api',
        contentType: 'application/json',
      )
    );
  }
}