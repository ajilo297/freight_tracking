/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

class AuthUseCase {
  const AuthUseCase(this.userRepository);

  final UserRepository userRepository;

  Future<UserEntity?> autoLogin() async {
    // TODO(ajilo297) : Implement autoLogin
    throw UnimplementedError();
  }

  Future<UserEntity?> login(String email, String hashedPassword) async {
    // TODO(ajilo297) : Implement login
    throw UnimplementedError();
  }

  Future<UserEntity?> register(String email, String name, String hashedPassword) async {
    // TODO(ajilo297) : Implement register
    throw UnimplementedError();
  }

  Future<void> logout() async {
    // TODO(ajilo297) : Implement logout
    throw UnimplementedError();
  }

  Future<String> getHashedPassword(String password) async {
    // TODO(ajilo297) : Implement getHashedPassword
    throw UnimplementedError();
  }
}
