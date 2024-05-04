/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart' show FreightStatus;
import 'package:freight_tracking/db_barrel.dart';

class Freight extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get origin => text()();

  TextColumn get destination => text()();

  TextColumn get loadOwnerName => text()();

  TextColumn get loadOwnerPhone => text()();

  TextColumn get status => textEnum<FreightStatus>()();
}
