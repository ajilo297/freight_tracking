/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';
import 'package:mocktail/mocktail.dart';

class MockFreightUseCase extends Mock implements FreightUseCase {}

void main() {
  final now = DateTime.now();

  final freight = FreightEntity(
    id: 1,
    origin: 'origin',
    destination: 'destination',
    loadOwnerName: 'loadOwnerName',
    loadOwnerPhone: 'loadOwnerPhone',
    eta: now,
    orderDate: now,
    deliveryDate: now,
    dispatchDate: now,
  );

  FreightUseCase useCase = MockFreightUseCase();

  blocTest(
    'Bloc is initialized with a freight',
    build: () => FreightDetailCubit(
      freightEntity: freight,
      useCase: useCase,
    ),
    verify: (b) => expect(b.state.freight, freight),
  );

  blocTest(
    'Bloc calls update and updates the freight locally',
    setUp: () {
      registerFallbackValue(freight);
      when(() => useCase.update(any())).thenAnswer((_) async => freight);
    },
    tearDown: () => reset(useCase),
    build: () => FreightDetailCubit(
      freightEntity: freight,
      useCase: useCase,
    ),
    act: (bloc) => bloc.update(freight.copyWith(origin: 'newOrigin')),
    verify: (_) {
      verify(
        () => useCase.update(freight.copyWith(origin: 'newOrigin')),
      ).called(1);
    },
    expect: () => [
      isA<FreightDetailState>().having((s) => s.loading, 'loading', true),
      isA<FreightDetailState>()
          .having((s) => s.freight, 'freight', freight.copyWith(origin: 'newOrigin'))
          .having((s) => s.loading, 'loading', false),
    ],
  );
}
