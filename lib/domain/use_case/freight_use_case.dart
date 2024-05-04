/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

class FreightUseCase {
  const FreightUseCase(this._freightRepository);

  final FreightRepository _freightRepository;

  Future<FreightEntity?> create(FreightEntity freight) async {
    final entity = await _freightRepository.create(freight);
    return entity;
  }

  Future<FreightEntity?> read(FreightEntityFilter filter) async {
    final entity = await _freightRepository.read(filter);
    return entity;
  }

  Future<List<FreightEntity>> readList(FreightEntityFilter filter) async {
    final entities = await _freightRepository.readList(filter);
    return entities;
  }

  Future<FreightEntity?> update(FreightEntity freight) async {
    final entity = await _freightRepository.update(freight);
    return entity;
  }

  Future<void> delete(FreightEntityFilter filter) async {
    await _freightRepository.delete(filter);
  }
}
