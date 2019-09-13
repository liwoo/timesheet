import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Home Test', () {
    final headerText = find.byValueKey('homeTitle');
    final addEntryButton = find.byValueKey('addEmptyButton');
    final emptyStateMessage = find.byValueKey('emptyStateMessage');
    final createEntryDate = find.byValueKey('createEntryDate');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('it shows the Home Page Title', () async {
      expect(await driver.getText(headerText), 'Today\'s Timesheet Entries');
    });

    test('it shows empty State at first', () async {
      expect(await driver.getText(emptyStateMessage, timeout: Duration(milliseconds: 200)), 'You do not have Timesheet Entries for Today');
    });


    test('it allows you to open a create new entry page', () async {
      await driver.tap(addEntryButton);
      expect(await driver.getText(createEntryDate, timeout: Duration(milliseconds: 200)), 'Saturday, 8 June');
    });

  });
}