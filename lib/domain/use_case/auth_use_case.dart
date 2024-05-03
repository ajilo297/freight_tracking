/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

class AuthUseCase {
  const AuthUseCase(this.userRepository);

  final UserRepository userRepository;

  Future<UserEntity?> autoLogin() async {
    final currentUser = await userRepository.getCurrentLoggedInUser();
    return currentUser;
  }

  Future<UserEntity?> login(String email, String hashedPassword) async {
    final user = await userRepository.readUserByCredentials(
      email: email,
      hashedPassword: hashedPassword,
    );

    if (user == null) return null;

    await userRepository.updateUserLoggedInStatus(user);
    return user;
  }

  Future<UserEntity?> register(String email, String name, String hashedPassword) async {
    final user = await userRepository.create(
      email: email,
      name: name,
      hashedPassword: hashedPassword,
    );

    if (user == null) return null;

    await userRepository.updateUserLoggedInStatus(
      user,
      isLoggedIn: true,
    );
    return user;
  }

  Future<void> logout() async {
    final user = await userRepository.getCurrentLoggedInUser();
    if (user == null) return;

    await userRepository.updateUserLoggedInStatus(
      user,
      isLoggedIn: false,
    );
  }

  String getHashedPassword(String password) {
    final bytes = utf8.encode(password);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}
