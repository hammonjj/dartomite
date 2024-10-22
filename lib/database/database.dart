import 'dart:io';

import 'package:dartomite/database/groups.dart';
import 'package:dartomite/database/user_groups.dart';
import 'package:dartomite/database/users.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    return NativeDatabase(File(p.join(Directory.current.path, 'dartomite.db')));
  });
}

@DriftDatabase(
  tables: [Users, UserGroups, Groups],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
