// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:freight_tracking/app_barrel.dart' as _i7;
import 'package:freight_tracking/presentation/pages/auth/auth.dart' as _i1;
import 'package:freight_tracking/presentation/pages/auth/login_page.dart'
    as _i3;
import 'package:freight_tracking/presentation/pages/auth/sign_up_page.dart'
    as _i4;
import 'package:freight_tracking/presentation/pages/freight/freight_list_page.dart'
    as _i2;
import 'package:freight_tracking/presentation/pages/splash_page.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AuthenticatedWrapperRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(child: const _i1.AuthenticatedWrapperPage()),
      );
    },
    FreightListRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FreightListPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignUpPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashPage(),
      );
    },
    UnauthenticatedWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<UnauthenticatedWrapperRouteArgs>(
          orElse: () => const UnauthenticatedWrapperRouteArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(
            child: _i1.UnauthenticatedWrapperPage(
          key: args.key,
          onLoginSuccess: args.onLoginSuccess,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthenticatedWrapperPage]
class AuthenticatedWrapperRoute extends _i6.PageRouteInfo<void> {
  const AuthenticatedWrapperRoute({List<_i6.PageRouteInfo>? children})
      : super(
          AuthenticatedWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticatedWrapperRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FreightListPage]
class FreightListRoute extends _i6.PageRouteInfo<void> {
  const FreightListRoute({List<_i6.PageRouteInfo>? children})
      : super(
          FreightListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FreightListRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignUpPage]
class SignUpRoute extends _i6.PageRouteInfo<void> {
  const SignUpRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashPage]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i1.UnauthenticatedWrapperPage]
class UnauthenticatedWrapperRoute
    extends _i6.PageRouteInfo<UnauthenticatedWrapperRouteArgs> {
  UnauthenticatedWrapperRoute({
    _i7.Key? key,
    void Function(_i7.BuildContext)? onLoginSuccess,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          UnauthenticatedWrapperRoute.name,
          args: UnauthenticatedWrapperRouteArgs(
            key: key,
            onLoginSuccess: onLoginSuccess,
          ),
          initialChildren: children,
        );

  static const String name = 'UnauthenticatedWrapperRoute';

  static const _i6.PageInfo<UnauthenticatedWrapperRouteArgs> page =
      _i6.PageInfo<UnauthenticatedWrapperRouteArgs>(name);
}

class UnauthenticatedWrapperRouteArgs {
  const UnauthenticatedWrapperRouteArgs({
    this.key,
    this.onLoginSuccess,
  });

  final _i7.Key? key;

  final void Function(_i7.BuildContext)? onLoginSuccess;

  @override
  String toString() {
    return 'UnauthenticatedWrapperRouteArgs{key: $key, onLoginSuccess: $onLoginSuccess}';
  }
}
