/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:freight_tracking/app_barrel.dart';

class FreightListTile extends StatelessWidget {
  const FreightListTile({super.key, required this.freight});

  final FreightEntity freight;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text('${freight.origin} -> ${freight.destination}'),
        leading: Chip(
          label: Text(
            freight.status.shortName,
            style: TextStyle(
              color: freight.status.textColor,
            ),
          ),
          backgroundColor: freight.status.color,
        ),
      ),
    );
  }
}
