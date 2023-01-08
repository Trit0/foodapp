import 'package:dio/dio.dart';
import 'package:foodapp/environment.dart';

class BaseApi {
  late Dio http;
  late String baseUrl;

  BaseApi(this.http, String path) {
    String apiUrl = Environment.apiUrl;
    baseUrl = "$apiUrl/$path";
    http = Dio();
  }

  String url([String? path]) {
    return path != null ? "$baseUrl/$path" : baseUrl;
  }
}
