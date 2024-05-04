/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';
import 'package:freight_tracking/db_barrel.dart';

class LocalFreightRepository implements FreightRepository {
  const LocalFreightRepository(this.appDatabase);

  final AppDatabase appDatabase;

  @override
  Future<FreightEntity?> create(FreightEntity entity) async {
    final freight = await appDatabase.freightDao.create(
      FreightCompanion(
        status: Value(entity.status),
        origin: Value(entity.origin),
        destination: Value(entity.destination),
        loadOwnerName: Value(entity.loadOwnerName),
        loadOwnerPhone: Value(entity.loadOwnerPhone),
        eta: Value(entity.eta),
        orderDate: Value(entity.orderDate),
        deliveryDate: Value(entity.deliveryDate),
        dispatchDate: Value(entity.dispatchDate),
      ),
    );

    if (freight == null) return null;

    return FreightEntity(
      id: freight.id,
      status: freight.status,
      origin: freight.origin,
      destination: freight.destination,
      loadOwnerName: freight.loadOwnerName,
      loadOwnerPhone: freight.loadOwnerPhone,
      eta: freight.eta,
      orderDate: freight.orderDate,
      deliveryDate: freight.deliveryDate,
      dispatchDate: freight.dispatchDate,
    );
  }

  @override
  Future<FreightEntity?> read(FreightEntityFilter filter) async {
    final id = filter.id;
    if (id == null) return null;
    final freight = await appDatabase.freightDao.readFreightById(id);

    if (freight == null) return null;

    return FreightEntity(
      id: freight.id,
      status: freight.status,
      origin: freight.origin,
      destination: freight.destination,
      loadOwnerName: freight.loadOwnerName,
      loadOwnerPhone: freight.loadOwnerPhone,
      eta: freight.eta,
      orderDate: freight.orderDate,
      deliveryDate: freight.deliveryDate,
      dispatchDate: freight.dispatchDate,
    );
  }

  @override
  Future<List<FreightEntity>> readList(FreightEntityFilter filter) async {
    final freightList = await appDatabase.freightDao.readList(
      offset: filter.offset,
      status: filter.status,
    );

    return freightList
        .map((freight) => FreightEntity(
              id: freight.id,
              status: freight.status,
              origin: freight.origin,
              destination: freight.destination,
              loadOwnerName: freight.loadOwnerName,
              loadOwnerPhone: freight.loadOwnerPhone,
              eta: freight.eta,
              orderDate: freight.orderDate,
              deliveryDate: freight.deliveryDate,
              dispatchDate: freight.dispatchDate,
            ))
        .toList();
  }

  @override
  Future<FreightEntity?> update(FreightEntity entity) async {
    final id = entity.id;
    if (id == null) return null;
    final freight = await appDatabase.freightDao.readFreightById(id);
    if (freight == null) return null;

    await appDatabase.freightDao.updateFreight(
      FreightData(
        id: freight.id,
        origin: entity.origin,
        destination: entity.destination,
        status: entity.status,
        loadOwnerName: entity.loadOwnerName,
        loadOwnerPhone: entity.loadOwnerPhone,
        eta: freight.eta,
        orderDate: freight.orderDate,
        deliveryDate: freight.deliveryDate,
        dispatchDate: freight.dispatchDate,
      ),
    );

    final updatedFreight = await appDatabase.freightDao.readFreightById(id);
    if (updatedFreight == null) return null;

    return FreightEntity(
      id: updatedFreight.id,
      status: updatedFreight.status,
      origin: updatedFreight.origin,
      destination: updatedFreight.destination,
      loadOwnerName: updatedFreight.loadOwnerName,
      loadOwnerPhone: updatedFreight.loadOwnerPhone,
      eta: freight.eta,
      orderDate: freight.orderDate,
      deliveryDate: freight.deliveryDate,
      dispatchDate: freight.dispatchDate,
    );
  }

  @override
  Future<void> delete(FreightEntityFilter filter) async {
    final id = filter.id;
    if (id == null) return Future.value();
    return await appDatabase.freightDao.deleteFreight(id);
  }
}
