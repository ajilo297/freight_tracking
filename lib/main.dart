/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

void main() {
  runZonedGuarded(
    () async {
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
            child: FreightTrackingApp(appRouter: AppRouter(authCubit: authCubit), authCubit: authCubit),
          ),
        ),
      );
    },
    (error, stack) {
      final state = scaffoldKey.currentState;
      if (state == null) {
        log(error.toString());
        debugPrintStack(stackTrace: stack);
        return;
      }

      if (error is AppDatabaseExceptions) {
        state.showSnackBar(SnackBar(content: Text(error.message)));
      } else {
        state.showSnackBar(const SnackBar(content: Text('An unexpected error occurred')));
        log(error.toString());
        debugPrintStack(stackTrace: stack);
      }
    },
  );
}
