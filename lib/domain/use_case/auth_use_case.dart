/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

class AuthUseCase {
  const AuthUseCase(this.userRepository);

  final UserRepository userRepository;

  Future<UserEntity?> autoLogin() async {
    return await userRepository.readLoggedInUser();
  }

  Future<UserEntity?> login(String email, String hashedPassword) async {
    return await userRepository.readByCredentials(
      email: email,
      hashedPassword: hashedPassword,
    );
  }

  Future<UserEntity?> register(String email, String name, String hashedPassword) async {
    return await userRepository.create(
      email: email,
      name: name,
      hashedPassword: hashedPassword,
    );
  }

  Future<void> logout() async {
    return await userRepository.logout();
  }

  String getHashedPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
