/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';

void main() {
  final now = DateTime.now();

  final freights = List.generate(
      10,
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
            onFreightSelected: (freight) {},
            refresh: () async {},
          ),
        ),
      );

      expect(find.byType(FreightList, skipOffstage: false), findsOneWidget);
      expect(find.byType(FreightListTile, skipOffstage: false), findsNWidgets(freights.length));
    },
  );

  testWidgets(
    'Freight List Widget UI is rendered with loading indicator',
    (widgetTester) async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: FreightList(
            freightList: const [],
            loading: true,
            onFreightSelected: (freight) {},
            refresh: () async {},
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
        MaterialApp(
          home: FreightList(
            freightList: const [],
            loading: false,
            onFreightSelected: (freight) {},
            refresh: () async {},
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
            onFreightSelected: (freight) {},
            refresh: () async {},
          ),
        ),
      );

      expect(find.byType(FreightList), findsOneWidget);
      expect(find.byType(FreightListTile, skipOffstage: false), findsNWidgets(freights.length));
      expect(find.byType(LinearProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'On selecting a freight, onFreightSelected callback is called with the selected freight',
    (widgetTester) async {
      FreightEntity? selectedFreight;
      await widgetTester.pumpWidget(
        MaterialApp(
          home: FreightList(
            freightList: freights,
            loading: false,
            onFreightSelected: (freight) {
              selectedFreight = freight;
            },
            refresh: () async {},
          ),
        ),
      );

      await widgetTester.tap(find.byType(FreightListTile).first);
      expect(selectedFreight, freights.first);
    },
  );

  testWidgets(
    'On refreshing the list, refresh callback is called',
    (tester) async {
      final SemanticsHandle handle = tester.ensureSemantics();
      bool refreshCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          home: FreightList(
            freightList: freights,
            loading: false,
            onFreightSelected: (freight) {},
            refresh: () async {
              refreshCalled = true;
            },
          ),
        ),
      );

      expect(find.text('ORIGIN 1 - DESTINATION 1'), findsOneWidget);

      await tester.fling(find.text('ORIGIN 1 - DESTINATION 1'), const Offset(0.0, 300.0), 1000.0);
      expect(
          tester.getSemantics(find.byType(RefreshProgressIndicator)),
          matchesSemantics(
            label: 'Refresh',
          ));

      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));
      await tester.pump(const Duration(seconds: 1));

      expect(refreshCalled, true);

      handle.dispose();
    },
  );
}
