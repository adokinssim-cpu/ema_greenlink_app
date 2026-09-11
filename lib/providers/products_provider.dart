import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/product.dart';
import '../data/mock_products.dart';

final productsProvider = Provider<List<Product>>((ref) => mockProducts);

final selectedProductProvider = StateProvider<Product?>((ref) => null);
