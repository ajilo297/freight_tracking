/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

@RoutePage()
class LoginPage extends AuthFormPage {
  const LoginPage({super.key}) : super(type: AuthFormType.login);

  @override
  void onSwitchPage(BuildContext context) {
    context.router.push(const SignUpRoute());
  }
}
