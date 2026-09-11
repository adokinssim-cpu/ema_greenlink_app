import 'package:flutter_test/flutter_test.dart';
import 'package:ema_greenlink_app/providers/cart_provider.dart';
import 'package:ema_greenlink_app/models/product.dart';

void main() {
  const product = Product(
    id: 'test1',
    nameEn: 'Test Panel',
    nameFr: 'Panneau Test',
    descriptionEn: 'Test',
    descriptionFr: 'Test FR',
    price: 50000,
    category: 'solar',
    imageUrl: 'https://test.com/img.jpg',
    stock: 5,
  );

  test('CartItem copyWith change la quantité', () {
    const item = CartItem(product: product, quantity: 1);
    final updated = item.copyWith(quantity: 3);
    expect(updated.quantity, 3);
    expect(updated.product.id, 'test1');
  });

  test('CartItem garde le même produit après copyWith', () {
    const item = CartItem(product: product, quantity: 2);
    final updated = item.copyWith(quantity: 5);
    expect(updated.product.price, 50000);
  });
}
