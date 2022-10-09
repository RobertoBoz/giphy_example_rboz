import 'package:dio/dio.dart';
import 'package:flutter_example_test/app/data/env.dart';

class ApiInterceptor extends QueuedInterceptor {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {

    options.queryParameters.addAll({'api_key': Env.api});
    handler.next(options);
  }
}
