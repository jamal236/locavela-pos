import 'package:flutter/material.dart';
import '../../services/cart_service.dart';
import '../history/history_screen.dart';
import '../../services/order_service.dart';
import 'invoice_screen.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartService.cart;
    final total = CartService.getTotal();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Checkout"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [

            // STRUK LIST
            Expanded(
              child: ListView(
                children: [
                  const Text(
                    "🧾 STRUK PEMBAYARAN",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  ...cart.map((item) {
                    return ListTile(
                      title: Text(item.menu.name),
                      subtitle: Text("${item.quantity} x Rp ${item.menu.price}"),
                      trailing: Text(
                        "Rp ${item.menu.price * item.quantity}",
                      ),
                    );
                  }).toList(),

                  const Divider(),

                  // TOTAL
                  Text(
                    "TOTAL: Rp $total",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Terima kasih sudah berbelanja ☕",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // BUTTON BAYAR
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
onPressed: () {
  OrderService.addOrder();

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => InvoiceScreen(
        total: total,
      ),
    ),
  );
},
                child: const Text("Bayar Sekarang"),
              ),
            )
          ],
        ),
      ),
    );
  }
}