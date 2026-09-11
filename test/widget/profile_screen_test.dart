import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:ema_greenlink_app/screens/profile_screen.dart';
import 'package:ema_greenlink_app/l10n/app_localizations.dart';

Widget buildProfile() {
  final router = GoRouter(routes: [
    GoRoute(path: '/', builder: (_, __) => const ProfileScreen()),
  ]);
  return MaterialApp.router(
    routerConfig: router,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
  );
}

void main() {
  testWidgets('ProfileScreen affiche Marc ADOKINSSI', (tester) async {
    await tester.pumpWidget(buildProfile());
    await tester.pumpAndSettle();
    expect(find.text('Marc ADOKINSSI'), findsOneWidget);
  });

  testWidgets('ProfileScreen affiche avatar', (tester) async {
    await tester.pumpWidget(buildProfile());
    await tester.pumpAndSettle();
    expect(find.byType(CircleAvatar), findsOneWidget);
  });
}
