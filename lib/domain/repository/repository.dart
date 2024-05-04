/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

export 'freight_repository.dart';
export 'user_repository.dart';

abstract interface class Repository<T extends Entity> {}

abstract interface class CrudRepository<T extends Entity, F extends EntityFilter> implements Repository<T> {
  Future<T> create(T entity);

  Future<T?> read(F filter);

  Future<List<T>> readList(F filter);

  Future<T> update(T entity);

  Future<void> delete(F filter);
}
