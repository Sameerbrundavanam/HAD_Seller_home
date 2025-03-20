import 'package:flutter/foundation.dart';

class OrderItem {
  final String name;
  final String quantity;
  final String price;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory OrderItem.fromMap(Map<String, String> map) {
    return OrderItem(
      name: map['name'] ?? '',
      quantity: map['quantity'] ?? '',
      price: map['price'] ?? '',
    );
  }

  Map<String, String> toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }
}

class PastOrder {
  final String customerName;
  final String orderTime;
  final String orderId;
  final String totalAmount;
  final List<OrderItem> orderItems;
  final String message;
  final String orderStatus;

  PastOrder({
    required this.customerName,
    required this.orderTime,
    required this.orderId,
    required this.totalAmount,
    required this.orderItems,
    required this.message,
    required this.orderStatus,
  });

  factory PastOrder.fromMap(Map<String, dynamic> map) {
    return PastOrder(
      customerName: map['customerName'] ?? '',
      orderTime: map['orderTime'] ?? '',
      orderId: map['orderId'] ?? '',
      totalAmount: map['totalAmount'] ?? '',
      orderItems: (map['orderItems'] as List<dynamic>?)
          ?.map((item) => OrderItem.fromMap(Map<String, String>.from(item)))
          .toList() ??
          [],
      message: map['message'] ?? '',
      orderStatus: map['orderStatus'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customerName': customerName,
      'orderTime': orderTime,
      'orderId': orderId,
      'totalAmount': totalAmount,
      'orderItems': orderItems.map((item) => item.toMap()).toList(),
      'message': message,
      'orderStatus': orderStatus,
    };
  }
}

class PastOrderProvider with ChangeNotifier {
  List<PastOrder> _orders = [];
  PastOrder? _selectedOrder;

  List<PastOrder> get orders => _orders;
  PastOrder? get selectedOrder => _selectedOrder;

  void setOrders(List<PastOrder> orders) {
    _orders = orders;
    notifyListeners();
  }

  void addOrder(PastOrder order) {
    _orders.add(order);
    notifyListeners();
  }

  void selectOrder(PastOrder order) {
    _selectedOrder = order;
    notifyListeners();
  }

  void clearSelectedOrder() {
    _selectedOrder = null;
    notifyListeners();
  }

  // Helper method to convert from old format to new format
  static List<PastOrder> fromLegacyFormat(List<Map<String, dynamic>> legacyOrders) {
    return legacyOrders.map((legacyOrder) {
      return PastOrder(
        customerName: legacyOrder['customerName'] ?? '',
        orderTime: legacyOrder['orderTime'] ?? '',
        orderId: legacyOrder['orderId'] ?? '',
        totalAmount: legacyOrder['totalAmount'] ?? '',
        orderItems: (legacyOrder['orderItems'] as List<dynamic>?)
            ?.map((item) => OrderItem.fromMap(Map<String, String>.from(item)))
            .toList() ??
            [],
        message: legacyOrder['message'] ?? '',
        orderStatus: legacyOrder['orderStatus'] ?? '',
      );
    }).toList();
  }
}