import 'package:patrol/patrol.dart';
import 'package:patrol_sandbox/main.dart';

void main() {
  patrolTest('demo', nativeAutomation: true, (PatrolTester $) async {
    await $.pumpWidgetAndSettle(const MyApp());
    // prepare network conditions
    await $.native.enableCellular();
    await $.native.disableWifi();

    // toggle system theme
    await $.native.enableDarkMode();

    // handle native location permission request dialog
    await $.native.selectFineLocation();
    await $.native.grantPermissionWhenInUse();

    // tap on the first notification
    await $.native.openNotifications();
    await $.native.tapOnNotificationByIndex(0);
  });
}
