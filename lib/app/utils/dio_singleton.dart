import 'package:dio/dio.dart';
import 'package:flutter_example_test/app/data/interceptor/api_interceptor.dart';

class DioSingleton {
  factory DioSingleton() {
    _instance ??= DioSingleton._();
    return _instance!;
  }

  DioSingleton._();

  static DioSingleton? _instance;

  static late final Dio dio;

  static void createDio() {
      dio = Dio(
        BaseOptions(
          baseUrl: 'https://api.giphy.com/v1/gifs/',
          receiveTimeout: 15000, 
          connectTimeout: 15000,
          sendTimeout: 15000,
          contentType: 'application/json',
        ),
      );
      dio.interceptors.add(ApiInterceptor());
  }
}
