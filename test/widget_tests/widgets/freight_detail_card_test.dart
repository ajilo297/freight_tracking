/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';

void main() {
  final now = DateTime.now();
  final format = DateFormat('dd-MM-yyyy');
  final formattedDate = format.format(now);

  final freight = FreightEntity(
    id: 1,
    origin: 'testOrigin',
    destination: 'testDestination',
    loadOwnerName: 'testOwnerName',
    loadOwnerPhone: 'testOwnerPhone',
    status: FreightStatus.inTransit,
    eta: now,
    orderDate: now,
    deliveryDate: null,
    dispatchDate: null,
  );

  testWidgets('description', (widgetTester) async {
    await widgetTester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListView(
            children: [
              FreightDetailCard(freight: freight),
            ],
          ),
        ),
      ),
    );

    expect(find.byType(FreightDetailCard), findsOneWidget);
    expect(find.byType(ColumnCard), findsOneWidget);

    expect(find.text('Freight ID'), findsOneWidget);
    expect(find.text('Origin'), findsOneWidget);
    expect(find.text('Destination'), findsOneWidget);
    expect(find.text('Status'), findsOneWidget);
    expect(find.text('Load Owner'), findsOneWidget);
    expect(find.text('Load Owner Phone'), findsOneWidget);
    expect(find.text('Order Date'), findsOneWidget);
    expect(find.text('ETA'), findsOneWidget);
    expect(find.text('Dispatch Date'), findsOneWidget);
    expect(find.text('Delivery Date'), findsOneWidget);

    expect(find.text('000001'), findsOneWidget);
    expect(find.text('testOrigin'), findsOneWidget);
    expect(find.text('testDestination'), findsOneWidget);
    expect(find.text('In Transit'), findsOneWidget);
    expect(find.text('testOwnerName'), findsOneWidget);
    expect(find.text('testOwnerPhone'), findsOneWidget);
    expect(find.text(formattedDate), findsNWidgets(2));
    expect(find.text('-'), findsNWidgets(2));
  });
}
