/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

abstract class AuthFormPage extends StatelessWidget {
  const AuthFormPage({super.key, required this.type});

  final AuthFormType type;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: ColumnCard(
            children: [
              Text(
                key: const Key('authFormTitle'),
                type.title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              vSpacer2,
              ReactiveFormBuilder(
                form: _form,
                builder: (context, formGroup, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (type == AuthFormType.signUp) ...[
                        ReactiveTextField(
                          key: const Key('nameField'),
                          formControlName: 'name',
                          decoration: const InputDecoration(labelText: 'Name'),
                          validationMessages: {
                            ValidationMessage.required: (_) => 'Name is required',
                            ValidationMessage.minLength: (_) => 'Name is too short',
                            ValidationMessage.maxLength: (_) => 'Name is too long',
                          },
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.words,
                          onTapOutside: (_) => FocusScope.of(context).unfocus(),
                        ),
                        vSpacer,
                      ],
                      ReactiveTextField(
                        key: const Key('emailField'),
                        formControlName: 'email',
                        decoration: const InputDecoration(labelText: 'Email'),
                        validationMessages: {
                          ValidationMessage.required: (_) => 'Email is required',
                          ValidationMessage.email: (_) => 'Invalid email',
                        },
                        keyboardType: TextInputType.emailAddress,
                        textCapitalization: TextCapitalization.none,
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                      ),
                      vSpacer,
                      ReactiveTextField(
                        key: const Key('passwordField'),
                        formControlName: 'password',
                        decoration: const InputDecoration(labelText: 'Password'),
                        obscureText: true,
                        validationMessages: {
                          ValidationMessage.required: (_) => 'Password is required',
                          ValidationMessage.minLength: (_) => 'Password is too short',
                          ValidationMessage.maxLength: (_) => 'Password is too long',
                        },
                        keyboardType: TextInputType.visiblePassword,
                        onTapOutside: (_) => FocusScope.of(context).unfocus(),
                      ),
                      vSpacer2,
                      vSpacer2,
                      ReactiveFormConsumer(
                        builder: (context, formGroup, child) => BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) => FilledButton(
                            key: const Key('authFormButton'),
                            onPressed: formGroup.valid && state is! AuthLoadingState
                                ? () {
                                    final cubit = context.read<AuthCubit>();

                                    final email = formGroup.control('email').value;
                                    final password = formGroup.control('password').value;

                                    if (type == AuthFormType.signUp) {
                                      cubit.register(
                                        name: formGroup.control('name').value,
                                        email: email,
                                        password: password,
                                      );
                                    } else {
                                      cubit.login(
                                        email: email,
                                        password: password,
                                      );
                                    }
                                  }
                                : null,
                            child: Text(type.title),
                          ),
                        ),
                      ),
                      vSpacer,
                      TextButton(
                        key: const Key('authFormSwitchButton'),
                        onPressed: () => onSwitchPage(context),
                        child: Text(type.switchPageTitle),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      );

  void onSwitchPage(BuildContext context);

  FormGroup _form() => FormGroup({
        'email': FormControl<String>(validators: [
          Validators.required,
          Validators.email,
        ]),
        'password': FormControl<String>(validators: [
          Validators.required,
          Validators.minLength(6),
          Validators.maxLength(24),
        ]),
        if (type == AuthFormType.signUp)
          'name': FormControl<String>(validators: [
            Validators.required,
            Validators.minLength(2),
            Validators.maxLength(24),
          ]),
      });
}

enum AuthFormType {
  login(
    title: 'Login',
    switchPageTitle: "Don't have an account? Sign Up",
  ),
  signUp(
    title: 'Sign Up',
    switchPageTitle: 'Already have an account? Login',
  );

  final String title;
  final String switchPageTitle;

  const AuthFormType({
    required this.title,
    required this.switchPageTitle,
  });
}
