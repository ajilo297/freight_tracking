/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

part 'freight_entity.mapper.dart';

@MappableClass()
class FreightEntity extends Entity with FreightEntityMappable {
  const FreightEntity({
    this.id,
    required this.origin,
    required this.destination,
    this.status = FreightStatus.pending,
    required this.loadOwnerName,
    required this.loadOwnerPhone,
  });

  final int? id;
  final String origin;
  final String destination;
  final String loadOwnerName;
  final String loadOwnerPhone;

  final FreightStatus status;
}

@MappableEnum()
enum FreightStatus {
  pending,
  readyForDispatch,
  inTransit,
  delivered,
}

@MappableClass()
class FreightEntityFilter extends EntityFilter with FreightEntityFilterMappable {
  const FreightEntityFilter({
    this.id,
    this.status,
    this.origin,
    this.destination,
    super.offset = 0,
  });

  final int? id;
  final FreightStatus? status;
  final String? origin;
  final String? destination;
}
