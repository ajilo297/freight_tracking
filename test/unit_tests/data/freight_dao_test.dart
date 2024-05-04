/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';
import 'package:freight_tracking/db_barrel.dart';

void main() {
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

  late AppDatabase appDatabase;

  setUp(() {
    appDatabase = AppDatabase(NativeDatabase.memory());
  });

  tearDown(() async {
    await appDatabase.close();
  });

  group('Create', () {
    test('Creates a freight', () async {
      final freightDao = FreightDao(appDatabase);
      final freight = freightDataList[0];
      final createdFreight = await freightDao.create(
        freightDataList[0].toCompanion(true),
      );
      expect(createdFreight, freight);
    });

    test('Creates a freight with same id does not create', () async {
      final freightDao = FreightDao(appDatabase);
      await freightDao.create(freightDataList[0].toCompanion(true));
      final createdFreight = await freightDao.create(
        freightDataList[0].toCompanion(true),
      );
      expect(createdFreight, null);
    });
  });

  group('Read', () {
    test('Read freight by id', () async {
      final freightDao = FreightDao(appDatabase);
      await freightDao.create(freightDataList[0].toCompanion(true));
      final readFreight = await freightDao.readFreightById(freightDataList[0].id);
      expect(readFreight, freightDataList[0]);
    });

    test('Read freight by id with wrong id', () async {
      final freightDao = FreightDao(appDatabase);
      await freightDao.create(freightDataList[0].toCompanion(true));
      final readFreight = await freightDao.readFreightById(freightDataList[0].id + 1);
      expect(readFreight, null);
    });
  });

  group('Read list', () {
    test('Read list of freights', () async {
      final freightDao = FreightDao(appDatabase);
      for (final freight in freightDataList) {
        await freightDao.create(freight.toCompanion(true));
      }
      final readFreightList = await freightDao.readList();
      expect(readFreightList, freightDataList);
    });

    test('Read list of freights with status', () async {
      final freightDao = FreightDao(appDatabase);
      for (final freight in freightDataList) {
        await freightDao.create(freight.toCompanion(true));
      }
      final readFreightList = await freightDao.readList(status: FreightStatus.pending);
      expect(readFreightList, freightDataList);
    });

    test('Read list of freights with status and offset', () async {
      final freightDao = FreightDao(appDatabase);
      for (final freight in freightDataList) {
        await freightDao.create(freight.toCompanion(true));
      }
      final readFreightList = await freightDao.readList(offset: 5, status: FreightStatus.pending);
      expect(readFreightList, freightDataList.sublist(5));
    });
  });

  group('Update', () {
    test('Update freight', () async {
      final freightDao = FreightDao(appDatabase);
      await freightDao.create(freightDataList[0].toCompanion(true));
      final updatedFreight = freightDataList[0].copyWith(status: FreightStatus.delivered);
      await freightDao.updateFreight(updatedFreight);
      final readFreight = await freightDao.readFreightById(freightDataList[0].id);
      expect(readFreight, updatedFreight);
    });

    test('Update freight with wrong id', () async {
      final freightDao = FreightDao(appDatabase);
      await freightDao.create(freightDataList[0].toCompanion(true));
      final updatedFreight = freightDataList[0].copyWith(status: FreightStatus.delivered);
      await freightDao.updateFreight(updatedFreight);
      final readFreight = await freightDao.readFreightById(freightDataList[0].id + 1);
      expect(readFreight, null);
    });
  });

  group('Delete', () {
    test('Delete freight', () async {
      final freightDao = FreightDao(appDatabase);
      await freightDao.create(freightDataList[0].toCompanion(true));
      await freightDao.deleteFreight(freightDataList[0].id);
      final readFreight = await freightDao.readFreightById(freightDataList[0].id);
      expect(readFreight, null);
    });

    test('Delete freight with wrong id', () async {
      final freightDao = FreightDao(appDatabase);
      await freightDao.create(freightDataList[0].toCompanion(true));
      await freightDao.deleteFreight(freightDataList[0].id + 1);
      final readFreight = await freightDao.readFreightById(freightDataList[0].id);
      expect(readFreight, freightDataList[0]);
    });
  });
}
