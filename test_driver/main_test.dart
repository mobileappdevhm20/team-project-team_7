import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('FiTrack', () {
    final welcomeText = find.byValueKey('welcomeText');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    test("starts with login screen", () async {
      expect(await driver.getText(welcomeText), "WELCOME TO");
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });
  });
}
