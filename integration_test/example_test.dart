import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_sandbox/main.dart';

void main() {
  patrolTest(
    'patrol_test',
    nativeAutomation: true,
    ($) async {
      await $.pumpWidgetAndSettle(const MyApp());
      expect($('Flutter Demo Home Page'), findsOneWidget);
      await $(FloatingActionButton).tap();
      await $(FloatingActionButton).tap();
      await $(FloatingActionButton).tap();
      expect(find.text('3'), findsOneWidget);
      await $.native.openNotifications();
      await $.native.closeNotifications();
      await $.native.pressHome();
      await $.native.openApp();
    },
  );
}
