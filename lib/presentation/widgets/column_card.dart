/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

class ColumnCard extends StatelessWidget {
  const ColumnCard({
    super.key,
    this.children = const [],
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) => Card(
        margin: edgeInsets2,
        child: Padding(
          padding: edgeInsets2,
          child: Column(
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: MainAxisSize.min,
            children: children,
          ),
        ),
      );
}
