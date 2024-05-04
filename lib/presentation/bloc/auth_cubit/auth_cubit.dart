/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with ExceptionEmitter<AuthState> {
  AuthCubit.test(AuthUseCase useCase)
      : _useCase = useCase,
        super(const UnauthenticatedState());

  AuthCubit._() : super(const UnauthenticatedState());

  static final AuthCubit _instance = AuthCubit._();

  static AuthCubit get instance => _instance;

  late AuthUseCase _useCase;

  set useCase(AuthUseCase useCase) {
    _useCase = useCase;
  }

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
