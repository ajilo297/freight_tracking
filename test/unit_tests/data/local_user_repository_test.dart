/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';
import 'package:mocktail/mocktail.dart';

class MockUserDao extends Mock implements UserDao {}

class MockAppDatabase extends Mock implements AppDatabase {}

void main() {
  const user = UserEntity(
    email: 'email',
    hashedPassword: 'hashedPassword',
    name: 'name',
  );

  const userData = UserData(
    email: 'email',
    hashedPassword: 'hashedPassword',
    name: 'name',
    isLoggedIn: true,
  );

  final AppDatabase appDatabase = MockAppDatabase();
  final UserDao userDao = MockUserDao();

  group('Create', () {
    test('returns user entity when db returns user', () async {
      when(() => appDatabase.userDao).thenReturn(userDao);
      when(() => userDao.create(userData)).thenAnswer(
        (_) async => userData,
      );

      final localUserRepository = LocalUserRepository(appDatabase);
      final result = await localUserRepository.create(
        email: user.email,
        name: user.name,
        hashedPassword: user.hashedPassword,
      );

      expect(result, user);
    });

    test('does not return user entity when db returns null', () async {
      when(() => appDatabase.userDao).thenReturn(userDao);
      when(() => userDao.create(userData)).thenAnswer(
        (_) async => null,
      );

      final localUserRepository = LocalUserRepository(appDatabase);
      final result = await localUserRepository.create(
        email: user.email,
        name: user.name,
        hashedPassword: user.hashedPassword,
      );

      expect(result, null);
    });
  });

  group('ReadLoggedInUser', () {
    test('returns user entity when db returns user', () async {
      when(() => appDatabase.userDao).thenReturn(userDao);
      when(() => userDao.readCurrentLoggedInUser()).thenAnswer(
        (_) async => userData,
      );

      final localUserRepository = LocalUserRepository(appDatabase);
      final result = await localUserRepository.readLoggedInUser();

      expect(result, user);
    });

    test('does not return user entity when db returns null', () async {
      when(() => appDatabase.userDao).thenReturn(userDao);
      when(() => userDao.readCurrentLoggedInUser()).thenAnswer(
        (_) async => null,
      );

      final localUserRepository = LocalUserRepository(appDatabase);
      final result = await localUserRepository.readLoggedInUser();

      expect(result, null);
    });
  });

  group('ReadByCredentials', () {
    test('returns user entity when db returns user', () async {
      when(() => appDatabase.userDao).thenReturn(userDao);
      when(() => userDao.readUserByCredentials(user.email, user.hashedPassword)).thenAnswer(
        (_) async => userData,
      );
      when(() => userDao.updateUser(userData.copyWith(isLoggedIn: true))).thenAnswer(
        (_) async => userData,
      );

      final localUserRepository = LocalUserRepository(appDatabase);
      final result = await localUserRepository.readByCredentials(
        email: user.email,
        hashedPassword: user.hashedPassword,
      );

      expect(result, user);
    });

    test('does not return user entity when db returns null', () async {
      when(() => appDatabase.userDao).thenReturn(userDao);
      when(() => userDao.readUserByCredentials(user.email, user.hashedPassword)).thenAnswer(
        (_) async => null,
      );

      final localUserRepository = LocalUserRepository(appDatabase);
      final result = await localUserRepository.readByCredentials(
        email: user.email,
        hashedPassword: user.hashedPassword,
      );

      expect(result, null);
    });
  });

  group('Logout', () {
    test('fetches and updates current logged in user', () async {
      when(() => appDatabase.userDao).thenReturn(userDao);
      when(() => userDao.readCurrentLoggedInUser()).thenAnswer(
        (_) async => userData,
      );
      when(() => userDao.updateUser(userData.copyWith(isLoggedIn: false))).thenAnswer(
        (_) async {},
      );

      final localUserRepository = LocalUserRepository(appDatabase);
      await localUserRepository.logout();

      verify(() => userDao.updateUser(userData.copyWith(isLoggedIn: false))).called(1);
    });

    test('does not update user when db returns null', () async {
      when(() => appDatabase.userDao).thenReturn(userDao);
      when(() => userDao.readCurrentLoggedInUser()).thenAnswer(
        (_) async => null,
      );

      final localUserRepository = LocalUserRepository(appDatabase);
      await localUserRepository.logout();

      verifyNever(() => userDao.updateUser(userData.copyWith(isLoggedIn: false)));
    });
  });
}
