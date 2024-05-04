/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final db = AppDatabase();

  final AuthCubit authCubit = AuthCubit.instance
    ..useCase = AuthUseCase(LocalUserRepository(db))
    ..autoLogin();

  runApp(
    RepositoryProvider<AppDatabase>.value(
      value: db,
      child: BlocProvider<AuthCubit>.value(
        value: authCubit,
        child: FreightTrackingApp(
          appRouter: AppRouter(authCubit: authCubit),
          authCubit: authCubit,
        ),
      ),
    ),
  );
}
