import 'package:mongo_dart/mongo_dart.dart';

class MongoDB {
  static Db? _db;
  static bool _isConnected = false;

  static Future<void> connect(String connectionString) async {
    try {
      _db = await Db.create(connectionString);
      await _db!.open();
      _isConnected = true;
      print('Connected to MongoDB');
    } catch (e) {
      print('Error connecting to MongoDB: $e');
      _isConnected = false;
    }
  }

  // Get db instance
  static Db? get database => _db;

  static bool get isConnected => _isConnected;

  static Future<void> close() async {
    if (_db != null) {
      await _db!.close();
      _isConnected = false;
      print('MongoDB connection closed');
    }
  }
}
