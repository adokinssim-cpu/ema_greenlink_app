import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ema_greenlink_app/providers/products_provider.dart';

void main() {
  test('productsProvider retourne une liste non vide', () {
    final container = ProviderContainer();
    final products = container.read(productsProvider);
    expect(products.isNotEmpty, true);
    container.dispose();
  });

  test('productsProvider retourne 5 produits', () {
    final container = ProviderContainer();
    final products = container.read(productsProvider);
    expect(products.length, 5);
    container.dispose();
  });
}
