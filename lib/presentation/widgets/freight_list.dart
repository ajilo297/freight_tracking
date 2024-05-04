/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

class FreightList extends StatelessWidget {
  const FreightList({
    super.key,
    this.freightList = const [],
    this.loading = false,
    required this.onFreightSelected,
  });

  final List<FreightEntity> freightList;
  final bool loading;

  final void Function(FreightEntity freight) onFreightSelected;

  @override
  Widget build(BuildContext context) {
    if (freightList.isEmpty && loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (freightList.isEmpty) {
      return const Center(
        child: Text('No freight deliveries found'),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => FreightListTile(
              onTap: () => onFreightSelected(
                freightList.elementAt(index),
              ),
              freight: freightList.elementAt(index),
            ),
            itemCount: freightList.length,
          ),
        ),
        if (loading) const LinearProgressIndicator(),
      ],
    );
  }
}
