import 'package:flutter/material.dart';

class OrderDetailsProvider extends ChangeNotifier {
  // Mock data - will be replaced with backend data in production
  final OrderDetails _orderDetails = OrderDetails(
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

  // Getter for order details
  OrderDetails get orderDetails => _orderDetails;

  // Methods to handle user actions - these will be connected to backend APIs later
  void callCustomer(String phoneNumber) {
    // Implement phone call functionality
    print('Calling $phoneNumber');

    // In a real app, you might use url_launcher package:
    // final Uri uri = Uri.parse('tel:$phoneNumber');
    // launchUrl(uri);
  }

  void emailCustomer(String email) {
    // Implement email functionality
    print('Emailing $email');

    // In a real app, you might use url_launcher package:
    // final Uri uri = Uri.parse('mailto:$email');
    // launchUrl(uri);
  }

  void navigateToCustomer(String location) {
    // Implement navigation functionality
    print('Navigating to $location');

    // In a real app, you might use map integration:
    // final Uri uri = Uri.parse('https://maps.google.com/?q=$location');
    // launchUrl(uri);
  }

  void printInvoice() {
    // Implement print functionality
    print('Printing invoice for order ${_orderDetails.orderId}');

    // This would typically connect to a printing service or generate a PDF
  }

  void cancelOrder() {
    // API call to cancel order
    print('Order ${_orderDetails.orderId} cancelled');

    // In a real app:
    // 1. Make API call
    // 2. Show loading indicator
    // 3. Handle response
    // 4. Navigate back or show confirmation
  }

  void acceptOrder() {
    // API call to accept order
    print('Order ${_orderDetails.orderId} accepted');

    // In a real app:
    // 1. Make API call
    // 2. Show loading indicator
    // 3. Handle response
    // 4. Navigate to next screen or show confirmation
  }

  // Method to fetch order details from API
  Future<void> fetchOrderDetails(String orderId) async {
    // Here you would make an API call to get the order details
    // For example:
    // final response = await http.get(Uri.parse('$apiUrl/orders/$orderId'));
    // if (response.statusCode == 200) {
    //   final orderData = jsonDecode(response.body);
    //   _orderDetails = OrderDetails.fromJson(orderData);
    //   notifyListeners();
    // }

    // For now, we're using mock data
  }
}

// Models for the order data
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