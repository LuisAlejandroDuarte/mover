class EnvironmentConfig {
  static String get apiUrl {
    const environment = String.fromEnvironment('ENVIRONMENT', defaultValue: 'dev');
    switch (environment) {
      case 'prod':
        return 'http://api.example.com';
      case 'test':
        return 'http://test-api.example.com';
      default:
        return 'http://dev-api.example.com';
    }
  }
}
