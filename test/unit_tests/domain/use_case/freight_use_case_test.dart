/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';
import 'package:mocktail/mocktail.dart';

class MockFreightRepository extends Mock implements FreightRepository {}

void main() {
  final freightList = List.generate(
    10,
    (index) => FreightEntity(
      id: index,
      origin: 'origin$index',
      destination: 'destination$index',
      loadOwnerName: 'loadOwnerName$index',
      loadOwnerPhone: 'loadOwnerPhone$index',
    ),
  );

  FreightRepository freightRepository = MockFreightRepository();
  late FreightUseCase useCase;

  setUpAll(() {
    registerFallbackValue(freightList[0]);
    registerFallbackValue(const FreightEntityFilter());
  });

  setUp(() {
    useCase = FreightUseCase(freightRepository);
  });

  test('returns created freight', () async {
    when(() => freightRepository.create(any(that: isA<FreightEntity>()))).thenAnswer(
      (_) async => freightList[0],
    );

    final result = await useCase.create(freightList[0]);
    expect(result, freightList[0]);
  });

  test('returns read freight when it matches filter', () async {
    when(() => freightRepository.read(any(that: isA<FreightEntityFilter>()))).thenAnswer(
      (_) async => freightList[0],
    );

    final result = await useCase.read(const FreightEntityFilter());
    expect(result, freightList[0]);
  });

  test('returns null when read freight does not match filter', () async {
    when(() => freightRepository.read(any(that: isA<FreightEntityFilter>()))).thenAnswer(
      (_) async => null,
    );

    final result = await useCase.read(const FreightEntityFilter());
    expect(result, null);
  });

  test('returns list of freight when it matches filter', () async {
    when(() => freightRepository.readList(any(that: isA<FreightEntityFilter>()))).thenAnswer(
      (_) async => freightList,
    );

    final result = await useCase.readList(const FreightEntityFilter());
    expect(result, freightList);
  });

  test('returns empty list when read freight list does not match filter', () async {
    when(() => freightRepository.readList(any(that: isA<FreightEntityFilter>()))).thenAnswer(
      (_) async => [],
    );

    final result = await useCase.readList(const FreightEntityFilter());
    expect(result, []);
  });

  test('returns updated freight', () async {
    when(() => freightRepository.update(any(that: isA<FreightEntity>()))).thenAnswer(
      (_) async => freightList[0],
    );

    final result = await useCase.update(freightList[0]);
    expect(result, freightList[0]);
  });

  test('deletes freight when it matches filter', () async {
    when(() => freightRepository.delete(any(that: isA<FreightEntityFilter>()))).thenAnswer((_) async {});

    await useCase.delete(const FreightEntityFilter());
    verify(() => freightRepository.delete(const FreightEntityFilter())).called(1);
  });
}
