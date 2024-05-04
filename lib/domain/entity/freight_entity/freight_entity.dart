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
    required this.orderDate,
    required this.eta,
    this.dispatchDate,
    this.deliveryDate,
  });

  final int? id;
  final String origin;
  final String destination;
  final String loadOwnerName;
  final String loadOwnerPhone;

  final DateTime orderDate;
  final DateTime eta;
  final DateTime? dispatchDate;
  final DateTime? deliveryDate;

  final FreightStatus status;
}

@MappableEnum()
enum FreightStatus {
  pending('Pending', Colors.amber, textColor: Colors.black, shortName: 'P'),
  readyForDispatch('Ready for Dispatch', textColor: Colors.black, Colors.cyan, shortName: 'R'),
  inTransit('In Transit', Colors.orangeAccent, textColor: Colors.black, shortName: 'T'),
  delivered('Delivered', Colors.green, shortName: 'D');

  final String value;
  final Color color;
  final Color textColor;
  final String shortName;

  const FreightStatus(
    this.value,
    this.color, {
    this.textColor = Colors.white,
    required this.shortName,
  });
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
