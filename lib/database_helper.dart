import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseHelper {
  static final FirebaseHelper _instance = FirebaseHelper._internal();
  static FirebaseDatabase? _database;

  factory FirebaseHelper() {
    return _instance;
  }

  FirebaseHelper._internal();

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    _database = FirebaseDatabase.instance;
  }

  // Referências para as tabelas (nós) no Firebase
  DatabaseReference get usersRef => _database!.ref('users');
  DatabaseReference get gamesRef => _database!.ref('games');

  // Exemplo de como adicionar um novo usuário
  Future<void> addUser(String username, String password) async {
    await usersRef.push().set({
      'username': username,
      'password': password,
    });
  }

  // Exemplo de como buscar todos os jogos
  Future<List<Map<String, dynamic>>> getGames() async {
    DataSnapshot snapshot = (await gamesRef.once()) as DataSnapshot;
    List<Map<String, dynamic>> games = [];
    snapshot.children.forEach((game) {
      games.add(game.value as Map<String, dynamic>);
    });
    return games;
  }

  query(String s, {required String where, required List<String> whereArgs}) {}

  // ... Implemente outras operações (atualizar, deletar, etc.)
}
