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

  final freightList = List.generate(
    10,
    (index) => FreightEntity(
      id: index,
      origin: 'origin$index',
      destination: 'destination$index',
      loadOwnerName: 'loadOwnerName$index',
      loadOwnerPhone: 'loadOwnerPhone$index',
      eta: now,
      orderDate: now,
      deliveryDate: now,
      dispatchDate: now,
    ),
  );

  FreightUseCase useCase = MockFreightUseCase();

  setUpAll(() {
    registerFallbackValue(const FreightEntityFilter());
  });

  blocTest(
    'Load list returns freight list',
    setUp: () => when(() => useCase.readList(any())).thenAnswer(
      (_) async => freightList,
    ),
    tearDown: () => reset(useCase),
    build: () => FreightListCubit(useCase),
    act: (cubit) => cubit.loadList(),
    expect: () => [
      isA<FreightListState>().having((s) => s.loading, 'loading', true),
      isA<FreightListState>().having((s) => s.data, 'data', freightList).having((s) => s.loading, 'loading', false),
    ],
  );

  blocTest(
    'Load list returns empty list if no freight available',
    setUp: () => when(() => useCase.readList(any())).thenAnswer(
      (_) async => [],
    ),
    tearDown: () => reset(useCase),
    build: () => FreightListCubit(useCase),
    act: (cubit) => cubit.loadList(),
    expect: () => [
      isA<FreightListState>().having((s) => s.loading, 'loading', true),
      isA<FreightListState>().having((s) => s.data, 'data', []).having((s) => s.loading, 'loading', false),
    ],
  );

  blocTest(
    'Load more increments offset for filter',
    setUp: () => when(() => useCase.readList(any())).thenAnswer(
      (_) async => freightList,
    ),
    tearDown: () => reset(useCase),
    build: () => FreightListCubit(useCase),
    seed: () => FreightListState(
      data: freightList,
      filter: const FreightEntityFilter(offset: 10),
    ),
    act: (cubit) => cubit.loadMore(),
    expect: () => [
      isA<FreightListState>().having((s) => s.loading, 'loading', true),
      isA<FreightListState>()
          .having((s) => s.data.length, 'data', 20)
          .having((s) => s.loading, 'loading', false)
          .having((s) => s.filter.offset, 'offset', 10),
    ],
  );

  blocTest(
    'Filter by status returns filtered list',
    setUp: () => when(() => useCase.readList(any())).thenAnswer(
      (_) async => freightList,
    ),
    tearDown: () => reset(useCase),
    build: () => FreightListCubit(useCase),
    act: (cubit) => cubit.filterByStatus(FreightStatus.delivered),
    expect: () => [
      isA<FreightListState>().having((s) => s.loading, 'loading', true),
      isA<FreightListState>().having((s) => s.data, 'data', freightList).having((s) => s.loading, 'loading', false),
    ],
    verify: (bloc) {
      verify(() => useCase.readList(const FreightEntityFilter(status: FreightStatus.delivered))).called(1);
    },
  );
}
