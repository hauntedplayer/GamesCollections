import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import '../models/user_model.dart';
import '../database_helper.dart';

class UserRepository {
  final FirebaseHelper _databaseHelper;

  UserRepository(this._databaseHelper);

  Future<User?> loginUser(String username, String password) async {
    FirebaseHelper db = await _databaseHelper;
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, password],
    );
    if (result.isNotEmpty) {
      return User.fromMap(result.first);
    }
    return null;
  }

  Future<void> registerUser(User user) async {
    FirebaseHelper db = await _databaseHelper;
    return await db.addUser(user.username, user.password);
  }
}
