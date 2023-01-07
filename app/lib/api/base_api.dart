import 'package:dio/dio.dart';

class BaseApi {
  late Dio http;
  late String baseUrl;

  BaseApi(this.http, String path) {
    baseUrl = "http://10.0.2.2:3000/$path";
  }

  // ignore: avoid_init_to_null
  String url({String? path}) {
    return path != null ? "$baseUrl/$path" : baseUrl;
  }
}
