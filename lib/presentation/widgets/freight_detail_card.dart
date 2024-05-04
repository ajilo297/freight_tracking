/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

class FreightDetailCard extends StatelessWidget {
  const FreightDetailCard({
    super.key,
    required this.freight,
  });

  final FreightEntity freight;

  @override
  Widget build(BuildContext context) {
    final df = DateFormat('dd-MM-yyyy');
    final theme = Theme.of(context);

    final style = theme.textTheme.bodyLarge?.copyWith();
    return Column(
      children: [
        ColumnCard(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _LabelContainer(
              key: const Key('freightId'),
              label: 'Freight ID',
              child: Text(freight.id.toString().padLeft(6, '0'), style: style),
            ),
            _LabelContainer(
              key: const Key('origin'),
              label: 'Origin',
              child: Text(
                freight.origin,
                style: style,
              ),
            ),
            _LabelContainer(
              key: const Key('destination'),
              label: 'Destination',
              child: Text(
                freight.destination,
                style: style,
              ),
            ),
            _LabelContainer(
              key: const Key('status'),
              label: 'Status',
              child: Wrap(
                spacing: padding,
                children: FreightStatus.values.map((e) {
                  return ActionChip(
                    label: Text(e.value),
                    color: e == freight.status ? MaterialStatePropertyAll(e.color) : null,
                    onPressed: () => context.read<FreightDetailCubit>().update(
                          freight.copyWith(status: e),
                        ),
                  );
                }).toList(),
              ),
            ),
            _LabelContainer(
              key: const Key('loadOwner'),
              label: 'Load Owner',
              child: Text(
                freight.loadOwnerName,
                style: style,
              ),
            ),
            _LabelContainer(
              key: const Key('loadOwnerPhone'),
              label: 'Load Owner Phone',
              child: Text(
                freight.loadOwnerPhone,
                style: style,
              ),
            ),
            _LabelContainer(
              key: const Key('orderDate'),
              label: 'Order Date',
              child: Text(
                df.format(freight.orderDate),
                style: style,
              ),
            ),
            _LabelContainer(
              key: const Key('dispatchDate'),
              label: 'Dispatch Date',
              child: Text(
                freight.dispatchDate == null ? '-' : df.format(freight.dispatchDate!),
                style: style,
              ),
            ),
            _LabelContainer(
              key: const Key('eta'),
              label: 'ETA',
              child: Text(
                df.format(freight.eta),
                style: style,
              ),
            ),
            _LabelContainer(
              key: const Key('deliveryDate'),
              label: 'Delivery Date',
              child: Text(
                freight.deliveryDate == null ? '-' : df.format(freight.deliveryDate!),
                style: style,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _LabelContainer extends StatelessWidget {
  const _LabelContainer({
    super.key,
    required this.label,
    required this.child,
  });

  final String label;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        child,
        vSpacer2,
      ],
    );
  }
}
