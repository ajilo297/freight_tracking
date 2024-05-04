/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

class FreightListCubitProvider extends StatelessWidget {
  const FreightListCubitProvider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => LocalFreightRepository(context.read<AppDatabase>()),
      child: RepositoryProvider(
        create: (context) => FreightUseCase(
          context.read<LocalFreightRepository>(),
        ),
        child: BlocProvider(
          create: (context) => FreightListCubit(
            context.read<FreightUseCase>(),
          )..loadList(),
          child: child,
        ),
      ),
    );
  }
}
