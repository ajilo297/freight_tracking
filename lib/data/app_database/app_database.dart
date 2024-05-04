/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart' show User, UserDao, Freight, FreightDao, FreightStatus;
import 'package:freight_tracking/db_barrel.dart';

export 'app_database_exceptions.dart';
export 'dao/dao.dart';
export 'table/table.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [User, Freight],
  daos: [UserDao, FreightDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? queryExecutor]) : super(queryExecutor ?? _openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachePath = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachePath;

    return NativeDatabase.createInBackground(file);
  });
}
