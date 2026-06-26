import '../models/cart_model.dart';
import '../models/menu_model.dart';

class CartService {
  static final List<CartModel> _cart = [];

  static List<CartModel> get cart => _cart;

  static void addToCart(MenuModel menu) {
    for (var item in _cart) {
      if (item.menu.name == menu.name) {
        item.quantity++;
        return;
      }
    }

    _cart.add(CartModel(menu: menu));
  }

  static void removeFromCart(MenuModel menu) {
    _cart.removeWhere((item) => item.menu.name == menu.name);
  }

  static double getTotal() {
    double total = 0;

    for (var item in _cart) {
      total += item.menu.price * item.quantity;
    }

    return total;
  }

  static void clearCart() {
    _cart.clear();
  }
}