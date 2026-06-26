import 'package:flutter/material.dart';
import '../models/menu_model.dart';

class MenuCard extends StatelessWidget {
  final MenuModel menu;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.menu,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

Container(
  height: 90,
  width: 90,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    color: Colors.brown.shade50,
  ),
  child: ClipRRect(
    borderRadius: BorderRadius.circular(50),
    child: Image.asset(
      menu.image,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(
          Icons.local_cafe,
          size: 40,
          color: Colors.brown,
        );
      },
    ),
  ),
),

              const SizedBox(height: 14),

              Text(
                menu.name,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Rp ${menu.price}",
                style: const TextStyle(
                  color: Colors.brown,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}