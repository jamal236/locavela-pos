class MenuModel {
  final String name;
  final int price;
  final String image;
  final String description;
  final String category; // 👈 TAMBAH INI

  MenuModel({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
    required this.category,
  });
}