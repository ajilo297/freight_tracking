/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

@RoutePage()
class SignUpPage extends AuthFormPage {
  const SignUpPage({super.key}) : super(type: AuthFormType.signUp);

  @override
  void onSwitchPage(BuildContext context) {
    context.router.push(const LoginRoute());
  }
}
