import "package:dio/dio.dart";

class LangInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    return handler.next(
      options.copyWith(
        headers: {
          ...options.headers,
          "Accept-Language": "fr",
        },
      ),
    );
  }
}
