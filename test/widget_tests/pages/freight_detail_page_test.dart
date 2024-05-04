/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';
import 'package:mocktail/mocktail.dart';

class MockFreightUseCase extends Mock implements FreightUseCase {}

class MockFreightListCubit extends MockCubit<FreightListState> implements FreightListCubit {}

void main() {
  FreightUseCase useCase = MockFreightUseCase();
  FreightListCubit listCubit = MockFreightListCubit();

  final now = DateTime.now();

  final freight = FreightEntity(
    id: 1,
    origin: 'testOrigin',
    destination: 'testDestination',
    loadOwnerName: 'testOwnerName',
    loadOwnerPhone: 'testOwnerPhone',
    status: FreightStatus.inTransit,
    eta: now,
    orderDate: now,
    deliveryDate: null,
    dispatchDate: null,
  );

  setUpAll(() {
    registerFallbackValue(freight);
  });

  testWidgets('FreightDetail UI is rendered', (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: RepositoryProvider.value(
          value: useCase,
          child: BlocProvider.value(
            value: listCubit,
            child: FreightDetailsPage(freight),
          ),
        ),
      ),
    );

    expect(find.byType(FreightDetailCard), findsOneWidget);
  });

  testWidgets(
    'Freight List cubit is reloaded when detail is updated',
    (widgetTester) async {
      when(() => useCase.update(any())).thenAnswer(
        (_) async => freight.copyWith(status: FreightStatus.pending),
      );

      await widgetTester.pumpWidget(
        MaterialApp(
          home: RepositoryProvider.value(
            value: useCase,
            child: BlocProvider.value(
              value: listCubit,
              child: FreightDetailsPage(freight),
            ),
          ),
        ),
      );

      expect(find.text('Pending'), findsOneWidget);

      await widgetTester.tap(find.text('Pending'));
      await widgetTester.pumpAndSettle();
    },
  );
}
