import 'package:flutter/material.dart';

import 'cart_manager.dart';
import 'details.dart';

class Product {
  final String name;
  final String price;
  final String rate;
  final IconData icon;

  const Product({
    required this.name,
    required this.price,
    required this.rate,
    required this.icon,
  });
}

class MyWidget extends StatelessWidget {
  final Product product;
  final VoidCallback? onAddToCart;

  const MyWidget({
    required this.product,
    this.onAddToCart,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: Colors.black26,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Details(product: product)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(product.icon, color: Colors.deepPurple, size: 48),
              const SizedBox(height: 6),
              Text(
                product.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                "\$${product.price}",
                style: TextStyle(color: Colors.grey.shade700, fontSize: 13),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: onAddToCart ??
                    () {
                      CartManager.instance.addToCart(product);
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                icon: const Icon(Icons.add_shopping_cart, size: 16),
                label:
                    const Text("Add to Cart", style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
