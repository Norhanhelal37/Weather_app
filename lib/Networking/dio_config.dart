import 'package:dio/dio.dart';

class DioConfig {
  DioConfig._();

  static Dio? _dio;

  static Dio getData() {
    _dio ??= Dio()
      ..options.baseUrl =
          "http://api.weatherapi.com/v1/forecast.json?key=59b2e9e651254459ad3162606242906&"
      // ..options.receiveTimeout = Duration(seconds: 7)
      // ..options.connectTimeout = Duration(seconds: 7)
      ..interceptors
          .add(LogInterceptor(error: true, request: true));
    return _dio!;
  }
}
