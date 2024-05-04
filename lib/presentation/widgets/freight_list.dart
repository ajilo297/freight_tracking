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
    required this.refresh,
  });

  final List<FreightEntity> freightList;
  final bool loading;

  final void Function(FreightEntity freight) onFreightSelected;

  final Future<void> Function() refresh;

  @override
  Widget build(BuildContext context) {
    if (freightList.isEmpty) {
      return RefreshIndicator(
        onRefresh: refresh,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Center(
                child: loading ? const CircularProgressIndicator() : const Text('No freight deliveries found'),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: refresh,
            child: ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, index) => FreightListTile(
                onTap: () => onFreightSelected(
                  freightList.elementAt(index),
                ),
                freight: freightList.elementAt(index),
              ),
              itemCount: freightList.length,
            ),
          ),
        ),
        if (loading) const LinearProgressIndicator(),
      ],
    );
  }
}
