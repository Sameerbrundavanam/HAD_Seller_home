import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;
import 'dart:developer' as developer;

class OrderCompletionProvider extends ChangeNotifier {
  // Order data that would normally be fetched from an API
  Map<String, dynamic> _orderData = {
    'customerName': 'Ayushi',
    'orderTime': '9:33 Am',
    'orderId': '120',
    'total': '1,840',
    'phone': '+923345867968',
    'message': 'Hi please add white suace in my order',
    'items': [
      {'name': 'Vegetables', 'quantity': 3, 'price': 1200},
      {'name': 'Milk', 'quantity': 1, 'price': 640},
    ],
    'subTotal': 1200,
    'deliveryFee': 200,
    'serviceTax': 100,
    'discount': 100,
    'discountPercentage': 30,
    'grandTotal': 2100,
    'status': 'Order delivered'
  };

  // Getter for order data
  Map<String, dynamic> get orderData => _orderData;

  // Method to fetch order data from API
  Future<void> fetchOrderData(String orderId) async {
    try {
      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // In a real app, this would be replaced with an API call
      // final response = await http.get(Uri.parse('your-api-url/orders/$orderId'));
      // _orderData = jsonDecode(response.body);

      notifyListeners();
    } catch (e) {
      developer.log('Error fetching order data: $e');
      // Handle error appropriately
    }
  }

  // Update order data
  void updateOrderData(Map<String, dynamic> newData) {
    _orderData = newData;
    notifyListeners();
  }

  // Function to handle calling customer
  Future<void> callCustomer(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    try {
      if (await url_launcher.canLaunchUrl(phoneUri)) {
        await url_launcher.launchUrl(phoneUri);
      } else {
        developer.log('Could not launch $phoneUri');
      }
    } catch (e) {
      developer.log('Error making phone call: $e');
    }
  }

  // Function to handle sending email
  Future<void> emailCustomer() async {
    // In a real time, you should get the email from _orderData that again should come from the backend
    const String email = 'customer@example.com';
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: encodeQueryParameters({
        'subject': 'Order #${_orderData['orderId']} Information',
        'body': 'Hello ${_orderData['customerName']},\n\nThank you for your order!'
      }),
    );

    try {
      if (await url_launcher.canLaunchUrl(emailUri)) {
        await url_launcher.launchUrl(emailUri);
      } else {
        developer.log('Could not launch $emailUri');
      }
    } catch (e) {
      developer.log('Error sending email: $e');
    }
  }

  // Helper function to encode query parameters
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  // Function to handle navigation to customer's location
  Future<void> navigateToCustomer() async {
    // In a real time, you would get coordinates from _orderData
    const String latitude = '37.4219999';
    const String longitude = '-122.0840575';
    final Uri mapsUri = Uri.parse('https://www.google.com/maps/search/?api=1&query=$latitude,$longitude');

    try {
      if (await url_launcher.canLaunchUrl(mapsUri)) {
        await url_launcher.launchUrl(mapsUri);
      } else {
        developer.log('Could not launch $mapsUri');
      }
    } catch (e) {
      developer.log('Error navigating to customer: $e');
    }
  }

  // Function to handle printing invoice
  void printInvoice() {
    // In a real time, this would connect to a printer service or generate a PDF
    developer.log('Printing invoice for order #${_orderData['orderId']}');
    // Implement printer connection or PDF generation here based on your requirement
  }
}