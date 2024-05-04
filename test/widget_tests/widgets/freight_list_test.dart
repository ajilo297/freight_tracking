/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';

void main() {
  final now = DateTime.now();

  final freights = List.generate(
      5,
      (index) => FreightEntity(
            id: index,
            origin: 'Origin $index',
            destination: 'Destination $index',
            status: FreightStatus.values[index % FreightStatus.values.length],
            loadOwnerName: 'Owner $index',
            loadOwnerPhone: '1234567890',
            eta: now.add(Duration(days: index)),
            orderDate: now.subtract(Duration(days: index)),
          ));

  testWidgets(
    'Freight List Widget UI is rendered',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: FreightList(
            freightList: freights,
            loading: false,
          ),
        ),
      );

      expect(find.byType(FreightList), findsOneWidget);
      expect(find.byType(FreightListTile), findsNWidgets(freights.length));
    },
  );

  testWidgets(
    'Freight List Widget UI is rendered with loading indicator',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: FreightList(
            freightList: [],
            loading: true,
          ),
        ),
      );

      expect(find.byType(FreightList), findsOneWidget);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'Freight List Widget UI is rendered with no freights',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: FreightList(
            freightList: [],
            loading: false,
          ),
        ),
      );

      expect(find.byType(FreightList), findsOneWidget);
      expect(find.text('No freight deliveries found'), findsOneWidget);
    },
  );

  testWidgets(
    'Freight List Widget UI is rendered with freights and loading indicator',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: FreightList(
            freightList: freights,
            loading: true,
          ),
        ),
      );

      expect(find.byType(FreightList), findsOneWidget);
      expect(find.byType(FreightListTile), findsNWidgets(freights.length));
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    },
  );
}
