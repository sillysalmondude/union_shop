import 'package:mongo_dart/mongo_dart.dart';

class DB {
  static Db? _db;

  static Future<void> connect(String connectionString) async {
    if (_db != null) return;

    _db = await Db.create(connectionString);
    await _db!.open();
  }

  static DbCollection collection(String name) {
    return _db!.collection(name);
  }

  static Future<void> close() async {
    await _db?.close();
  }
}
