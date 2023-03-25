import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integ_test/features/home/screens/home_screen.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integ_test/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("end to end test", () {
    testWidgets("Verify login screen with correct login and password",
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.enterText(find.byType(TextField).at(0), "username");
      await tester.enterText(find.byType(TextField).at(1), "123456789");
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets(
      "verify Dialog with incorrect username and password",
      (tester) async {
        app.main();
        await tester.pumpAndSettle();
        await tester.enterText(find.byType(TextField).at(0), "username");
        await tester.enterText(find.byType(TextField).at(1), "12345678");
        await tester.tap(find.byType(ElevatedButton));
        await tester.pumpAndSettle();
        expect(find.byType(AlertDialog), findsOneWidget);
      },
    );
  });
}
