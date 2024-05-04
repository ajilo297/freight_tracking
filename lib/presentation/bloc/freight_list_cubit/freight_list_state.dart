/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

part of 'freight_list_cubit.dart';

@freezed
class FreightListState with _$FreightListState {
  const factory FreightListState({
    @Default(false) bool loading,
    @Default(<FreightEntity>[]) List<FreightEntity> data,
    @Default(FreightEntityFilter()) FreightEntityFilter filter,
  }) = _FreightListState;
}
