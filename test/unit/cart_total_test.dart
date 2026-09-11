import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ema_greenlink_app/providers/cart_provider.dart';
import 'package:ema_greenlink_app/models/product.dart';

void main() {
  const p1 = Product(
    id: '1',
    nameEn: 'A',
    nameFr: 'A',
    descriptionEn: 'A',
    descriptionFr: 'A',
    price: 10000,
    category: 'solar',
    imageUrl: 'https://test.com',
    stock: 1,
  );
  const p2 = Product(
    id: '2',
    nameEn: 'B',
    nameFr: 'B',
    descriptionEn: 'B',
    descriptionFr: 'B',
    price: 20000,
    category: 'inverter',
    imageUrl: 'https://test.com',
    stock: 1,
  );

  test('cartTotalProvider calcule le total correct', () {
    final container = ProviderContainer();
    container.read(cartProvider.notifier).addProduct(p1);
    container.read(cartProvider.notifier).addProduct(p2);
    final total = container.read(cartTotalProvider);
    expect(total, 30000);
    container.dispose();
  });

  test('cartTotalProvider est 0 au départ', () {
    final container = ProviderContainer();
    expect(container.read(cartTotalProvider), 0);
    container.dispose();
  });
}
