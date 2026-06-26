import 'package:flutter/material.dart';
import '../../services/cart_service.dart';
import '../checkout/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = CartService.cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang"),
      ),

      body: cart.isEmpty
          ? const Center(
              child: Text("Keranjang kosong"),
            )
          : Column(
              children: [

                // LIST ITEM
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart[index];

                      return Card(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: ListTile(
                          title: Text(item.menu.name),
                          subtitle: Text(
                            "Rp ${item.menu.price}",
                          ),

                          // TOTAL ITEM
                          trailing: SizedBox(
                            width: 140,
                            child: Row(
                              children: [

                                // - BUTTON
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      if (item.quantity > 1) {
                                        item.quantity--;
                                      } else {
                                        cart.removeAt(index);
                                      }
                                    });
                                  },
                                  icon: const Icon(Icons.remove),
                                ),

                                // QTY
                                Text(
                                  "${item.quantity}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                // + BUTTON
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      item.quantity++;
                                    });
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // TOTAL + CHECKOUT
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        color: Colors.black12,
                      )
                    ],
                  ),
                  child: Column(
                    children: [

                      // TOTAL HARGA
                      Text(
                        "Total: Rp ${CartService.getTotal()}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const CheckoutScreen(),
    ),
  );
},
                          child: const Text("Checkout"),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}