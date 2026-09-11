import 'package:flutter_test/flutter_test.dart';
import 'package:ema_greenlink_app/models/product.dart';

const product = Product(
  id: '1',
  nameEn: 'Solar Panel',
  nameFr: 'Panneau Solaire',
  descriptionEn: 'English',
  descriptionFr: 'Français',
  price: 85000,
  category: 'solar',
  imageUrl: 'https://test.com',
  stock: 10,
);

void main() {
  test('Locale inconnue retourne nom anglais', () {
    expect(product.getName('es'), 'Solar Panel');
  });

  test('Locale fr retourne description française', () {
    expect(product.getDescription('fr'), 'Français');
  });
}
