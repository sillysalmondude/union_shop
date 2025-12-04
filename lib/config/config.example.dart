class Config {
  static const String mongoUsername = 'your_username';
  static const String mongoPassword = 'your_password';
  static const String mongoHost = 'your_host';
  static const String mongoPort = '27017';
  static const String mongoDatabase = 'your_database';

  static String get mongoConnectionString =>
      'mongodb://$mongoUsername:$mongoPassword@$mongoHost:$mongoPort/$mongoDatabase';
}
