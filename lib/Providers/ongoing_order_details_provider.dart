import 'package:flutter/material.dart';

class OrderDetails {
  final String orderId;
  final String customerName;
  final String orderTime;
  final String phoneNumber;
  final String email;
  final String location;
  final String message;
  final List<OrderItem> items;
  final double subTotal;
  final double deliveryFee;
  final double serviceTax;
  final double discount;
  final double total;

  OrderDetails({
    required this.orderId,
    required this.customerName,
    required this.orderTime,
    required this.phoneNumber,
    required this.email,
    required this.location,
    required this.message,
    required this.items,
    required this.subTotal,
    required this.deliveryFee,
    required this.serviceTax,
    required this.discount,
    required this.total,
  });

  // Factory constructor to create OrderDetails from API response
  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      orderId: json['orderId'],
      customerName: json['customerName'],
      orderTime: json['orderTime'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      location: json['location'],
      message: json['message'],
      items: (json['items'] as List)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
      subTotal: json['subTotal'].toDouble(),
      deliveryFee: json['deliveryFee'].toDouble(),
      serviceTax: json['serviceTax'].toDouble(),
      discount: json['discount'].toDouble(),
      total: json['total'].toDouble(),
    );
  }
}

class OrderItem {
  final String name;
  final int quantity;
  final double price;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
  });

  // Factory constructor to create OrderItem from API response
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      name: json['name'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
    );
  }
}

class OngoingOrderProvider extends ChangeNotifier {
  OrderDetails? _orderDetails;
  String _selectedStatus = "Order Processing";

  // Getters
  OrderDetails get orderDetails => _orderDetails ?? _getDefaultOrderDetails();
  String get selectedStatus => _selectedStatus;

  // Initialize with order details if provided
  void initializeOrderDetails(OrderDetails? orderDetails) {
    _orderDetails = orderDetails ?? _getDefaultOrderDetails();
    notifyListeners();
  }

  // Update order status
  void updateOrderStatus(String status) {
    _selectedStatus = status;
    notifyListeners();
  }

  // Default order details for demonstration
  OrderDetails _getDefaultOrderDetails() {
    return OrderDetails(
      orderId: "120",
      customerName: "Ayushi",
      orderTime: "Today at 9:33 Am",
      phoneNumber: "+923345867968",
      email: "email",
      location: "location",
      message: "Hi please add white suace in my order",
      items: [
        OrderItem(name: "Vegetables", quantity: 3, price: 1200),
        OrderItem(name: "Milk", quantity: 1, price: 640),
      ],
      subTotal: 1200,
      deliveryFee: 200,
      serviceTax: 100,
      discount: 100,
      total: 2100,
    );
  }

  // Action methods
  void callCustomer(String phoneNumber) {
    // Implement phone call functionality
    print('Calling $phoneNumber');
  }

  void emailCustomer(String email) {
    // Implement email functionality
    print('Emailing $email');
  }

  void navigateToCustomer(String location) {
    // Implement navigation functionality
    print('Navigating to $location');
  }

  void printInvoice() {
    // Implement print functionality
    print('Printing invoice for order ${orderDetails.orderId}');
  }

  void cancelOrder() {
    // API call to cancel order
    print('Order ${orderDetails.orderId} cancelled');
  }

  void acceptOrder() {
    // API call to accept order
    print('Order ${orderDetails.orderId} accepted');
  }

  void pickupOrder() {
    // API call to pickup order
    print('Order ${orderDetails.orderId} ready for pickup');
  }
}