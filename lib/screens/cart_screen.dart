import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ema_greenlink_app/l10n/app_localizations.dart';
import '../providers/cart_provider.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final total = ref.watch(cartTotalProvider);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00A86B),
        foregroundColor: Colors.white,
        title: Semantics(
          label: 'Panier d\'achats',
          child: Text(l10n.cart),
        ),
      ),
      body: cart.isEmpty
          ? Center(
              child: Semantics(
                label: 'Panier vide',
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart_outlined,
                        size: 80, color: Colors.grey),
                    const SizedBox(height: 16),
                    Text(l10n.emptyCart,
                        style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];
                      final locale =
                          Localizations.localeOf(context).languageCode;
                      return Semantics(
                        label:
                            '${item.product.getName(locale)}, quantité ${item.quantity}',
                        child: ListTile(
                          leading: const Icon(Icons.solar_power,
                              color: Color(0xFF00A86B)),
                          title: Text(item.product.getName(locale)),
                          subtitle: Text(
                              '${item.product.price.toStringAsFixed(0)} FCFA x ${item.quantity}'),
                          trailing: Semantics(
                            label: 'Supprimer du panier',
                            button: true,
                            child: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => ref
                                  .read(cartProvider.notifier)
                                  .removeProduct(item.product.id),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(l10n.total,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(
                            '${total.toStringAsFixed(0)} FCFA',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF00A86B),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            ref.read(cartProvider.notifier).clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(l10n.orderPlaced)),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF00A86B),
                            foregroundColor: Colors.white,
                          ),
                          child: Text(l10n.order),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
