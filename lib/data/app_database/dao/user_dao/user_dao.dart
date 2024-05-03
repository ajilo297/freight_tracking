/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';
import 'package:freight_tracking/db_barrel.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [User])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  Future<UserData?> create(UserData userData) async {
    return await into(user).insertReturningOrNull(
      userData,
      mode: InsertMode.insertOrIgnore,
    );
  }

  Future<UserData?> readUserByCredentials(String email, String hashedPassword) async {
    final query = select(user)
      ..where(
        (u) => u.email.equals(email) & u.hashedPassword.equals(hashedPassword),
      );
    return query.getSingleOrNull();
  }

  Future<UserData?> readCurrentLoggedInUser() async {
    final query = select(user)..where((u) => u.isLoggedIn.equals(true));
    return query.getSingleOrNull();
  }

  Future<void> updateUser(UserData userData) async {
    await update(user).replace(userData);
  }
}
