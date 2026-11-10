import 'package:flutter/material.dart';

import 'cart_manager.dart';
import 'cart_page.dart';
import 'component.dart';

class HomePage extends StatelessWidget {
  static const List<Product> products = [
    Product(
      name: "Smart Watch",
      price: "120.0",
      icon: Icons.watch,
      rate: "4.5",
    ),
    Product(
      name: "Headphones",
      price: "80.0",
      icon: Icons.headphones,
      rate: "4.2",
    ),
    Product(name: "Laptop", price: "950.0", icon: Icons.laptop, rate: "4.8"),
    Product(
      name: "Camera",
      price: "400.0",
      icon: Icons.camera_alt,
      rate: "4.3",
    ),
    Product(
      name: "SmartPhone",
      price: "500.0",
      icon: Icons.phone_android,
      rate: "4.1",
    ),
    Product(name: "Tablet", price: "400.0", icon: Icons.tablet, rate: "4.3"),
  ];

  const HomePage({super.key});

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
            title: const Text(
              "Homepage page",
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
          body: GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) => MyWidget(
              product: products[index],
              onAddToCart: () {
                cartManager.addToCart(products[index]);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("${products[index].name} added to cart"),
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
            ),
            itemCount: products.length,
          ),
          bottomNavigationBar: Container(
            color: Colors.deepPurple,
            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
            child: SafeArea(
              child: Text(
                "Total: \$${cartManager.totalPrice.toStringAsFixed(2)}",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
