/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';
import 'package:mocktail/mocktail.dart';

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  const user = UserEntity(
    email: 'email',
    hashedPassword: 'hashedPassword',
    name: 'name',
  );
  UserRepository userRepository = MockUserRepository();

  group('AutoLogin', () {
    test('returns user when user repository returns signed in user', () async {
      when(
        () => userRepository.readLoggedInUser(),
      ).thenAnswer((_) async => user);

      final authUseCase = AuthUseCase(userRepository);
      final result = await authUseCase.autoLogin();

      expect(result, user);
    });

    test('does not return a user when user repository returns null', () async {
      when(
        () => userRepository.readLoggedInUser(),
      ).thenAnswer((_) async => null);

      final authUseCase = AuthUseCase(userRepository);
      final result = await authUseCase.autoLogin();

      expect(result, null);
    });
  });

  group('Login', () {
    test('returns user when logging in with correct credentials', () async {
      when(() => userRepository.readByCredentials(
            email: 'email',
            hashedPassword: 'hashedPassword',
          )).thenAnswer((_) async => user);

      final authUseCase = AuthUseCase(userRepository);
      final result = await authUseCase.login(
        'email',
        'hashedPassword',
      );

      expect(result, user);
    });

    test('does not return a user when logging in with incorrect credentials', () async {
      when(() => userRepository.readByCredentials(
            email: 'email',
            hashedPassword: 'hashedPassword',
          )).thenThrow(const InvalidCredentialsException());

      final authUseCase = AuthUseCase(userRepository);

      expectLater(
        authUseCase.login(user.email, user.hashedPassword),
        throwsA(isA<InvalidCredentialsException>()),
      );
    });
  });

  group('Register', () {
    test('returns user when registering with correct credentials', () async {
      when(() => userRepository.create(
            email: 'email',
            name: 'name',
            hashedPassword: 'hashedPassword',
          )).thenAnswer((_) async => user);

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
          )).thenThrow(const UserWithEmailExistsException());

      final authUseCase = AuthUseCase(userRepository);

      expectLater(
        authUseCase.register(
          'email',
          'name',
          'hashedPassword',
        ),
        throwsA(isA<UserWithEmailExistsException>()),
      );
    });
  });

  group('Logout', () {
    test('logs out user when user is logged in', () async {
      when(() => userRepository.logout()).thenAnswer((_) async {});

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
