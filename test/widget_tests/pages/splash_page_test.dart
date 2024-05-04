/*
 * Copyright (c) 2024 Ajil Oommen. All Rights Reserved
 */

import 'package:flutter_test/flutter_test.dart';
import 'package:freight_tracking/app_barrel.dart';

void main() {
  testWidgets('SplashPage has a title ', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: SplashPage()));

    expect(find.text('Freight Tracking'), findsOneWidget);
  });
}
