import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:ema_greenlink_app/screens/home_screen.dart';
import 'package:ema_greenlink_app/l10n/app_localizations.dart';

Widget buildHome() {
  final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
    GoRoute(path: '/cart', builder: (_, __) => const Scaffold()),
    GoRoute(path: '/profile', builder: (_, __) => const Scaffold()),
    GoRoute(path: '/product', builder: (_, __) => const Scaffold()),
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
  testWidgets('HomeScreen affiche une AppBar', (tester) async {
    await tester.pumpWidget(buildHome());
    await tester.pumpAndSettle();
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets('HomeScreen affiche icône panier', (tester) async {
    await tester.pumpWidget(buildHome());
    await tester.pumpAndSettle();
    expect(find.byIcon(Icons.shopping_cart), findsOneWidget);
  });
}
