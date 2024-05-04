/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';
import 'package:freight_tracking/db_barrel.dart';

part 'freight_dao.g.dart';

@DriftAccessor(tables: [Freight])
class FreightDao extends DatabaseAccessor<AppDatabase> with _$FreightDaoMixin {
  FreightDao(super.db);

  static const int pageSize = 50;

  Future<FreightData?> create(FreightCompanion freightData) async {
    return await into(freight).insertReturningOrNull(
      freightData,
      mode: InsertMode.insertOrIgnore,
    );
  }

  Future<FreightData?> readFreightById(int id) async {
    final query = select(freight)..where((f) => f.id.equals(id));
    return query.getSingleOrNull();
  }

  Future<List<FreightData>> readList({
    int offset = 0,
    FreightStatus? status,
  }) async {
    final query = select(freight)
      ..limit(pageSize, offset: offset)
      ..where((t) => buildAnd<Freight>(t, [if (status != null) t.status.equalsValue(status)]));
    return query.get();
  }

  Future<void> updateFreight(FreightData freightData) async {
    await update(freight).replace(freightData);
  }

  Future<void> deleteFreight(int id) async {
    await (delete(freight)..where((f) => f.id.equals(id))).go();
  }
}
