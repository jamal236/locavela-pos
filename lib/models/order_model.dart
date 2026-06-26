import 'cart_model.dart';

class OrderModel {
  final List<CartModel> items;
  final double total;
  final DateTime date;

  OrderModel({
    required this.items,
    required this.total,
    required this.date,
  });
}