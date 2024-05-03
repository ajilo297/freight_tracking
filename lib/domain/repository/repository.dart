/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

export 'user_repository.dart';

abstract interface class Repository<T extends Entity> {}

abstract interface class CrudRepository<T extends Entity, I> implements Repository<T> {
  Future<T> create(T entity);

  Future<T> read(I id);

  Future<T> update(T entity);

  Future<void> delete(I id);
}
