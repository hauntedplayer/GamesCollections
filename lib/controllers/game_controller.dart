import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:games_colletions/database_helper.dart';
import 'package:games_colletions/repositories/game_repository.dart';
import '../models/game_model.dart';
import '../services/game_service.dart';

final gameControllerProvider =
    StateNotifierProvider<GameController, List<Game>>((ref) {
  final gameService = ref.read(gameServiceProvider);
  return GameController(gameService);
});

final gameServiceProvider = Provider<GameService>((ref) {
  final gameRepository = ref.read(gameRepositoryProvider);
  return GameService(gameRepository);
});

final gameRepositoryProvider = Provider<GameRepository>((ref) {
  final databaseHelper = ref.read(databaseHelperProvider);
  return GameRepository(databaseHelper);
});

final databaseHelperProvider = Provider((ref) => FirebaseHelper());

class GameController extends StateNotifier<List<Game>> {
  final GameService _gameService;

  GameController(this._gameService) : super([]);

  void searchGames(String query) async {
    final games = await _gameService.searchGames(query);
    state = games;
  }
}
