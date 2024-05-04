/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';
import 'package:mocktail/mocktail.dart';

class MockAppDatabase extends Mock implements AppDatabase {}

class MockFreightDao extends Mock implements FreightDao {}

void main() {
  AppDatabase appDatabase = MockAppDatabase();
  FreightDao freightDao = MockFreightDao();

  testWidgets('Dependencies are injected', (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: RepositoryProvider.value(
          value: appDatabase,
          child: FreightListCubitProvider(child: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () => context.read<FreightListCubit>().loadList(),
              child: const Text('Test'),
            );
          })),
        ),
      ),
    );

    when(() => appDatabase.freightDao).thenReturn(freightDao);
    when(() => freightDao.readList(offset: 0)).thenAnswer((_) async => []);

    await widgetTester.tap(find.byType(ElevatedButton));
    verify(() => appDatabase.freightDao).called(2);
  });
}
