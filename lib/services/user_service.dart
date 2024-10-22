import 'package:dartomite/dtos/create_user_dto.dart';
import 'package:dartomite/dtos/response_user_dto.dart';
import 'package:dartomite/dtos/update_user_dto.dart';
import 'package:dartomite/repositories/user_repository.dart';

class UserService {
  final UserRepository userRepository;

  UserService(this.userRepository);

  Future<List<ResponseUserDto>> getAllUsers() {
    return userRepository.getAllUsers();
  }

  Future<ResponseUserDto?> getUserById(int id) {
    return userRepository.getUserById(id);
  }

  Future<ResponseUserDto> createUser(CreateUserDto userData) {
    return userRepository.createUser(userData);
  }

  Future<ResponseUserDto?> updateUser(int id, UpdateUserDto userData) {
    return userRepository.updateUser(id, userData);
  }

  Future<void> deleteUser(int id) {
    return userRepository.deleteUser(id);
  }
}
