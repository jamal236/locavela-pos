import 'package:flutter/material.dart';

import '../../data/menu_data.dart';
import '../../widgets/menu_card.dart';
import '../cart/cart_screen.dart';
import '../detail/detail_screen.dart';
import '../history/history_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategory = "All";
  String searchText = "";

  final List<String> categories = [
    "All",
    "Coffee",
    "Matcha",
    "Chocolate",
    "Non Coffee",
    "Squash",
  ];

  List get filteredMenu {
    return menuList.where((menu) {
      final categoryMatch =
          selectedCategory == "All" ||
          menu.category == selectedCategory;

      final searchMatch = menu.name
          .toLowerCase()
          .contains(searchText.toLowerCase());

      return categoryMatch && searchMatch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F1EB),

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.brown,
        title: const Text("Locavela Coffee"),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const HistoryScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const CartScreen(),
                ),
              );
            },
          ),
        ],
      ),

      body: CustomScrollView(
  slivers: [

    SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
        child: SizedBox(
          height: 55,
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
            decoration: InputDecoration(
              hintText: "Cari kopi favorit...",
              filled: true,
              fillColor: Colors.white,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.brown,
              ),
              suffixIcon: const Icon(
                Icons.coffee,
                color: Colors.brown,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
    ),

    SliverToBoxAdapter(
      child: SizedBox(
        height: 55,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (_, __) =>
              const SizedBox(width: 10),
          itemBuilder: (context, index) {

            final cat = categories[index];
            final isSelected =
                selectedCategory == cat;

            return InkWell(
              onTap: () {
                setState(() {
                  selectedCategory = cat;
                });
              },
              borderRadius: BorderRadius.circular(25),
              child: AnimatedContainer(
                duration:
                    const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(
                    horizontal: 22),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.brown
                      : Colors.white,
                  borderRadius:
                      BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.brown,
                  ),
                ),
                child: Center(
                  child: Text(
                    cat,
                    style: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : Colors.brown,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ),

    SliverPadding(
      padding: const EdgeInsets.all(12),
      sliver: SliverLayoutBuilder(
        builder: (context, constraints) {

          int crossAxisCount = 2;

          if (constraints.crossAxisExtent >= 1400) {
            crossAxisCount = 6;
          } else if (constraints.crossAxisExtent >= 1100) {
            crossAxisCount = 5;
          } else if (constraints.crossAxisExtent >= 800) {
            crossAxisCount = 4;
          } else if (constraints.crossAxisExtent >= 600) {
            crossAxisCount = 3;
          }

          return SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {

                final menu = filteredMenu[index];

                return MenuCard(
                  menu: menu,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            DetailScreen(menu: menu),
                      ),
                    );
                  },
                );
              },
              childCount: filteredMenu.length,
            ),
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.72,
            ),
          );
        },
      ),
    ),
  ],
),
    );
  }
}