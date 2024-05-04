/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

export 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter implements AutoRouteGuard {
  AppRouter({required this.authCubit});

  final AuthCubit authCubit;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/splash',
          page: SplashRoute.page,
        ),
        AutoRoute(
          page: UnauthenticatedWrapperRoute.page,
          path: '/auth',
          children: loginRoutes,
        ),
        AutoRoute(
          page: AuthenticatedWrapperRoute.page,
          path: '/',
          children: [
            AutoRoute(
              page: FreightListRoute.page,
              path: 'freight',
              initial: true,
            ),
          ],
        ),
      ];

  @override
  void onNavigation(
    NavigationResolver resolver,
    StackRouter router,
  ) async {
    final state = authCubit.state;

    final bool isAuthenticated = state is AuthenticatedState;

    final unGuardedRouteNames = loginRoutes.map((e) => e.name).toList()
      ..addAll([UnauthenticatedWrapperRoute.name, SplashRoute.name]);

    if (isAuthenticated == false) {
      if (unGuardedRouteNames.contains(resolver.routeName)) {
        resolver.next();
      } else {
        await resolver.redirect(
          UnauthenticatedWrapperRoute(
            onLoginSuccess: (p0) => resolver.resolveNext(
              true,
              reevaluateNext: false,
            ),
            children: const [LoginRoute()],
          ),
          onFailure: (failure) => resolver.next(false),
        );

        if (!resolver.isResolved) {
          resolver.next(false);
        }
      }
    } else {
      if (unGuardedRouteNames.contains(resolver.routeName)) {
        if (resolver.routeName == SplashRoute.name) {
          resolver.next();
        } else {
          resolver.next(false);
          router.push(const AuthenticatedWrapperRoute());
        }
      } else {
        resolver.next();
      }
    }
  }
}
