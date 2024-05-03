/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

export 'user/user.dart';

part 'entity.mapper.dart';

@MappableClass()
abstract class Entity with EntityMappable {
  const Entity();
}
