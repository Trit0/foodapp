import 'package:foodapp/environment.dart';
import 'package:foodapp/main.delegate.dart';

void main() {
  Environment.setEnvironment(const EnvironmentConfig(apiUrl: "http://10.0.2.2:8080"));
  mainDelegate();
}
