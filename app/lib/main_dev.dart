import 'package:foodapp/environment.dart';
import 'package:foodapp/main.delegate.dart';

void main() {
  Environment.setEnvironment(EnvironmentConfig(apiUrl: "https://localhost:8080"));
  mainDelegate();
}