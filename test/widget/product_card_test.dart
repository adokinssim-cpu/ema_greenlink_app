import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:ema_greenlink_app/widgets/product_card.dart';
import 'package:ema_greenlink_app/models/product.dart';

const testProduct = Product(
  id: '1',
  nameEn: 'Solar Panel',
  nameFr: 'Panneau Solaire',
  descriptionEn: 'Test',
  descriptionFr: 'Test FR',
  price: 85000,
  category: 'solar',
  imageUrl: 'https://test.com/img.jpg',
  stock: 10,
);

Widget buildTestWidget() {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (_, __) => Scaffold(
          body: GridView.count(
            crossAxisCount: 2,
            children: const [ProductCard(product: testProduct)],
          ),
        ),
      ),
      GoRoute(
        path: '/product',
        builder: (_, __) => const Scaffold(body: Text('Detail')),
      ),
    ],
  );
  return ProviderScope(
    child: MaterialApp.router(routerConfig: router),
  );
}

void main() {
  // Test 16
  testWidgets('ProductCard affiche le prix', (tester) async {
    await tester.pumpWidget(buildTestWidget());
    await tester.pump();
    expect(find.textContaining('85000'), findsOneWidget);
  });

  // Test 17
  testWidgets('ProductCard affiche le bouton panier', (tester) async {
    await tester.pumpWidget(buildTestWidget());
    await tester.pump();
    expect(find.byIcon(Icons.add_shopping_cart), findsOneWidget);
  });

  // Test 18
  testWidgets('ProductCard a un Semantics label', (tester) async {
    await tester.pumpWidget(buildTestWidget());
    await tester.pump();
    expect(
      find.bySemanticsLabel(RegExp('Produit')),
      findsWidgets,
    );
  });

  // Test 19
  testWidgets('ProductCard affiche une Card', (tester) async {
    await tester.pumpWidget(buildTestWidget());
    await tester.pump();
    expect(find.byType(Card), findsOneWidget);
  });

  // Test 20
  testWidgets('Bouton panier déclenche un SnackBar', (tester) async {
    await tester.pumpWidget(buildTestWidget());
    await tester.pump();
    await tester.tap(find.byIcon(Icons.add_shopping_cart));
    await tester.pump();
    expect(find.byType(SnackBar), findsOneWidget);
  });
}
