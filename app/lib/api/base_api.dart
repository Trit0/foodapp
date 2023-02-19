import 'package:dio/dio.dart';
import 'package:foodapp/environment.dart';

class BaseApi {
  final Dio http;
  late final String baseUrl;

  BaseApi(this.http, String path) {
    String apiUrl = Environment.apiUrl;
    baseUrl = "$apiUrl/$path";
  }

  String url([String? path]) {
    return path != null ? "$baseUrl/$path" : baseUrl;
  }
}
