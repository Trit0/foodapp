import 'package:dio/dio.dart';

class BaseApi {
  late Dio http;
  late String baseUrl;

  BaseApi(String path) {
    baseUrl = "http://localhost:3000/$path";
    http = Dio();
  }

  // ignore: avoid_init_to_null
  String url({ String? path = null }) {
    return path != null ? "$baseUrl/$path" : baseUrl;
  }
}
