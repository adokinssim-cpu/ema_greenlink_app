import 'package:flutter_test/flutter_test.dart';
import 'package:ema_greenlink_app/data/mock_products.dart';

void main() {
  test('Premier produit a un ID valide', () {
    expect(mockProducts.first.id.isNotEmpty, true);
  });

  test('Tous les produits ont un prix positif', () {
    for (final p in mockProducts) {
      expect(p.price > 0, true);
    }
  });

  test('Tous les produits ont un stock positif', () {
    for (final p in mockProducts) {
      expect(p.stock > 0, true);
    }
  });
}
