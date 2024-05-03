/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

sealed class AppDatabaseExceptions implements Exception {
  const AppDatabaseExceptions();

  String get title;

  String get message;
}

final class UserWithEmailExistsException extends AppDatabaseExceptions {
  const UserWithEmailExistsException();

  @override
  String get message => 'A user with this email already exists';

  @override
  String get title => 'User Exists';
}

final class InvalidCredentialsException extends AppDatabaseExceptions {
  const InvalidCredentialsException();

  @override
  String get message => 'A user with these credentials does not exist';

  @override
  String get title => 'Invalid Credentials';
}
