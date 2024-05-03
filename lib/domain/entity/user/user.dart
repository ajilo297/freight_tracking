/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

part 'user.mapper.dart';

@MappableClass()
class UserEntity extends Entity with UserEntityMappable {
  const UserEntity({
    required this.email,
    required this.hashedPassword,
    required this.name,
  });

  final String email;
  final String hashedPassword;
  final String name;
}
