/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final useCase = AuthUseCase(LocalUserRepository(AppDatabase()));
  final AuthCubit authCubit = AuthCubit(useCase)..autoLogin();

  runApp(
    BlocProvider<AuthCubit>.value(
      value: authCubit,
      child: FreightTrackingApp(
        appRouter: AppRouter(authCubit: authCubit),
        authCubit: authCubit,
      ),
    ),
  );
}
