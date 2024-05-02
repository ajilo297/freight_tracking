/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';
import 'package:freight_tracking/db_barrel.dart';

part 'user_dao.g.dart';

@DriftAccessor(tables: [User])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(super.db);

  /// Inserts a new user into the database.
  Future<int> createUser(UserData userData) async {
    return into(user).insert(userData);
  }

  /// Returns the user data if the user is successfully logged in, otherwise null.
  @visibleForTesting
  Future<UserData?> readUserByCredentials(String email, String hashedPassword) async {
    final query = select(user)
      ..where((u) {
        return u.email.equals(email) & u.hashedPassword.equals(hashedPassword);
      });

    UserData? userData;
    try {
      userData = await query.getSingle();
    } catch (_) {
      // no-op
    }

    return userData;
  }

  /// Returns the user data if the user is successfully logged in, otherwise null.
  Future<UserData?> loginWithCredentials(String email, String hashedPassword) async {
    final userData = await readUserByCredentials(email, hashedPassword);

    if (userData == null) return null;

    final statement = update(user)
      ..where((t) {
        return t.email.equals(email) & t.hashedPassword.equals(hashedPassword);
      });

    await statement.write(const UserCompanion(isLoggedIn: Value(true)));
    return await readUserByCredentials(email, hashedPassword);
  }
}
