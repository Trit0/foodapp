class Environment {
  static late EnvironmentConfig _config;

  static void setEnvironment(EnvironmentConfig environmentConfig) {
    Environment._config = environmentConfig;
  }

  static String get apiUrl => _config.apiUrl;
}

class EnvironmentConfig {
  final String apiUrl;

  const EnvironmentConfig({
    required this.apiUrl,
  });
}
