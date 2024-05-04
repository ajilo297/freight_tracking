/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
  AuthCubit cubit = MockAuthCubit();

  testWidgets('Logout button is rendered', (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: cubit,
            child: const LogoutButton(),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.logout), findsOneWidget);
  });

  testWidgets('Logout button calls logout method', (widgetTester) async {
    whenListen(
        cubit,
        Stream.fromIterable([
          const AuthenticatedState(
            UserEntity(
              email: 'email',
              hashedPassword: 'hashedPassword',
              name: 'name  ',
            ),
          )
        ]));

    when(() => cubit.logout()).thenAnswer((_) async {});

    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: cubit,
            child: const LogoutButton(),
          ),
        ),
      ),
    );

    await widgetTester.tap(find.byIcon(Icons.logout));
    verify(() => cubit.logout()).called(1);
  });
}
