import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:drive_now/main.dart';

void main() {
  testWidgets('DriveNow app builds and shows its title', (WidgetTester tester) async {
    await tester.pumpWidget(const DriveNowApp());

    // The app should build without errors and display the app title.
    expect(find.text('DriveNow'), findsOneWidget);
  });
}
