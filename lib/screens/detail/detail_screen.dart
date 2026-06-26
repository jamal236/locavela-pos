import 'package:flutter/material.dart';
import '../../models/menu_model.dart';
import '../../services/cart_service.dart';

class DetailScreen extends StatelessWidget {
  final MenuModel menu;

  const DetailScreen({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menu.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            const Icon(
              Icons.local_cafe,
              size: 100,
            ),

            const SizedBox(height: 20),

            Text(
              menu.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              "Rp ${menu.price}",
              style: const TextStyle(fontSize: 18),
            ),

            const SizedBox(height: 20),

            Text(menu.description),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  CartService.addToCart(menu);

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("${menu.name} ditambahkan ke keranjang"),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                },
                child: const Text(
                  "Tambah ke Keranjang",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}