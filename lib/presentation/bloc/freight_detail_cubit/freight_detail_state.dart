/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

part of 'freight_detail_cubit.dart';

@freezed
class FreightDetailState with _$FreightDetailState {
  const factory FreightDetailState({
    @Default(false) bool loading,
    required FreightEntity freight,
  }) = _FreightDetailState;
}
