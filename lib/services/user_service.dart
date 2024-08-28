import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserService {
  final UserRepository _userRepository;

  UserService(this._userRepository);

  Future<User?> loginUser(String username, String password) {
    return _userRepository.loginUser(username, password);
  }

  Future<void> registerUser(User user) {
    
    return _userRepository.registerUser(user);
  }
}
