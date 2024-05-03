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

  test('User is created with credentials', () async {
    final userDao = appDatabase.userDao;
    await userDao.createUser(user);
    final userFromDb = await userDao.readUserByCredentials('email', 'hashedPassword');
    expect(userFromDb, user);
  });

  test('User with same email ID cannot be created', () async {
    final userDao = appDatabase.userDao;
    await userDao.createUser(user);
    final userFromDb = await userDao.readUserByCredentials('email', 'hashedPassword');
    expect(userFromDb, user);

    expectLater(
      userDao.createUser(user.copyWith(hashedPassword: 'newHashedPassword')),
      throwsException,
    );
  });

  test('User login with correct credentials returns UserData with isLoggedIn true', () async {
    final userDao = appDatabase.userDao;
    await userDao.createUser(user);
    final userFromDb = await userDao.loginWithCredentials('email', 'hashedPassword');
    expect(userFromDb, user.copyWith(isLoggedIn: true));
  });

  test('User login with incorrect credentials returns null', () async {
    final userDao = appDatabase.userDao;
    await userDao.createUser(user);

    expectLater(
      userDao.loginWithCredentials('email', 'wrongPassword'),
      throwsA(const InvalidCredentialsException()),
    );
  });
}
