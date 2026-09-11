import 'package:flutter_test/flutter_test.dart';
import 'package:ema_greenlink_app/models/product.dart';

const product = Product(
  id: '1',
  nameEn: 'Solar Panel',
  nameFr: 'Panneau Solaire',
  descriptionEn: 'English description',
  descriptionFr: 'Description française',
  price: 85000,
  category: 'solar',
  imageUrl: 'https://test.com/img.jpg',
  stock: 10,
);

void main() {
  // Test 11
  test('getName retourne nom français pour locale fr', () {
    expect(product.getName('fr'), 'Panneau Solaire');
  });

  // Test 12
  test('getName retourne nom anglais pour locale en', () {
    expect(product.getName('en'), 'Solar Panel');
  });

  // Test 13
  test('getDescription retourne description française', () {
    expect(product.getDescription('fr'), 'Description française');
  });

  // Test 14
  test('getDescription retourne description anglaise', () {
    expect(product.getDescription('en'), 'English description');
  });

  // Test 15 — bonus
  test('Prix du produit est correct', () {
    expect(product.price, 85000);
  });
}
