/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

part 'freight_list_cubit.freezed.dart';
part 'freight_list_state.dart';

class FreightListCubit extends Cubit<FreightListState> with ExceptionEmitter<FreightListState> {
  FreightListCubit(this._useCase) : super(const FreightListState());

  final FreightUseCase _useCase;

  @override
  FreightListState get loadingState => state.copyWith(loading: true);

  void loadList() async {
    emitInitialOnException(() async {
      final list = await _useCase.readList(state.filter);
      emit(state.copyWith(data: list, loading: false));
    });
  }

  void loadMore() async {
    emitInitialOnException(() async {
      final filter = state.filter.copyWith(offset: state.data.length);
      final list = await _useCase.readList(filter);
      emit(state.copyWith(
        data: [...state.data, ...list],
        loading: false,
        filter: filter,
      ));
    });
  }

  void filterByStatus(FreightStatus status) {
    emitInitialOnException(() async {
      final filter = state.filter.copyWith(status: status);
      final list = await _useCase.readList(filter);
      emit(state.copyWith(data: list, filter: filter, loading: false));
    });
  }
}
