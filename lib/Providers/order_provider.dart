import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  // State variables
  int _selectedTabIndex = 0;
  List<Map<String, dynamic>> _newOrders = [];
  List<Map<String, dynamic>> _ongoingOrders = [];
  List<Map<String, dynamic>> _pastOrders = [];

  // Getters
  int get selectedTabIndex => _selectedTabIndex;
  List<Map<String, dynamic>> get newOrders => _newOrders;
  List<Map<String, dynamic>> get ongoingOrders => _ongoingOrders;
  List<Map<String, dynamic>> get pastOrders => _pastOrders;

  // Sample order items
  List<Map<String, String>> get orderItems => [
    {'name': 'Vegetables', 'quantity': '3', 'price': '1200'},
    {'name': 'Milk', 'quantity': '1', 'price': '640'},
  ];

  // Status options
  List<String> get statusOptions => [
    'Order Processing',
    'Shipped',
    'Delivered',
    'Cancelled',
  ];

  // Constructor to initialize sample data
  OrderProvider() {
    _initializeSampleData();
  }

  void _initializeSampleData() {
    // Add sample data for new orders
    _newOrders = List.generate(2, (index) => {
      'customerName': 'Ayushi',
      'orderTime': 'Today at 9:33 AM',
      'orderId': '120',
      'totalAmount': 1840,
      'items': [
        {'name': 'Vegetables', 'quantity': 3, 'price': 1200},
        {'name': 'Milk', 'quantity': 1, 'price': 640},
      ],
      'message': 'Hi, please add white sauce in my order',
    });

    // Add sample data for ongoing orders
    _ongoingOrders = List.generate(2, (index) => {
      'customerName': 'Ayushi',
      'orderTime': 'Today at 9:33 AM',
      'orderId': '120',
      'totalAmount': '1,840',
      'orderStatus': 'Order Processing',
      'message': 'Hi, please add white sauce to my order',
    });

    // Add sample data for past orders
    _pastOrders = List.generate(2, (index) => {
      'customerName': 'Ayushi',
      'orderTime': 'Today at 9:33 AM',
      'orderId': '120',
      'totalAmount': '1,840',
      'orderStatus': 'Delivered',
      'message': 'Hi, please add white sauce to my order',
    });
  }

  // Methods to update state
  void setSelectedTabIndex(int index) {
    _selectedTabIndex = index;
    notifyListeners();
  }

  void callCustomer(int orderIndex) {
    print('Calling customer from order at index $orderIndex...');
    notifyListeners();
  }

  void viewOrderDetails(int orderIndex) {
    print('Viewing details for order at index $orderIndex...');
    notifyListeners();
  }

  void cancelOrder(int orderIndex) {
    print('Order canceled at index $orderIndex...');
    notifyListeners();
  }

  void acceptOrder(int orderIndex) {
    print('Order accepted at index $orderIndex...');

    // Move order from new orders to ongoing orders
    if (orderIndex < _newOrders.length) {
      final order = _newOrders[orderIndex];
      _ongoingOrders.add({
        'customerName': order['customerName'],
        'orderTime': order['orderTime'],
        'orderId': order['orderId'],
        'totalAmount': order['totalAmount'].toString(),
        'orderStatus': 'Order Processing',
        'message': order['message'],
      });

      // Remove from new orders
      _newOrders.removeAt(orderIndex);
    }

    notifyListeners();
  }

  void updateOrderStatus(int orderIndex, String newStatus) {
    if (orderIndex < _ongoingOrders.length) {
      _ongoingOrders[orderIndex]['orderStatus'] = newStatus;

      // If order is delivered or cancelled, move to past orders
      if (newStatus == 'Delivered' || newStatus == 'Cancelled') {
        final order = _ongoingOrders[orderIndex];
        _pastOrders.add(order);
        _ongoingOrders.removeAt(orderIndex);
      }
    }

    print("Order status updated to: $newStatus");
    notifyListeners();
  }
}