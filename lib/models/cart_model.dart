import 'menu_model.dart';

class CartModel {
  final MenuModel menu;
  int quantity;

  CartModel({
    required this.menu,
    this.quantity = 1,
  });
}