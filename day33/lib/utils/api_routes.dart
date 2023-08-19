class ApiRoutes {
  static const String baseUrl = 'http://52.79.115.43:8090/api/collections';
  static const String readUserList = '/users/records?sort=-created';
  static const String login = '/users/auth-with-password';
  static const String signup = '/users/records';
  static const String refresh = '/users/auth-refresh';

  static const String readSecrets = '/secrets/records?sort=-created';
  static const String upload = '/secrets/records';
}
