/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';

void main() {
  testWidgets('Freight List Tile Widget UI is rendered', (widgetTester) async {
    final now = DateTime.now();

    final freight = FreightEntity(
      id: 1,
      origin: 'Test Origin',
      destination: 'Test Destination',
      status: FreightStatus.inTransit,
      orderDate: now,
      dispatchDate: now,
      eta: now,
      loadOwnerPhone: '1234567890',
      loadOwnerName: 'Test Load Owner',
    );

    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FreightListTile(
            freight: freight,
            onTap: () => {},
          ),
        ),
      ),
    );

    expect(find.text('Test Origin -> Test Destination'), findsOneWidget);
    expect(find.text(FreightStatus.inTransit.shortName), findsOneWidget);
  });

  testWidgets('Callback is called on tap', (widgetTester) async {
    final now = DateTime.now();

    final freight = FreightEntity(
      id: 1,
      origin: 'Test Origin',
      destination: 'Test Destination',
      status: FreightStatus.inTransit,
      orderDate: now,
      dispatchDate: now,
      eta: now,
      loadOwnerPhone: '1234567890',
      loadOwnerName: 'Test Load Owner',
    );

    var tapped = false;

    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: FreightListTile(
            freight: freight,
            onTap: () => tapped = true,
          ),
        ),
      ),
    );

    await widgetTester.tap(find.byType(FreightListTile));

    expect(tapped, true);
  });
}
