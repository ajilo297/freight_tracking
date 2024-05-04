/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';

class MockFreightCubit extends MockCubit<FreightListState> implements FreightListCubit {}

void main() {
  FreightListCubit freightListCubit = MockFreightCubit();

  testWidgets('Freight List Widget UI is rendered', (widgetTester) async {
    whenListen(
      freightListCubit,
      Stream.fromIterable([const FreightListState(loading: false)]),
      initialState: const FreightListState(),
    );

    await widgetTester.pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: freightListCubit,
          child: const FreightListPage(),
        ),
      ),
    );

    expect(find.text('Freight List'), findsOneWidget);
    expect(find.byType(FreightList), findsOneWidget);
  });
}
