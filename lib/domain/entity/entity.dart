/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

export 'freight_entity/freight_entity.dart';
export 'user_entity/user_entity.dart';

part 'entity.mapper.dart';

@MappableClass()
abstract class Entity with EntityMappable {
  const Entity();
}

@MappableClass()
abstract class EntityFilter with EntityFilterMappable {
  const EntityFilter({
    this.offset = 0,
  });

  final int offset;
}
