/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

class AuthLoginListener extends StatelessWidget {
  const AuthLoginListener({
    super.key,
    required this.onLoginSuccess,
    required this.child,
  });

  final void Function(BuildContext context)? onLoginSuccess;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthenticatedState) {
          onLoginSuccess?.call(context);
        }
      },
      listenWhen: (previous, current) => previous != current && current is AuthenticatedState,
      child: child,
    );
  }
}
