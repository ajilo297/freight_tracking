/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

export 'auth_form_page.dart';
export 'login_page.dart';
export 'sign_up_page.dart';

@RoutePage()
final class AuthenticatedWrapperPage extends StatelessWidget implements AutoRouteWrapper {
  const AuthenticatedWrapperPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) => const AutoRouter();

  @override
  Widget wrappedRoute(BuildContext context) => RepositoryProvider(
        create: (context) => LocalFreightRepository(context.read<AppDatabase>()),
        child: BlocProvider(
          create: (context) => FreightListCubit(
            FreightUseCase(
              context.read<LocalFreightRepository>(),
            ),
          )..loadList(),
          child: this,
        ),
      );
}

@RoutePage()
final class UnauthenticatedWrapperPage extends StatelessWidget implements AutoRouteWrapper {
  const UnauthenticatedWrapperPage({
    super.key,
    this.onLoginSuccess,
  });

  final void Function(BuildContext context)? onLoginSuccess;

  @override
  Widget build(BuildContext context) => const AutoRouter();

  @override
  Widget wrappedRoute(BuildContext context) => BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthenticatedState) {
            onLoginSuccess?.call(context);
          }
        },
        listenWhen: (previous, current) => previous != current && current is AuthenticatedState,
        child: this,
      );
}

final loginRoutes = [
  AutoRoute(
    page: LoginRoute.page,
    path: 'login',
    initial: true,
  ),
  AutoRoute(
    page: SignUpRoute.page,
    path: 'sign-up',
  ),
];
