import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../database_helper.dart';
import '../models/user_model.dart';

class UserRepository {
  final FirebaseHelper _databaseHelper;

  UserRepository(this._databaseHelper);

  // Future<User?> loginUser(String username, String password) async {
  //   FirebaseHelper db = await _databaseHelper;
  //   List<Map<String, dynamic>> result = await db.query(
  //     'users',
  //     where: 'username = ? AND password = ?',
  //     whereArgs: [username, password],
  //   );
  //   if (result.isNotEmpty) {
  //     return UserModel.fromMap(result.first);
  //   }
  //   return null;
  // }

  Future<UserCredential?> registerUser(UserModel user) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<UserCredential?> loginUser(UserModel user) async{
      try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: user.email,
      password: user.password
    );
    return credential;
      } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
  return null;
  }
}
