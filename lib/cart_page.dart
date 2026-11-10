import 'package:flutter/material.dart';

import 'cart_manager.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

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
              "Cart",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              if (cartManager.items.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.delete_sweep, color: Colors.white),
                  tooltip: "Clear Cart",
                  onPressed: () {
                    cartManager.clearCart();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Cart cleared"),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                ),
            ],
          ),
          body: cartManager.items.isEmpty
              ? const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.remove_shopping_cart_outlined,
                        size: 70,
                        color: Colors.grey,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "Your cart is empty",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(12),
                  itemCount: cartManager.items.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final item = cartManager.items[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            Colors.deepPurpleAccent.withValues(alpha: 0.1),
                        child: Icon(item.icon, color: Colors.deepPurple),
                      ),
                      title: Text(
                        item.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text("\$${item.price}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () {
                          cartManager.removeFromCart(item);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("${item.name} removed from cart"),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
          bottomNavigationBar: Container(
            color: Colors.deepPurple,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
