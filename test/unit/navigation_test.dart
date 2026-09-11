import 'package:flutter_test/flutter_test.dart';
import 'package:ema_greenlink_app/data/mock_products.dart';

void main() {
  test('mockProducts contient des catégories variées', () {
    final categories = mockProducts.map((p) => p.category).toSet();
    expect(categories.length > 1, true);
  });

  test('Produit avec ID 1 existe dans mock', () {
    final p = mockProducts.firstWhere((p) => p.id == '1');
    expect(p.nameFr, 'Panneau Solaire 200W');
  });
}
