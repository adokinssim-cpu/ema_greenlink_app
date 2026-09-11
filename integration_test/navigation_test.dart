import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ema_greenlink_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('App démarre correctement', (tester) async {
    app.main();
    await tester.pumpAndSettle(const Duration(seconds: 1));
    expect(find.byType(app.EmaGreenLinkApp), findsOneWidget);
  });

  testWidgets('Splash affiche le logo EMA', (tester) async {
    app.main();
    await tester.pump();
    expect(find.text('EMA GreenLink'), findsWidgets);
  });
}
