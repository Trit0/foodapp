import 'package:dio/dio.dart';

class BaseApi {
  late Dio http;
  late String baseUrl;

  BaseApi(String path) {
    baseUrl = "http://10.0.2.2:3000/$path";
    http = Dio();
  }

  // ignore: avoid_init_to_null
  String url({String? path}) {
    return path != null ? "$baseUrl/$path" : baseUrl;
  }
}
