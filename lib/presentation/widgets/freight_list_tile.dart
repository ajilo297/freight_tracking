/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

class FreightListTile extends StatelessWidget {
  const FreightListTile({
    super.key,
    required this.freight,
    required this.onTap,
  });

  final FreightEntity freight;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final format = DateFormat('dd-MM-yyyy');

    final style = theme.textTheme.labelSmall?.copyWith(
      fontWeight: FontWeight.w600,
    );

    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(
          '${freight.origin} - ${freight.destination}'.toUpperCase(),
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: padding,
              children: [
                Text('ORDER DATE: ${format.format(freight.orderDate)}', style: style),
                Text('ETA: ${format.format(freight.eta)}', style: style),
              ],
            ),
            vSpacer2,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: padding),
              decoration: ShapeDecoration(
                shape: const RoundedRectangleBorder(borderRadius: borderRadius),
                color: freight.status.color,
              ),
              child: Text(
                freight.status.value.toUpperCase(),
                style: style?.copyWith(
                  color: freight.status.textColor,
                ),
              ),
            ),
          ],
        ),
        trailing: Text(
          '${freight.id}'.padLeft(3, '0'),
          style: theme.textTheme.bodyMedium?.copyWith(
            fontFeatures: [const FontFeature.tabularFigures()],
          ),
        ),
      ),
    );
  }
}
