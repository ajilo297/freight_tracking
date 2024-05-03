/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

abstract interface class UserRepository<T extends Entity> {
  Future<T?> getCurrentLoggedInUser();

  Future<T?> readUserByCredentials({
    required String email,
    required String hashedPassword,
  });

  Future<T?> create({
    required String email,
    required String name,
    required String hashedPassword,
  });

  Future<void> updateUserLoggedInStatus(T user, {bool isLoggedIn = true});

  Future<void> logout();
}
