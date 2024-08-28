import '../database_helper.dart';
import '../models/game_model.dart';

class GameRepository {
  final FirebaseHelper _databaseHelper;

  GameRepository(this._databaseHelper);

  Future<List<Game>> searchGames(String query) async {
    FirebaseHelper db = _databaseHelper;
    List<Map<String, dynamic>> result = await db.query(
      'games',
      where: 'name LIKE ?',
      whereArgs: ['%$query%'],
    );
    return result.map((game) => Game.fromMap(game)).toList();
  }
}
