/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

@RoutePage()
class FreightListPage extends StatelessWidget {
  const FreightListPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Freight List'),
          actions: const [
            LogoutButton(),
          ],
        ),
        body: BlocBuilder<FreightListCubit, FreightListState>(
          builder: (context, state) => FreightList(
            freightList: state.data,
            loading: state.loading,
            onFreightSelected: (freight) => context.router.push(FreightDetailsRoute(freight: freight)),
            refresh: () async => context.read<FreightListCubit>().loadList(),
          ),
        ),
      );
}
