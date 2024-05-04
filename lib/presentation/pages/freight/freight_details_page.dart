/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

@RoutePage()
class FreightDetailsPage extends StatelessWidget {
  const FreightDetailsPage(
    this.freight, {
    super.key,
  });

  final FreightEntity freight;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => FreightDetailCubit(
          freightEntity: freight,
          useCase: context.read<FreightUseCase>(),
        ),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Freight Details'),
          ),
          body: SingleChildScrollView(
            child: BlocConsumer<FreightDetailCubit, FreightDetailState>(
              listener: (context, state) {
                context.read<FreightListCubit>().loadList();
              },
              listenWhen: (previous, current) => previous.freight != current.freight,
              builder: (context, state) {
                return FreightDetailCard(
                  freight: state.freight,
                );
              },
            ),
          ),
        ),
      );
}
