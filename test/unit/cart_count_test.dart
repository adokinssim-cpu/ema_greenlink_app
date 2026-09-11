import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ema_greenlink_app/providers/cart_provider.dart';
import 'package:ema_greenlink_app/models/product.dart';

const p = Product(
  id: '1',
  nameEn: 'A',
  nameFr: 'A',
  descriptionEn: 'A',
  descriptionFr: 'A',
  price: 10000,
  category: 'solar',
  imageUrl: 'https://test.com',
  stock: 5,
);

void main() {
  test('cartCountProvider est 0 au départ', () {
    final container = ProviderContainer();
    expect(container.read(cartCountProvider), 0);
    container.dispose();
  });

  test('cartCountProvider augmente après ajout', () {
    final container = ProviderContainer();
    container.read(cartProvider.notifier).addProduct(p);
    container.read(cartProvider.notifier).addProduct(p);
    expect(container.read(cartCountProvider), 2);
    container.dispose();
  });
}
