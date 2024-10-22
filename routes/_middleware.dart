import 'package:dart_frog/dart_frog.dart';
import 'package:dartomite/database/database.dart';
import 'package:dartomite/repositories/user_repository.dart';
import 'package:dartomite/services/user_service.dart';

final db = AppDatabase();
final userRepository = UserRepository(db);
final userService = UserService(userRepository);

Handler middleware(Handler handler) {
  return handler
      .use(provider<AppDatabase>((context) => db))
      .use(provider<UserRepository>((context) => userRepository))
      .use(provider<UserService>((context) => userService));
}
