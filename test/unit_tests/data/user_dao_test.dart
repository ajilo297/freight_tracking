/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';
import 'package:freight_tracking/db_barrel.dart';

void main() {
  const user = UserData(
    email: 'email',
    hashedPassword: 'hashedPassword',
    name: 'name',
    isLoggedIn: false,
  );

  late AppDatabase appDatabase;

  setUp(() {
    appDatabase = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await appDatabase.close();
  });

  group('Create', () {
    test('Create user', () async {
      final userDao = UserDao(appDatabase);
      final createdUser = await userDao.create(user);
      expect(createdUser, user);
    });

    test('Create user with same email does not create', () async {
      final userDao = UserDao(appDatabase);
      await userDao.create(user);
      final createdUser = await userDao.create(user);
      expect(createdUser, null);
    });
  });

  group('Read user by credentials', () {
    test('Read user by credentials', () async {
      final userDao = UserDao(appDatabase);
      await userDao.create(user);
      final readUser = await userDao.readUserByCredentials(user.email, user.hashedPassword);
      expect(readUser, user);
    });

    test('Read user by credentials with wrong password', () async {
      final userDao = UserDao(appDatabase);
      await userDao.create(user);
      final readUser = await userDao.readUserByCredentials(user.email, 'wrongPassword');
      expect(readUser, null);
    });

    test('Read user by credentials with wrong email', () async {
      final userDao = UserDao(appDatabase);
      await userDao.create(user);
      final readUser = await userDao.readUserByCredentials('wrongEmail', user.hashedPassword);
      expect(readUser, null);
    });
  });

  group('Read current logged in user', () {
    test('Read current logged in user', () async {
      final userDao = UserDao(appDatabase);
      await userDao.create(user);
      final readUser = await userDao.readCurrentLoggedInUser();
      expect(readUser, null);
    });

    test('Read current logged in user after login', () async {
      final userDao = UserDao(appDatabase);
      await userDao.create(user.copyWith(isLoggedIn: true));
      final readUser = await userDao.readCurrentLoggedInUser();
      expect(readUser, isA<UserData>().having((u) => u.isLoggedIn, 'isLoggedIn', true));
    });
  });

  group('Update user', () {
    test('Update user', () async {
      final userDao = UserDao(appDatabase);
      await userDao.create(user);
      final updatedUser = user.copyWith(name: 'newName');
      await userDao.updateUser(updatedUser);
      final readUser = await userDao.readUserByCredentials(user.email, user.hashedPassword);
      expect(readUser, updatedUser);
    });
  });
}
