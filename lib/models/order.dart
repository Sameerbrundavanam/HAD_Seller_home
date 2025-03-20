// // lib/models/order.dart
// import 'package:latlong2/latlong.dart';
//
// class Order {
//   final String id;
//   final String status;
//   final List<String> items;
//   final double totalPrice;
//   final List<LatLng> routeCoordinates;
//
//   Order({
//     required this.id,
//     required this.status,
//     required this.items,
//     required this.totalPrice,
//     required this.routeCoordinates,
//   });
// }

import 'package:latlong2/latlong.dart';

class OrderItem {
  final String name;
  final int quantity;
  final double price;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
  });
}

class Order {
  final String customerName;
  final int orderId;
  final DateTime orderTime;
  final double total;
  final String phone;
  final String email;
  final List<OrderItem> items;
  final List<LatLng> routeCoordinates;
  final String message;

  Order({
    required this.customerName,
    required this.orderId,
    required this.orderTime,
    required this.total,
    required this.phone,
    required this.email,
    required this.items,
    required this.routeCoordinates,
    required this.message,
  });
}