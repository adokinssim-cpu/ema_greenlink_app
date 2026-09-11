import 'package:flutter_test/flutter_test.dart';
import 'package:ema_greenlink_app/data/mock_products.dart';

void main() {
  test('mockProducts contient 5 produits', () {
    expect(mockProducts.length, 5);
  });

  test('mockProducts ne sont pas vides', () {
    expect(mockProducts.isEmpty, false);
  });
}
