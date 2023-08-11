import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_sandbox/main.dart';

void main() {
  patrolTest(
    'counter state is the same after going to home and switching apps',
    nativeAutomation: true,
    ($) async {
      // Replace later with your app's main widget
      await $.pumpWidgetAndSettle(const MyApp());

      expect($('Flutter Demo Home Page'), findsOneWidget);
      await $.native.pressHome();
    },
  );
}
