/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';
import 'package:mocktail/mocktail.dart';

class MockFreightDao extends Mock implements FreightDao {}

class MockAppDatabase extends Mock implements AppDatabase {}

void main() {
  final freightList = List.generate(
    10,
    (index) => FreightEntity(
      id: index,
      origin: 'origin$index',
      destination: 'destination$index',
      loadOwnerName: 'loadOwnerName$index',
      loadOwnerPhone: 'loadOwnerPhone$index',
      status: FreightStatus.pending,
    ),
  );

  final freightDataList = List.generate(
    10,
    (index) => FreightData(
      id: index,
      origin: 'origin$index',
      destination: 'destination$index',
      loadOwnerName: 'loadOwnerName$index',
      loadOwnerPhone: 'loadOwnerPhone$index',
      status: FreightStatus.pending,
    ),
  );

  final AppDatabase appDatabase = MockAppDatabase();
  final FreightDao freightDao = MockFreightDao();

  setUpAll(() {
    registerFallbackValue(const FreightCompanion());
    registerFallbackValue(freightDataList[0]);
  });

  group('Create', () {
    test('returns freight entity when db returns freight', () async {
      when(() => appDatabase.freightDao).thenReturn(freightDao);
      when(() => freightDao.create(any())).thenAnswer(
        (_) async => freightDataList[0],
      );

      final localFreightRepository = LocalFreightRepository(appDatabase);
      final result = await localFreightRepository.create(freightList[0]);

      expect(result, freightList[0]);
    });

    test('does not return freight entity when db returns null', () async {
      when(() => appDatabase.freightDao).thenReturn(freightDao);
      when(() => freightDao.create(any())).thenAnswer(
        (_) async => null,
      );

      final localFreightRepository = LocalFreightRepository(appDatabase);
      final result = await localFreightRepository.create(freightList[0]);

      expect(result, null);
    });
  });

  group('Read by id', () {
    test('returns freight entity when db returns freight', () async {
      when(() => appDatabase.freightDao).thenReturn(freightDao);
      when(() => freightDao.readFreightById(0)).thenAnswer(
        (_) async => freightDataList[0],
      );

      final localFreightRepository = LocalFreightRepository(appDatabase);
      final result = await localFreightRepository.read(const FreightEntityFilter(id: 0));

      expect(result, freightList[0]);
    });

    test('does not return freight entity when db returns null', () async {
      when(() => appDatabase.freightDao).thenReturn(freightDao);
      when(() => freightDao.readFreightById(0)).thenAnswer(
        (_) async => null,
      );

      final localFreightRepository = LocalFreightRepository(appDatabase);
      final result = await localFreightRepository.read(const FreightEntityFilter(id: 0));

      expect(result, null);
    });
  });

  group('Read list', () {
    test('returns freight entity list when db returns freight list', () async {
      when(() => appDatabase.freightDao).thenReturn(freightDao);
      when(() => freightDao.readList(offset: 0, status: FreightStatus.pending)).thenAnswer(
        (_) async => freightDataList,
      );

      final localFreightRepository = LocalFreightRepository(appDatabase);
      final result =
          await localFreightRepository.readList(const FreightEntityFilter(offset: 0, status: FreightStatus.pending));

      expect(result, freightList);
    });

    test('does not return freight entity list when db returns empty list', () async {
      when(() => appDatabase.freightDao).thenReturn(freightDao);
      when(() => freightDao.readList(offset: 0, status: FreightStatus.pending)).thenAnswer(
        (_) async => [],
      );

      final localFreightRepository = LocalFreightRepository(appDatabase);
      final result =
          await localFreightRepository.readList(const FreightEntityFilter(offset: 0, status: FreightStatus.pending));

      expect(result, []);
    });
  });

  group('Update', () {
    test('returns freight entity when db returns freight', () async {
      when(() => appDatabase.freightDao).thenReturn(freightDao);
      when(() => freightDao.readFreightById(any())).thenAnswer(
        (_) async => freightDataList[0],
      );
      when(() => freightDao.updateFreight(any())).thenAnswer((_) async {});

      final localFreightRepository = LocalFreightRepository(appDatabase);
      final result = await localFreightRepository.update(freightList[0]);

      expect(result, freightList[0]);
    });

    test('does not return freight entity when db returns null', () async {
      when(() => appDatabase.freightDao).thenReturn(freightDao);
      when(() => freightDao.updateFreight(any())).thenAnswer(
        (_) async {},
      );
      when(() => freightDao.readFreightById(any())).thenAnswer(
        (_) async => null,
      );

      final localFreightRepository = LocalFreightRepository(appDatabase);
      final result = await localFreightRepository.update(freightList[0]);

      expect(result, null);
    });
  });

  group('Delete', () {
    test('returns freight entity when db returns freight', () async {
      when(() => appDatabase.freightDao).thenReturn(freightDao);
      when(() => freightDao.readFreightById(any())).thenAnswer(
        (_) async => freightDataList[0],
      );
      when(() => freightDao.deleteFreight(any())).thenAnswer((_) async {});

      final localFreightRepository = LocalFreightRepository(appDatabase);
      await localFreightRepository.delete(const FreightEntityFilter(id: 0));

      verify(() => freightDao.deleteFreight(0)).called(1);
    });

    test('does not return freight entity when db returns null', () async {
      when(() => appDatabase.freightDao).thenReturn(freightDao);
      when(() => freightDao.deleteFreight(any())).thenAnswer(
        (_) async {},
      );
      when(() => freightDao.readFreightById(any())).thenAnswer(
        (_) async => null,
      );

      final localFreightRepository = LocalFreightRepository(appDatabase);
      await localFreightRepository.delete(const FreightEntityFilter());

      verifyNever(() => freightDao.deleteFreight(0));
    });
  });
}
