import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:ema_greenlink_app/screens/cart_screen.dart';
import 'package:ema_greenlink_app/l10n/app_localizations.dart';

Widget buildCart() {
  final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (_, __) => const CartScreen()),
  ]);
  return ProviderScope(
    child: MaterialApp.router(
      routerConfig: router,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    ),
  );
}

void main() {
  testWidgets('CartScreen affiche icône panier vide', (tester) async {
    await tester.pumpWidget(buildCart());
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.shopping_cart_outlined), findsOneWidget);
  });

  testWidgets('CartScreen affiche un Scaffold', (tester) async {
    await tester.pumpWidget(buildCart());
    await tester.pumpAndSettle();
    expect(find.byType(Scaffold), findsOneWidget);
  });
}
