/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthUseCase extends Mock implements AuthUseCase {}

void main() {
  const user = UserEntity(email: 'email', hashedPassword: 'hashedPassword', name: 'name');
  AuthUseCase useCase = MockAuthUseCase();

  blocTest(
    'Auto Login returns User when previously logged in',
    setUp: () => when(() => useCase.autoLogin()).thenAnswer((_) async => user),
    tearDown: () => reset(useCase),
    build: () => AuthCubit(useCase),
    act: (cubit) => cubit.autoLogin(),
    expect: () => [
      isA<AuthLoadingState>(),
      isA<AuthenticatedState>().having((s) => s.user, 'user', user),
    ],
  );

  blocTest(
    'Auto Login returns UnauthenticatedState when no user logged in',
    setUp: () => when(() => useCase.autoLogin()).thenAnswer((_) async => null),
    tearDown: () => reset(useCase),
    build: () => AuthCubit(useCase),
    act: (cubit) => cubit.autoLogin(),
    expect: () => [
      isA<AuthLoadingState>(),
      isA<UnauthenticatedState>(),
    ],
  );

  blocTest(
    'Login returns AuthenticatedState when user credentials are correct',
    build: () => AuthCubit(useCase),
    setUp: () {
      when(() => useCase.getHashedPassword('password')).thenAnswer(
        (_) async => 'hashedPassword',
      );
      when(() => useCase.login('email', 'hashedPassword')).thenAnswer(
        (_) async => user,
      );
    },
    tearDown: () => reset(useCase),
    act: (cubit) => cubit.login('email', 'password'),
    expect: () => [
      isA<AuthLoadingState>(),
      isA<AuthenticatedState>().having((s) => s.user, 'user', user),
    ],
  );

  blocTest(
    'Login returns UnauthenticatedState when user credentials are incorrect',
    build: () => AuthCubit(useCase),
    setUp: () {
      when(() => useCase.getHashedPassword('incorrectPassword')).thenAnswer(
        (_) async => 'incorrectHashedPassword',
      );
      when(() => useCase.login('email', 'incorrectHashedPassword')).thenAnswer(
        (_) async => null,
      );
    },
    tearDown: () => reset(useCase),
    act: (cubit) => cubit.login('email', 'incorrectPassword'),
    expect: () => [
      isA<AuthLoadingState>(),
      isA<UnauthenticatedState>(),
    ],
  );

  blocTest(
    'Logout returns UnauthenticatedState',
    build: () => AuthCubit(useCase),
    setUp: () {
      when(() => useCase.logout()).thenAnswer((_) async {});
    },
    tearDown: () => reset(useCase),
    act: (cubit) => cubit.logout(),
    expect: () => [
      isA<AuthLoadingState>(),
      isA<UnauthenticatedState>(),
    ],
  );

  blocTest(
    'Register returns AuthenticatedState when user is registered',
    build: () => AuthCubit(useCase),
    setUp: () {
      when(() => useCase.getHashedPassword('password')).thenAnswer(
        (_) async => 'hashedPassword',
      );
      when(() => useCase.register('email', 'name', 'hashedPassword')).thenAnswer(
        (_) async => user,
      );
    },
    tearDown: () => reset(useCase),
    act: (cubit) => cubit.register(email: 'email', name: 'name', password: 'password'),
    expect: () => [
      isA<AuthLoadingState>(),
      isA<AuthenticatedState>().having((s) => s.user, 'user', user),
    ],
  );

  blocTest(
    'Register returns UnauthenticatedState when user is not registered',
    build: () => AuthCubit(useCase),
    setUp: () {
      when(() => useCase.getHashedPassword('incorrectPassword')).thenAnswer(
        (_) async => 'incorrectHashedPassword',
      );
      when(() => useCase.register('email', 'name', 'incorrectHashedPassword')).thenAnswer(
        (_) async => null,
      );
    },
    tearDown: () => reset(useCase),
    act: (cubit) => cubit.register(email: 'email', name: 'name', password: 'incorrectPassword'),
    expect: () => [
      isA<AuthLoadingState>(),
      isA<UnauthenticatedState>(),
    ],
  );
}
