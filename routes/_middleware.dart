import 'package:dart_frog/dart_frog.dart';
import 'package:dartomite/database/database.dart';
import 'package:dartomite/repositories/group_repository.dart';
import 'package:dartomite/repositories/user_group_repository.dart';
import 'package:dartomite/repositories/user_repository.dart';
import 'package:dartomite/services/group_service.dart';
import 'package:dartomite/services/user_group_service.dart';
import 'package:dartomite/services/user_service.dart';

// Use singleton instances of repositories and services to reduce instantiation overhead
final db = AppDatabase();
final userRepository = UserRepository(db);
final groupRepository = GroupRepository(db);
final userGroupRepository = UserGroupRepository(db);

final userService = UserService(userRepository, userGroupRepository);
final userGroupService = UserGroupService(userGroupRepository);
final groupService = GroupService(groupRepository);

Handler middleware(Handler handler) {
  return handler
      .use(provider<UserService>((context) => userService))
      .use(provider<UserGroupService>((context) => userGroupService))
      .use(provider<GroupService>((context) => groupService))
      .use(provider<UserRepository>((context) => userRepository))
      .use(provider<UserGroupRepository>((context) => userGroupRepository))
      .use(provider<GroupRepository>((context) => groupRepository))
      .use(provider<AppDatabase>((context) => db));
}
