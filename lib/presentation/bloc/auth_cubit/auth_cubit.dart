/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with ExceptionEmitter<AuthState> {
  AuthCubit(this._authUseCase) : super(const AuthInitialState());

  final AuthUseCase _authUseCase;

  @override
  AuthState get loadingState => const AuthLoadingState();

  void autoLogin() {
    emitInitialOnException(() async {
      final user = await _authUseCase.autoLogin();
      if (user != null) {
        emit(AuthenticatedState(user));
      } else {
        emit(const UnauthenticatedState());
      }
    });
  }

  void login(String email, String password) {
    emitInitialOnException(() async {
      final hashedPassword = await _authUseCase.getHashedPassword(password);
      final user = await _authUseCase.login(email, hashedPassword);
      if (user != null) {
        emit(AuthenticatedState(user));
      } else {
        emit(const UnauthenticatedState());
      }
    });
  }

  void logout() {
    emitInitialOnException(() async {
      await _authUseCase.logout();
      emit(const UnauthenticatedState());
    });
  }

  void register({
    required String email,
    required String name,
    required String password,
  }) {
    emitInitialOnException(() async {
      final hashedPassword = await _authUseCase.getHashedPassword(password);
      final user = await _authUseCase.register(email, name, hashedPassword);
      if (user != null) {
        emit(AuthenticatedState(user));
      } else {
        emit(const UnauthenticatedState());
      }
    });
  }
}
