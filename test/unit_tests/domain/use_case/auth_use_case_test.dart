/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository<UserEntity> {}

void main() {
  const user = UserEntity(
    email: 'email',
    hashedPassword: 'hashedPassword',
    name: 'name',
  );
  UserRepository<UserEntity> userRepository = MockUserRepository();

  group('AutoLogin', () {
    test('returns user when user repository returns signed in user', () async {
      when(
        () => userRepository.getCurrentLoggedInUser(),
      ).thenAnswer((_) async => user);

      final authUseCase = AuthUseCase(userRepository);
      final result = await authUseCase.autoLogin();

      expect(result, user);
    });

    test('does not return a user when user repository returns null', () async {
      when(
        () => userRepository.getCurrentLoggedInUser(),
      ).thenAnswer((_) async => null);

      final authUseCase = AuthUseCase(userRepository);
      final result = await authUseCase.autoLogin();

      expect(result, null);
    });
  });

  group('Login', () {
    test('returns user when logging in with correct credentials', () async {
      when(() => userRepository.readUserByCredentials(
            email: 'email',
            hashedPassword: 'hashedPassword',
          )).thenAnswer((_) async => user);

      when(() => userRepository.updateUserLoggedInStatus(user)).thenAnswer(
        (_) async {},
      );

      final authUseCase = AuthUseCase(userRepository);
      final result = await authUseCase.login(
        'email',
        'hashedPassword',
      );

      expect(result, user);
    });

    test('does not return a user when logging in with incorrect credentials', () async {
      when(() => userRepository.readUserByCredentials(
            email: 'email',
            hashedPassword: 'hashedPassword',
          )).thenAnswer((_) async => null);

      final authUseCase = AuthUseCase(userRepository);
      final result = await authUseCase.login(user.email, user.hashedPassword);

      expect(result, null);
    });
  });

  group('Register', () {
    test('returns user when registering with correct credentials', () async {
      when(() => userRepository.create(
            email: 'email',
            name: 'name',
            hashedPassword: 'hashedPassword',
          )).thenAnswer((_) async => user);

      when(() => userRepository.updateUserLoggedInStatus(
            user,
            isLoggedIn: true,
          )).thenAnswer((_) async {});

      final authUseCase = AuthUseCase(userRepository);
      final result = await authUseCase.register(
        'email',
        'name',
        'hashedPassword',
      );

      expect(result, user);
    });

    test('does not return a user when registering with incorrect credentials', () async {
      when(() => userRepository.create(
            email: 'email',
            name: 'name',
            hashedPassword: 'hashedPassword',
          )).thenAnswer((_) async => null);

      final authUseCase = AuthUseCase(userRepository);
      final result = await authUseCase.register(
        'email',
        'name',
        'hashedPassword',
      );

      expect(result, null);
    });
  });

  group('Logout', () {
    test('logs out user when user is logged in', () async {
      when(() => userRepository.getCurrentLoggedInUser()).thenAnswer((_) async => user);

      when(() => userRepository.updateUserLoggedInStatus(
            user,
            isLoggedIn: false,
          )).thenAnswer((_) async {});

      final authUseCase = AuthUseCase(userRepository);
      await authUseCase.logout();
    });

    test('does not log out user when user is not logged in', () async {
      when(() => userRepository.getCurrentLoggedInUser()).thenAnswer((_) async => null);

      final authUseCase = AuthUseCase(userRepository);
      await authUseCase.logout();
    });
  });

  group('GetHashedPassword', () {
    test('returns hashed password', () {
      final authUseCase = AuthUseCase(userRepository);
      final hashedPassword = authUseCase.getHashedPassword('password');
      const expectedHashedPassword = '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8';

      expect(hashedPassword, expectedHashedPassword);
    });
  });
}
