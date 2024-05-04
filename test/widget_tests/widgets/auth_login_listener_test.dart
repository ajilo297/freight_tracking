/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
  group('AuthLoginListener', () {
    testWidgets('calls onLoginSuccess when state is AuthenticatedState', (WidgetTester tester) async {
      final mockAuthCubit = MockAuthCubit();

      bool onLoginSuccessCalled = false;

      const user = UserEntity(
        email: 'email',
        hashedPassword: 'hashedPassword',
        name: 'name',
      );

      whenListen(
        mockAuthCubit,
        Stream<AuthState>.fromIterable([
          const AuthLoadingState(),
          const AuthenticatedState(user),
        ]),
        initialState: const AuthenticatedState(user),
      );

      await tester.pumpWidget(
        BlocProvider<AuthCubit>.value(
          value: mockAuthCubit,
          child: MaterialApp(
            home: AuthLoginListener(
              onLoginSuccess: (context) {
                onLoginSuccessCalled = true;
              },
              child: Container(),
            ),
          ),
        ),
      );

      expect(onLoginSuccessCalled, isTrue);
    });
  });
}
