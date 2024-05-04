/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

class FreightTrackingApp extends StatelessWidget {
  const FreightTrackingApp({
    super.key,
    required this.appRouter,
    required this.authCubit,
  });

  final AppRouter appRouter;
  final AuthCubit authCubit;

  @override
  Widget build(BuildContext context) => MaterialApp.router(
        title: 'Freight Tracking',
        theme: AppTheme().theme,
        scaffoldMessengerKey: scaffoldKey,
        routerDelegate: appRouter.delegate(
          reevaluateListenable: ReevaluateListenable.stream(
            context.read<AuthCubit>().stream,
          ),
        ),
        routeInformationParser: appRouter.defaultRouteParser(),
      );
}
