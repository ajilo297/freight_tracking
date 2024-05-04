/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

export 'auth_cubit/auth_cubit.dart';
export 'freight_list_cubit/freight_list_cubit.dart';

mixin ExceptionEmitter<T> on Cubit<T> {
  @visibleForOverriding
  T? get loadingState => null;

  void emitInitialOnException(Future<void> Function() future) async {
    final T initialState = state;
    if (loadingState != null) emit(loadingState as T);
    try {
      await future.call();
    } catch (_) {
      emit(initialState);
      rethrow;
    }
  }
}
