/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
  AuthCubit authCubit = MockAuthCubit();

  group('Sign Up Form', () {
    setUp(() {
      whenListen(
        authCubit,
        Stream.fromIterable([const UnauthenticatedState()]),
        initialState: const UnauthenticatedState(),
      );
    });

    testWidgets('UI is rendered', (tester) async {
      whenListen(
        authCubit,
        Stream.fromIterable([const UnauthenticatedState()]),
        initialState: const UnauthenticatedState(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: authCubit,
            child: const SignUpPage(),
          ),
        ),
      );

      expect(
        find.byKey(const Key('authFormTitle')),
        findsOneWidget,
      );

      final titleWidget = tester.widget<Text>(
        find.byKey(const Key('authFormTitle')),
      );
      expect(titleWidget.data, 'Sign Up');

      expect(find.byKey(const Key('nameField')), findsOneWidget);
      expect(find.byKey(const Key('emailField')), findsOneWidget);
      expect(find.byKey(const Key('passwordField')), findsOneWidget);

      expect(find.byKey(const Key('authFormButton')), findsOneWidget);

      final buttonWidget = tester.widget<FilledButton>(
        find.byKey(const Key('authFormButton')),
      );

      expect(buttonWidget.child.runtimeType, Text);
      expect((buttonWidget.child as Text).data, 'Sign Up');

      expect(find.byKey(const Key('authFormSwitchButton')), findsOneWidget);

      final switchButtonWidget = tester.widget<TextButton>(
        find.byKey(const Key('authFormSwitchButton')),
      );

      expect(switchButtonWidget.child.runtimeType, Text);
      expect((switchButtonWidget.child as Text).data, 'Already have an account? Login');
    });

    testWidgets('Sign Up button is disabled when form is invalid', (tester) async {
      whenListen(
        authCubit,
        Stream.fromIterable([const UnauthenticatedState()]),
        initialState: const UnauthenticatedState(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: authCubit,
            child: const SignUpPage(),
          ),
        ),
      );

      expect(find.byKey(const Key('authFormButton')), findsOneWidget);

      final buttonWidget = tester.widget<FilledButton>(
        find.byKey(const Key('authFormButton')),
      );

      expect(buttonWidget.onPressed, isNull);
    });

    testWidgets('Sign Up button is enabled when form is valid', (widgetTester) async {
      whenListen(
        authCubit,
        Stream.fromIterable([const UnauthenticatedState()]),
        initialState: const UnauthenticatedState(),
      );

      await widgetTester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: authCubit,
            child: const SignUpPage(),
          ),
        ),
      );

      await widgetTester.enterText(find.byKey(const Key('nameField')), 'testName');
      await widgetTester.enterText(find.byKey(const Key('emailField')), 'test@mail.com');
      await widgetTester.enterText(find.byKey(const Key('passwordField')), 'testPassword');

      expect(find.byKey(const Key('authFormButton')), findsOneWidget);

      await widgetTester.pumpAndSettle();

      final buttonWidget = widgetTester.widget<FilledButton>(
        find.byKey(const Key('authFormButton')),
      );

      expect(buttonWidget.onPressed, isNotNull);
    });

    testWidgets(
      'auth cubit register is called when form is filled and sign up is tapped',
      (widgetTester) async {
        whenListen(
          authCubit,
          Stream.fromIterable([const UnauthenticatedState()]),
          initialState: const UnauthenticatedState(),
        );

        await widgetTester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: authCubit,
              child: const SignUpPage(),
            ),
          ),
        );

        await widgetTester.enterText(find.byKey(const Key('nameField')), 'testName');
        await widgetTester.enterText(find.byKey(const Key('emailField')), 'test@mail.com');
        await widgetTester.enterText(find.byKey(const Key('passwordField')), 'testPassword');

        await widgetTester.pumpAndSettle();

        await widgetTester.tap(find.byKey(const Key('authFormButton')));

        verify(() => authCubit.register(
              name: any(named: 'name'),
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).called(1);
      },
    );

    group('Validation messages', () {
      testWidgets('Name is required', (widgetTester) async {
        await widgetTester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: authCubit,
              child: const SignUpPage(),
            ),
          ),
        );

        await widgetTester.enterText(find.byKey(const Key('nameField')), '');
        await widgetTester.tapAt(Offset.zero);

        await widgetTester.pumpAndSettle();

        expect(find.text('Name is required'), findsOneWidget);
      });

      testWidgets('Name is too short', (widgetTester) async {
        await widgetTester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: authCubit,
              child: const SignUpPage(),
            ),
          ),
        );

        await widgetTester.enterText(find.byKey(const Key('nameField')), 'a');
        await widgetTester.tapAt(Offset.zero);

        await widgetTester.pumpAndSettle();

        expect(find.text('Name is too short'), findsOneWidget);
      });

      testWidgets('Name is too long', (widgetTester) async {
        await widgetTester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: authCubit,
              child: const SignUpPage(),
            ),
          ),
        );

        await widgetTester.enterText(find.byKey(const Key('nameField')), 'a' * 51);
        await widgetTester.tapAt(Offset.zero);

        await widgetTester.pumpAndSettle();

        expect(find.text('Name is too long'), findsOneWidget);
      });

      testWidgets('Email is required', (widgetTester) async {
        await widgetTester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: authCubit,
              child: const SignUpPage(),
            ),
          ),
        );

        await widgetTester.enterText(find.byKey(const Key('emailField')), '');
        await widgetTester.tapAt(Offset.zero);

        await widgetTester.pumpAndSettle();

        expect(find.text('Email is required'), findsOneWidget);
      });

      testWidgets('Invalid email', (widgetTester) async {
        await widgetTester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: authCubit,
              child: const SignUpPage(),
            ),
          ),
        );

        await widgetTester.enterText(find.byKey(const Key('emailField')), 'test');
        await widgetTester.tapAt(Offset.zero);

        await widgetTester.pumpAndSettle();

        expect(find.text('Invalid email'), findsOneWidget);
      });

      testWidgets('Password is required', (widgetTester) async {
        await widgetTester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: authCubit,
              child: const SignUpPage(),
            ),
          ),
        );

        await widgetTester.enterText(find.byKey(const Key('passwordField')), '');
        await widgetTester.tapAt(Offset.zero);

        await widgetTester.pumpAndSettle();

        expect(find.text('Password is required'), findsOneWidget);
      });

      testWidgets('Password is too short', (widgetTester) async {
        await widgetTester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: authCubit,
              child: const SignUpPage(),
            ),
          ),
        );

        await widgetTester.enterText(find.byKey(const Key('passwordField')), 'a');
        await widgetTester.tapAt(Offset.zero);

        await widgetTester.pumpAndSettle();

        expect(find.text('Password is too short'), findsOneWidget);
      });

      testWidgets('Password is too long', (widgetTester) async {
        await widgetTester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: authCubit,
              child: const SignUpPage(),
            ),
          ),
        );

        await widgetTester.enterText(find.byKey(const Key('passwordField')), 'a' * 55);
        await widgetTester.tapAt(Offset.zero);

        await widgetTester.pumpAndSettle();

        expect(find.text('Password is too long'), findsOneWidget);
      });
    });
  });

  group('Login Form', () {
    setUp(() {
      whenListen(
        authCubit,
        Stream.fromIterable([const UnauthenticatedState()]),
        initialState: const UnauthenticatedState(),
      );
    });

    testWidgets('UI is rendered', (tester) async {
      whenListen(
        authCubit,
        Stream.fromIterable([const UnauthenticatedState()]),
        initialState: const UnauthenticatedState(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: authCubit,
            child: const LoginPage(),
          ),
        ),
      );

      expect(
        find.byKey(const Key('authFormTitle')),
        findsOneWidget,
      );

      final titleWidget = tester.widget<Text>(
        find.byKey(const Key('authFormTitle')),
      );
      expect(titleWidget.data, 'Login');

      expect(find.byKey(const Key('emailField')), findsOneWidget);
      expect(find.byKey(const Key('passwordField')), findsOneWidget);

      expect(find.byKey(const Key('authFormButton')), findsOneWidget);

      final buttonWidget = tester.widget<FilledButton>(
        find.byKey(const Key('authFormButton')),
      );

      expect(buttonWidget.child.runtimeType, Text);
      expect((buttonWidget.child as Text).data, 'Login');

      expect(find.byKey(const Key('authFormSwitchButton')), findsOneWidget);

      final switchButtonWidget = tester.widget<TextButton>(
        find.byKey(const Key('authFormSwitchButton')),
      );

      expect(switchButtonWidget.child.runtimeType, Text);
      expect((switchButtonWidget.child as Text).data, 'Don\'t have an account? Sign Up');
    });

    testWidgets('Login button is disabled when form is invalid', (tester) async {
      whenListen(
        authCubit,
        Stream.fromIterable([const UnauthenticatedState()]),
        initialState: const UnauthenticatedState(),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: authCubit,
            child: const LoginPage(),
          ),
        ),
      );

      expect(find.byKey(const Key('authFormButton')), findsOneWidget);

      final buttonWidget = tester.widget<FilledButton>(
        find.byKey(const Key('authFormButton')),
      );

      expect(buttonWidget.onPressed, isNull);
    });

    testWidgets('Login button is enabled when form is valid', (widgetTester) async {
      whenListen(
        authCubit,
        Stream.fromIterable([const UnauthenticatedState()]),
        initialState: const UnauthenticatedState(),
      );

      await widgetTester.pumpWidget(
        MaterialApp(
          home: BlocProvider.value(
            value: authCubit,
            child: const LoginPage(),
          ),
        ),
      );

      await widgetTester.enterText(find.byKey(const Key('emailField')), 'test@mail.com');
      await widgetTester.enterText(find.byKey(const Key('passwordField')), 'testPassword');

      expect(find.byKey(const Key('authFormButton')), findsOneWidget);

      await widgetTester.pumpAndSettle();

      final buttonWidget = widgetTester.widget<FilledButton>(
        find.byKey(const Key('authFormButton')),
      );

      expect(buttonWidget.onPressed, isNotNull);
    });

    testWidgets(
      'auth cubit login is called when form is filled and login is tapped',
      (widgetTester) async {
        whenListen(
          authCubit,
          Stream.fromIterable([const UnauthenticatedState()]),
          initialState: const UnauthenticatedState(),
        );

        await widgetTester.pumpWidget(
          MaterialApp(
            home: BlocProvider.value(
              value: authCubit,
              child: const LoginPage(),
            ),
          ),
        );

        await widgetTester.enterText(find.byKey(const Key('emailField')), 'test@mail.com');
        await widgetTester.enterText(find.byKey(const Key('passwordField')), 'testPassword');

        await widgetTester.pumpAndSettle();

        await widgetTester.tap(find.byKey(const Key('authFormButton')));

        verify(() => authCubit.login(
              email: any(named: 'email'),
              password: any(named: 'password'),
            )).called(1);
      },
    );
  });
}
