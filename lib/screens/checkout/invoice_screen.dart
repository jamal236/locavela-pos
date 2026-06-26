import 'package:flutter/material.dart';
import '../../services/cart_service.dart';

class InvoiceScreen extends StatelessWidget {
  final double total;

  const InvoiceScreen({
    super.key,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final cart = CartService.cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Invoice"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Center(
              child: Text(
                "LOCAVELA COFFEE",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const Center(
              child: Text(
                "Slow Bar Coffee",
              ),
            ),

            const SizedBox(height: 20),

            Text(
              "Invoice #${DateTime.now().millisecondsSinceEpoch}",
            ),

            const Divider(),

            Expanded(
              child: ListView(
                children: cart.map((item) {
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(item.menu.name),
                    subtitle: Text(
                      "${item.quantity} x Rp ${item.menu.price}",
                    ),
                    trailing: Text(
                      "Rp ${item.quantity * item.menu.price}",
                    ),
                  );
                }).toList(),
              ),
            ),

            const Divider(),

            Text(
              "TOTAL : Rp $total",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Center(
              child: Text(
                "Terima Kasih ☕",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
onPressed: () {

  CartService.clearCart();

  Navigator.popUntil(
    context,
    (route) => route.isFirst,
  );
},
                child: const Text(
                  "Kembali ke Home",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}