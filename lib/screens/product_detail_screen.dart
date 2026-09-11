import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ema_greenlink_app/l10n/app_localizations.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductDetailScreen extends ConsumerWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context).languageCode;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A86B),
        foregroundColor: Colors.white,
        title: Text(product.getName(locale)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Semantics(
              label: 'Image de ${product.getName(locale)}',
              child: Image.network(
                product.imageUrl,
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const SizedBox(
                    height: 250,
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.getName(locale),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Semantics(
                    label: 'Prix: ${product.price} FCFA',
                    child: Text(
                      '${product.price.toStringAsFixed(0)} FCFA',
                      style: const TextStyle(
                        fontSize: 24,
                        color: Color(0xFF00A86B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    l10n.description,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(product.getDescription(locale)),
                  const SizedBox(height: 16),
                  Semantics(
                    label: 'Stock: ${product.stock} unités',
                    child: Row(
                      children: [
                        const Icon(Icons.inventory_2,
                            color: Color(0xFF00A86B), size: 18),
                        const SizedBox(width: 8),
                        Text('${l10n.stock}: ${product.stock}'),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Semantics(
                    label: 'Ajouter au panier',
                    button: true,
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          ref.read(cartProvider.notifier).addProduct(product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(l10n.addedToCart),
                              backgroundColor: const Color(0xFF00A86B),
                            ),
                          );
                        },
                        icon: const Icon(Icons.add_shopping_cart),
                        label: Text(l10n.addToCart),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00A86B),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
