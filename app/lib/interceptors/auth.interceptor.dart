import "package:dio/dio.dart";
import 'package:foodapp/environment.dart';

class AuthInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path.startsWith(Environment.apiUrl)) {
      // TODO: Insert token in request

      return handler.next(
        options.copyWith(
          headers: {
            ...options.headers,
            "Authorization": "Bearer <TOKEN>",
          },
        ),
      );
    }

    return handler.next(options);
  }
}
