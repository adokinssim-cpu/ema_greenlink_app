import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ema_greenlink_app/providers/cart_provider.dart';
import 'package:ema_greenlink_app/models/product.dart';

const testProduct1 = Product(
  id: 'p1',
  nameEn: 'Solar Panel',
  nameFr: 'Panneau Solaire',
  descriptionEn: 'Test panel',
  descriptionFr: 'Panneau test',
  price: 85000,
  category: 'solar',
  imageUrl: 'https://test.com/img.jpg',
  stock: 10,
);

const testProduct2 = Product(
  id: 'p2',
  nameEn: 'Inverter',
  nameFr: 'Onduleur',
  descriptionEn: 'Test inverter',
  descriptionFr: 'Onduleur test',
  price: 195000,
  category: 'inverter',
  imageUrl: 'https://test.com/img2.jpg',
  stock: 5,
);

void main() {
  late ProviderContainer container;
  late CartNotifier notifier;

  setUp(() {
    container = ProviderContainer();
    notifier = container.read(cartProvider.notifier);
  });

  tearDown(() => container.dispose());

  // Test 1
  test('Cart démarre vide', () {
    expect(container.read(cartProvider), isEmpty);
  });

  // Test 2
  test('Ajouter un produit au panier', () {
    notifier.addProduct(testProduct1);
    final cart = container.read(cartProvider);
    expect(cart.length, 1);
    expect(cart.first.product.id, 'p1');
    expect(cart.first.quantity, 1);
  });

  // Test 3
  test('Ajouter le même produit incrémente la quantité', () {
    notifier.addProduct(testProduct1);
    notifier.addProduct(testProduct1);
    final cart = container.read(cartProvider);
    expect(cart.length, 1);
    expect(cart.first.quantity, 2);
  });

  // Test 4
  test('Ajouter deux produits différents', () {
    notifier.addProduct(testProduct1);
    notifier.addProduct(testProduct2);
    expect(container.read(cartProvider).length, 2);
  });

  // Test 5
  test('Supprimer un produit du panier', () {
    notifier.addProduct(testProduct1);
    notifier.addProduct(testProduct2);
    notifier.removeProduct('p1');
    final cart = container.read(cartProvider);
    expect(cart.length, 1);
    expect(cart.first.product.id, 'p2');
  });

  // Test 6
  test('Vider le panier', () {
    notifier.addProduct(testProduct1);
    notifier.addProduct(testProduct2);
    notifier.clear();
    expect(container.read(cartProvider), isEmpty);
  });

  // Test 7
  test('Total calculé correctement', () {
    notifier.addProduct(testProduct1);
    notifier.addProduct(testProduct1);
    notifier.addProduct(testProduct2);
    final total = container.read(cartProvider.notifier).total;
    expect(total, 85000 * 2 + 195000);
  });

  // Test 8
  test('itemCount correct', () {
    notifier.addProduct(testProduct1);
    notifier.addProduct(testProduct1);
    notifier.addProduct(testProduct2);
    expect(container.read(cartProvider.notifier).itemCount, 3);
  });

  // Test 9
  test('Total est 0 pour panier vide', () {
    expect(container.read(cartProvider.notifier).total, 0);
  });

  // Test 10
  test('Supprimer produit inexistant ne change rien', () {
    notifier.addProduct(testProduct1);
    notifier.removeProduct('inexistant');
    expect(container.read(cartProvider).length, 1);
  });
}
