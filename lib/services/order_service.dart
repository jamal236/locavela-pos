import '../models/order_model.dart';
import 'cart_service.dart';

class OrderService {
  static final List<OrderModel> _orders = [];

  static List<OrderModel> get orders => _orders;

  static void addOrder() {
    if (CartService.cart.isEmpty) return;

    _orders.add(
      OrderModel(
        items: List.from(CartService.cart),
        total: CartService.getTotal(),
        date: DateTime.now(),
      ),
    );
  }

  static void clearHistory() {
    _orders.clear();
  }
}