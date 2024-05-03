/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitialState;

  const factory AuthState.loading() = AuthLoadingState;

  const factory AuthState.authenticated(UserEntity user) = AuthenticatedState;

  const factory AuthState.unauthenticated() = UnauthenticatedState;
}
