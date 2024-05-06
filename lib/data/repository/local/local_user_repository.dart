/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

final class LocalUserRepository implements UserRepository {
  const LocalUserRepository(this.appDatabase);

  final AppDatabase appDatabase;

  @override
  Future<UserEntity?> create({
    required String email,
    required String name,
    required String hashedPassword,
  }) async {
    final user = await appDatabase.userDao.create(
      UserData(
        email: email,
        hashedPassword: hashedPassword,
        name: name,
        isLoggedIn: true,
      ),
    );

    if (user == null) throw const UserWithEmailExistsException();

    return UserEntity(
      email: user.email,
      hashedPassword: user.hashedPassword,
      name: user.name,
    );
  }

  @override
  Future<UserEntity?> readLoggedInUser() async {
    final user = await appDatabase.userDao.readCurrentLoggedInUser();

    if (user == null) return null;

    return UserEntity(
      email: user.email,
      hashedPassword: user.hashedPassword,
      name: user.name,
    );
  }

  @override
  Future<UserEntity?> readByCredentials({
    required String email,
    required String hashedPassword,
  }) async {
    final user = await appDatabase.userDao.readUserByCredentials(
      email,
      hashedPassword,
    );

    if (user == null) throw const InvalidCredentialsException();

    await appDatabase.userDao.updateUser(user.copyWith(isLoggedIn: true));

    return UserEntity(
      email: user.email,
      hashedPassword: user.hashedPassword,
      name: user.name,
    );
  }

  @override
  Future<void> logout() async {
    final user = await appDatabase.userDao.readCurrentLoggedInUser();

    if (user == null) return;

    await appDatabase.userDao.updateUser(user.copyWith(isLoggedIn: false));
  }
}
