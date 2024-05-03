/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/db_barrel.dart';

class User extends Table {
  TextColumn get email => text()();

  TextColumn get hashedPassword => text()();

  TextColumn get name => text()();

  BoolColumn get isLoggedIn => boolean().withDefault(const Constant(false))();

  @override
  Set<Column<Object>>? get primaryKey => {email};
}
