import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ema_greenlink_app/screens/splash_screen.dart';
import 'package:ema_greenlink_app/screens/home_screen.dart';
import 'package:ema_greenlink_app/screens/product_detail_screen.dart';
import 'package:ema_greenlink_app/screens/cart_screen.dart';
import 'package:ema_greenlink_app/screens/profile_screen.dart';
import 'package:ema_greenlink_app/screens/favorites_screen.dart';
import 'package:ema_greenlink_app/models/product.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/product',
        builder: (context, state) {
          final product = state.extra as Product;
          return ProductDetailScreen(product: product);
        },
      ),
      GoRoute(
        path: '/cart',
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/favorites',
        builder: (context, state) => const FavoritesScreen(),
      ),
    ],
  );
});
