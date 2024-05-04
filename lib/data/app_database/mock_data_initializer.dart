/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';
import 'package:freight_tracking/db_barrel.dart';

extension MockInitializer on AppDatabase {
  void initializeDb() async {
    final existingFreight = await freightDao.readList();
    if (existingFreight.isNotEmpty) {
      log('Freight data already exists in the database. Skipping mock data initialization.');
      return;
    }

    log('Initializing mock data for freight table');
    await batch((b) {
      b.insertAll(
        freight,
        [
          FreightCompanion(
            status: const Value(FreightStatus.pending),
            loadOwnerName: const Value('John Doe'),
            loadOwnerPhone: const Value('1234567890'),
            destination: const Value('Kochi'),
            origin: const Value('Bangalore'),
            eta: Value(DateTime.now()),
            orderDate: Value(DateTime.now()),
            deliveryDate: Value(DateTime.now()),
            dispatchDate: Value(DateTime.now()),
          ),
          FreightCompanion(
            status: const Value(FreightStatus.pending),
            loadOwnerName: const Value('Jane Doe'),
            loadOwnerPhone: const Value('1234567890'),
            destination: const Value('Kochi'),
            origin: const Value('Chennai'),
            eta: Value(DateTime.now()),
            orderDate: Value(DateTime.now()),
            deliveryDate: Value(DateTime.now()),
            dispatchDate: Value(DateTime.now()),
          ),
          FreightCompanion(
            status: const Value(FreightStatus.inTransit),
            loadOwnerName: const Value('John Appleseed'),
            loadOwnerPhone: const Value('1234567890'),
            destination: const Value('Hyderabad'),
            origin: const Value('Bangalore'),
            eta: Value(DateTime.now()),
            orderDate: Value(DateTime.now()),
            deliveryDate: Value(DateTime.now()),
            dispatchDate: Value(DateTime.now()),
          ),
          FreightCompanion(
            status: const Value(FreightStatus.readyForDispatch),
            loadOwnerName: const Value('Jane Appleseed'),
            loadOwnerPhone: const Value('1234567890'),
            destination: const Value('Mumbai'),
            origin: const Value('Baroda'),
            eta: Value(DateTime.now()),
            orderDate: Value(DateTime.now()),
            deliveryDate: Value(DateTime.now()),
            dispatchDate: Value(DateTime.now()),
          ),
          FreightCompanion(
            status: const Value(FreightStatus.inTransit),
            loadOwnerName: const Value('Tom Hanks'),
            loadOwnerPhone: const Value('1234567890'),
            destination: const Value('Delhi'),
            origin: const Value('Thiruvananthapuram'),
            eta: Value(DateTime.now()),
            orderDate: Value(DateTime.now()),
            deliveryDate: Value(DateTime.now()),
            dispatchDate: Value(DateTime.now()),
          ),
          FreightCompanion(
            status: const Value(FreightStatus.delivered),
            loadOwnerName: const Value('Tom Cruise'),
            loadOwnerPhone: const Value('1234567890'),
            destination: const Value('Kochi'),
            origin: const Value('Bangalore'),
            eta: Value(DateTime.now()),
            orderDate: Value(DateTime.now()),
            deliveryDate: Value(DateTime.now()),
            dispatchDate: Value(DateTime.now()),
          ),
        ],
      );
    });
  }
}
