/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

@RoutePage()
class FreightListPage extends StatelessWidget {
  const FreightListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FilledButton(
          onPressed: () {
            context.read<AuthCubit>().logout();
          },
          child: const Text('Sign Out'),
        ),
      ),
    );
  }
}
