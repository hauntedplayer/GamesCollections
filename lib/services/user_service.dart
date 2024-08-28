import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserService {
  final UserRepository _userRepository;

  UserService(this._userRepository);

  Future<UserCredential?> loginUser(UserModel user) {
    return _userRepository.loginUser(user);
  }

  Future<UserCredential?> registerUser(UserModel user) {
    
    return _userRepository.registerUser(user);
  }
}
