class Env {
  static const String apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://www.themealdb.com/api/json/v1/1/',
  );
}
