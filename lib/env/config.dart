class Config {
  Config({this.apiBaseUrl, this.flavorName});

  /// name environment that use when running or build the project
  final String? flavorName;

  /// api baseURL base on flavor name
  final String? apiBaseUrl;

  static Config? _instance;

  static Future<Config> getInstance(
      {String? flavorName, String? apiBaseUrl}) async {
    if (_instance == null) {
      _instance = Config(flavorName: flavorName, apiBaseUrl: apiBaseUrl);
      return _instance!;
    }
    return _instance!;
  }
}
