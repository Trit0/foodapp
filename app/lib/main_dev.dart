import 'package:foodapp/environment.dart';
import 'package:foodapp/main.delegate.dart';

void main() {
  Environment.setEnvironment(const EnvironmentConfig(apiUrl: "http://192.168.1.142:3000"));
  mainDelegate();
}