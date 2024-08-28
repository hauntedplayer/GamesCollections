import '../models/game_model.dart';
import '../repositories/game_repository.dart';

class GameService {
  final GameRepository _gameRepository;

  GameService(this._gameRepository);

  Future<List<Game>> searchGames(String query) {
    return _gameRepository.searchGames(query);
  }
}
