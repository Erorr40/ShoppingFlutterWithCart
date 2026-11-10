import 'package:flutter/material.dart';

import 'cart_manager.dart';
import 'cart_page.dart';
import 'component.dart';

class Details extends StatelessWidget {
  final Product product;
  const Details({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    final cartManager = CartManager.instance;

    return ListenableBuilder(
      listenable: cartManager,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text(
              "Details page",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: Badge(
                  isLabelVisible: cartManager.itemCount > 0,
                  label: Text("${cartManager.itemCount}"),
                  child: const Icon(Icons.shopping_cart, color: Colors.white),
                ),
                tooltip: "View Cart",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
              ),
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(
                    color: const Color.fromARGB(255, 206, 186, 150),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            Colors.deepPurpleAccent.withValues(alpha: 0.1),
                        child: Icon(product.icon, color: Colors.deepPurple),
                      ),
                      title: Text(
                        product.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("\$${product.price}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.star, color: Colors.yellow),
                          const SizedBox(width: 6),
                          Text(product.rate),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      cartManager.addToCart(product);
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${product.name} added to cart"),
                          duration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                    ),
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text(
                      "Add to Cart",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
