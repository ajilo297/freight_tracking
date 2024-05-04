// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:freight_tracking/app_barrel.dart' as _i8;
import 'package:freight_tracking/presentation/pages/auth/auth.dart' as _i1;
import 'package:freight_tracking/presentation/pages/auth/login_page.dart'
    as _i4;
import 'package:freight_tracking/presentation/pages/auth/sign_up_page.dart'
    as _i5;
import 'package:freight_tracking/presentation/pages/freight/freight_details_page.dart'
    as _i2;
import 'package:freight_tracking/presentation/pages/freight/freight_list_page.dart'
    as _i3;
import 'package:freight_tracking/presentation/pages/splash_page.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AuthenticatedWrapperRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.WrappedRoute(child: const _i1.AuthenticatedWrapperPage()),
      );
    },
    FreightDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<FreightDetailsRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.FreightDetailsPage(
          args.freight,
          key: args.key,
        ),
      );
    },
    FreightListRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.FreightListPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LoginPage(),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashPage(),
      );
    },
    UnauthenticatedWrapperRoute.name: (routeData) {
      final args = routeData.argsAs<UnauthenticatedWrapperRouteArgs>(
          orElse: () => const UnauthenticatedWrapperRouteArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.WrappedRoute(
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
class AuthenticatedWrapperRoute extends _i7.PageRouteInfo<void> {
  const AuthenticatedWrapperRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AuthenticatedWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticatedWrapperRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FreightDetailsPage]
class FreightDetailsRoute extends _i7.PageRouteInfo<FreightDetailsRouteArgs> {
  FreightDetailsRoute({
    required _i8.FreightEntity freight,
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          FreightDetailsRoute.name,
          args: FreightDetailsRouteArgs(
            freight: freight,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'FreightDetailsRoute';

  static const _i7.PageInfo<FreightDetailsRouteArgs> page =
      _i7.PageInfo<FreightDetailsRouteArgs>(name);
}

class FreightDetailsRouteArgs {
  const FreightDetailsRouteArgs({
    required this.freight,
    this.key,
  });

  final _i8.FreightEntity freight;

  final _i8.Key? key;

  @override
  String toString() {
    return 'FreightDetailsRouteArgs{freight: $freight, key: $key}';
  }
}

/// generated route for
/// [_i3.FreightListPage]
class FreightListRoute extends _i7.PageRouteInfo<void> {
  const FreightListRoute({List<_i7.PageRouteInfo>? children})
      : super(
          FreightListRoute.name,
          initialChildren: children,
        );

  static const String name = 'FreightListRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute({List<_i7.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignUpPage]
class SignUpRoute extends _i7.PageRouteInfo<void> {
  const SignUpRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashPage]
class SplashRoute extends _i7.PageRouteInfo<void> {
  const SplashRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i1.UnauthenticatedWrapperPage]
class UnauthenticatedWrapperRoute
    extends _i7.PageRouteInfo<UnauthenticatedWrapperRouteArgs> {
  UnauthenticatedWrapperRoute({
    _i8.Key? key,
    void Function(_i8.BuildContext)? onLoginSuccess,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          UnauthenticatedWrapperRoute.name,
          args: UnauthenticatedWrapperRouteArgs(
            key: key,
            onLoginSuccess: onLoginSuccess,
          ),
          initialChildren: children,
        );

  static const String name = 'UnauthenticatedWrapperRoute';

  static const _i7.PageInfo<UnauthenticatedWrapperRouteArgs> page =
      _i7.PageInfo<UnauthenticatedWrapperRouteArgs>(name);
}

class UnauthenticatedWrapperRouteArgs {
  const UnauthenticatedWrapperRouteArgs({
    this.key,
    this.onLoginSuccess,
  });

  final _i8.Key? key;

  final void Function(_i8.BuildContext)? onLoginSuccess;

  @override
  String toString() {
    return 'UnauthenticatedWrapperRouteArgs{key: $key, onLoginSuccess: $onLoginSuccess}';
  }
}
