/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with ExceptionEmitter<AuthState> {
  AuthCubit(this._useCase) : super(const UnauthenticatedState());

  final AuthUseCase _useCase;

  @override
  AuthState get loadingState => const AuthLoadingState();

  void autoLogin() {
    emitInitialOnException(() async {
      final user = await _useCase.autoLogin();
      if (user != null) {
        emit(AuthenticatedState(user));
      } else {
        emit(const UnauthenticatedState());
      }
    });
  }

  void login({required String email, required String password}) {
    emitInitialOnException(() async {
      final hashedPassword = _useCase.getHashedPassword(password);
      final user = await _useCase.login(email, hashedPassword);
      if (user != null) {
        emit(AuthenticatedState(user));
      } else {
        emit(const UnauthenticatedState());
      }
    });
  }

  void logout() {
    emitInitialOnException(() async {
      await _useCase.logout();
      emit(const UnauthenticatedState());
    });
  }

  void register({
    required String email,
    required String name,
    required String password,
  }) {
    emitInitialOnException(() async {
      final hashedPassword = _useCase.getHashedPassword(password);
      final user = await _useCase.register(email, name, hashedPassword);
      if (user != null) {
        emit(AuthenticatedState(user));
      } else {
        emit(const UnauthenticatedState());
      }
    });
  }
}
