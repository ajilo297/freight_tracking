/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

abstract interface class UserRepository implements Repository<UserEntity> {
  Future<UserEntity?> getCurrentLoggedInUser();

  Future<UserEntity?> readUserByCredentials({
    required String email,
    required String hashedPassword,
  });

  Future<UserEntity?> create({
    required String email,
    required String name,
    required String hashedPassword,
  });

  Future<void> updateUserLoggedInStatus(UserEntity user, {bool isLoggedIn = true});

  Future<void> logout();
}
