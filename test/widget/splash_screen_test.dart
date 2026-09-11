import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:ema_greenlink_app/screens/splash_screen.dart';

Widget buildSplash() {
  final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (_, __) => const SplashScreen()),
    GoRoute(path: '/home', builder: (_, __) => const Scaffold()),
  ]);
  return MaterialApp.router(routerConfig: router);
}

void main() {
  testWidgets('SplashScreen affiche EMA GreenLink', (tester) async {
    await tester.pumpWidget(buildSplash());
    await tester.pump();
    expect(find.text('EMA GreenLink'), findsOneWidget);
  });

  testWidgets('SplashScreen affiche CircularProgressIndicator', (tester) async {
    await tester.pumpWidget(buildSplash());
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
