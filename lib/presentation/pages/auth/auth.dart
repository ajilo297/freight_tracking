/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

export 'auth_form_page.dart';
export 'login_page.dart';
export 'sign_up_page.dart';

@RoutePage()
final class AuthenticatedWrapperPage extends StatelessWidget {
  const AuthenticatedWrapperPage({super.key});

  @override
  Widget build(BuildContext context) => const FreightListCubitProvider(child: AutoRouter());
}

@RoutePage()
final class UnauthenticatedWrapperPage extends StatelessWidget {
  const UnauthenticatedWrapperPage({
    super.key,
    this.onLoginSuccess,
  });

  final void Function(BuildContext context)? onLoginSuccess;

  @override
  Widget build(BuildContext context) => AuthLoginListener(
        onLoginSuccess: onLoginSuccess,
        child: const AutoRouter(),
      );
}

final loginRoutes = [
  AutoRoute(page: LoginRoute.page, path: 'login', initial: true),
  AutoRoute(page: SignUpRoute.page, path: 'sign-up'),
];
