import 'package:flutter/material.dart';
import '../../services/order_service.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orders = OrderService.orders;

    return Scaffold(
      appBar: AppBar(
        title: const Text("History Transaksi"),
      ),

      body: orders.isEmpty
          ? const Center(
              child: Text("Belum ada transaksi"),
            )
          : ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Transaksi #${index + 1}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          "Tanggal: ${order.date}",
                          style: const TextStyle(fontSize: 12),
                        ),

                        const Divider(),

                        Column(
                          children: order.items.map((item) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("${item.menu.name} x${item.quantity}"),
                                Text(
                                  "Rp ${item.menu.price * item.quantity}",
                                ),
                              ],
                            );
                          }).toList(),
                        ),

                        const Divider(),

                        Text(
                          "TOTAL: Rp ${order.total}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}