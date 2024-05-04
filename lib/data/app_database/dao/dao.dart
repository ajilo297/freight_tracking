/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:drift/drift.dart';

export 'freight_dao/freight_dao.dart';
export 'user_dao/user_dao.dart';

Expression<bool> buildAnd<T extends Table>(T table, Iterable<Expression<bool>> iterable) {
  if (iterable.isEmpty) return const Constant(true);
  final result = iterable.reduce((value, element) => value & element);

  return result.equals(true);
}
