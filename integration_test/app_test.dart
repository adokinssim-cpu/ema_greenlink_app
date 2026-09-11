import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ema_greenlink_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Test intégration 1
  testWidgets('App démarre et affiche le splash', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.text('EMA GreenLink'), findsWidgets);
  });

  // Test intégration 2
  testWidgets('Navigation splash → home fonctionne', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 3));
    expect(find.byType(app.EmaGreenLinkApp), findsOneWidget);
  });
}
