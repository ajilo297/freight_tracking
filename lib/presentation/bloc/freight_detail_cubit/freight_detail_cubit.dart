/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

part 'freight_detail_cubit.freezed.dart';

part 'freight_detail_state.dart';

class FreightDetailCubit extends Cubit<FreightDetailState> {
  FreightDetailCubit({
    required FreightEntity freightEntity,
    required this.useCase,
  }) : super(FreightDetailState(loading: false, freight: freightEntity));

  final FreightUseCase useCase;

  void update(FreightEntity freightEntity) async {
    emit(state.copyWith(loading: true));
    await useCase.update(freightEntity);
    emit(state.copyWith(freight: freightEntity, loading: false));
  }
}
