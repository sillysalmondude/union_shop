import '../utils/db.dart';
import '../config/config.dart';

class AccountService {
  static Future<bool> register(String email, String password) async {
    await DB.connect(Config.mongoConnectionString);

    var users = DB.collection('users');

    var existingUser = await users.findOne({'email': email});
    if (existingUser != null) {
      return false;
    }

    await users.insertOne({
      'email': email,
      'password': password,
    });

    return true;
  }

  static Future<bool> login(String email, String password) async {
    await DB.connect(Config.mongoConnectionString);

    var users = DB.collection('users');

    var user = await users.findOne({
      'email': email,
      'password': password,
    });

    return user != null;
  }
}
