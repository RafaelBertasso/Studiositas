import 'package:dio/dio.dart';

class DioClient {
  static Dio get instance {
    return Dio(
      BaseOptions(
        baseUrl: 'http://192.168.15.74:5147/api',
        contentType: 'application/json',
      )
    );
  }
}