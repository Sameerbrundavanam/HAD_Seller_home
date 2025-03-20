// import 'package:flutter/material.dart';
//
// class OnGoingOrderProvider extends ChangeNotifier {
//   int _selectedTabIndex = 0;
//
//   // Getter for selected tab index
//   int get selectedTabIndex => _selectedTabIndex;
//
//   // Setter for selected tab index
//   void setSelectedTabIndex(int index) {
//     _selectedTabIndex = index;
//     notifyListeners();
//   }
//
//   // Sample order items for testing
//   final List<Map<String, String>> _orderItems = [
//     {'name': 'Vegetables', 'quantity': '3', 'price': '1200'},
//     {'name': 'Milk', 'quantity': '1', 'price': '640'},
//   ];
//
//   List<Map<String, String>> get orderItems => _orderItems;
//
//   // Lists to store orders in different states
//   final List<Map<String, dynamic>> _newOrders = [
//     {
//       'customerName': 'Ayushi',
//       'orderTime': 'Today at 9:33 AM',
//       'orderId': '120',
//       'totalAmount': 1840.0, // Using double instead of int
//       'items': [
//         {'name': 'Vegetables', 'quantity': 3, 'price': 1200},
//         {'name': 'Milk', 'quantity': 1, 'price': 640},
//       ],
//       'message': 'Hi, please add white sauce in my order',
//     },
//     {
//       'customerName': 'Rahul',
//       'orderTime': 'Today at 10:15 AM',
//       'orderId': '121',
//       'totalAmount': 2350.0, // Using double instead of int
//       'items': [
//         {'name': 'Fruits', 'quantity': 2, 'price': 1500},
//         {'name': 'Bread', 'quantity': 2, 'price': 850},
//       ],
//       'message': 'Please deliver before noon',
//     },
//   ];
//
//   List<Map<String, dynamic>> get newOrders => _newOrders;
//
//   final List<Map<String, dynamic>> _ongoingOrders = [
//     {
//       'customerName': 'Vikram',
//       'orderTime': 'Today at 8:45 AM',
//       'orderId': '119',
//       'totalAmount': '2,100',
//       'items': [
//         {'name': 'Rice', 'quantity': 5, 'price': 1250},
//         {'name': 'Oil', 'quantity': 1, 'price': 850},
//       ],
//       'message': 'Please call before delivery',
//       'orderStatus': 'Order Processing',
//     },
//   ];
//
//   List<Map<String, dynamic>> get ongoingOrders => _ongoingOrders;
//
//   final List<Map<String, dynamic>> _pastOrders = [
//     {
//       'customerName': 'Neha',
//       'orderTime': 'Yesterday at 2:15 PM',
//       'orderId': '118',
//       'totalAmount': '1,540',
//       'items': [
//         {'name': 'Cereals', 'quantity': 2, 'price': 940},
//         {'name': 'Yogurt', 'quantity': 3, 'price': 600},
//       ],
//       'message': 'No special instructions',
//       'orderStatus': 'Delivered',
//     },
//   ];
//
//   List<Map<String, dynamic>> get pastOrders => _pastOrders;
//
//   // Actions for orders
//   void callCustomer(int index) {
//     // Implement actual call functionality
//     print('Calling customer from order ${_newOrders[index]['orderId']}');
//   }
//
//   void viewOrderDetails(int index) {
//     // Implement navigation to details view
//     print('Viewing details for order');
//   }
//
//   void cancelOrder(int index) {
//     if (index < _newOrders.length) {
//       final canceledOrder = Map<String, dynamic>.from(_newOrders[index]);
//       canceledOrder['orderStatus'] = 'Cancelled';
//
//       _newOrders.removeAt(index);
//       _pastOrders.add(canceledOrder);
//
//       // Switch to Past Orders tab
//       setSelectedTabIndex(2);
//
//       notifyListeners();
//     }
//   }
//
//   void acceptOrder(int index) {
//     if (index < _newOrders.length) {
//       final acceptedOrder = Map<String, dynamic>.from(_newOrders[index]);
//
//       // Convert totalAmount to string format for ongoing orders display
//       // This handles the type conversion properly
//       final double amount = acceptedOrder['totalAmount'];
//       acceptedOrder['totalAmount'] = amount.toStringAsFixed(0);
//       acceptedOrder['orderStatus'] = 'Order Processing';
//
//       _newOrders.removeAt(index);
//       _ongoingOrders.add(acceptedOrder);
//
//       // Switch to Ongoing Orders tab
//       setSelectedTabIndex(1);
//
//       notifyListeners();
//     }
//   }
//
//   void updateOrderStatus(int index, String newStatus) {
//     if (index < _ongoingOrders.length) {
//       _ongoingOrders[index]['orderStatus'] = newStatus;
//
//       // If status is Delivered or Cancelled, move to past orders
//       if (newStatus == 'Delivered' || newStatus == 'Cancelled') {
//         final completedOrder = Map<String, dynamic>.from(_ongoingOrders[index]);
//         _ongoingOrders.removeAt(index);
//         _pastOrders.add(completedOrder);
//
//         // Switch to Past Orders tab
//         setSelectedTabIndex(2);
//       }
//
//       notifyListeners();
//     }
//   }
// }

// Provider implementation
import 'package:flutter/foundation.dart';
// ListView implementation for your screen
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Providers/ongoing_order_provider.dart';
import '../Screens/ongoing_orders.dart';
class OngoingOrderProvider with ChangeNotifier {
  List<Map<String, dynamic>> _ongoingOrders = [];
  Map<String, dynamic> _orderData = {};
  String _selectedStatus = '';

  // Add a getter for ongoingOrders
  List<Map<String, dynamic>> get ongoingOrders => _ongoingOrders;
  Map<String, dynamic> get orderData => _orderData;
  String get selectedStatus => _selectedStatus;

  // Getter for orderItems
  List<Map<String, String>> get orderItems {
    if (_orderData['orderItems'] == null) {
      return [];
    }

    return (_orderData['orderItems'] as List).map((item) {
      final Map<String, String> typedItem = {};
      (item as Map).forEach((key, value) {
        typedItem[key.toString()] = value.toString();
      });
      return typedItem;
    }).toList();
  }

  // Method to set initial orders list
  void setOrders(List<Map<String, dynamic>> orders) {
    _ongoingOrders = orders;
    notifyListeners();
  }

  void initOrder(Map<String, dynamic> orderData) {
    _orderData = orderData;
    _selectedStatus = orderData['orderStatus'] ?? 'Order Processing';
    notifyListeners();
  }

  void updateOrderStatus(int index, String newStatus) {
    // Update individual order in the list
    if (index >= 0 && index < _ongoingOrders.length) {
      _ongoingOrders[index]['orderStatus'] = newStatus;

      // If this is the currently selected order, update the selected status too
      if (_orderData.containsKey('orderId') &&
          _ongoingOrders[index].containsKey('orderId') &&
          _orderData['orderId'] == _ongoingOrders[index]['orderId']) {
        _selectedStatus = newStatus;
        _orderData['orderStatus'] = newStatus;
      }

      notifyListeners();
    }
  }

  void viewOrderDetails(int index) {
    // You can implement navigation logic here
    print('Viewing details for order: ${_ongoingOrders[index]['orderId']}');
  }
}



class OnGoingOrderScreen extends StatelessWidget {
  const OnGoingOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive sizing
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Example data - replace with your actual data source
    final List<Map<String, dynamic>> exampleOrders = [
      {
        'customerName': 'John Doe',
        'orderTime': '2025-03-15 14:30',
        'orderId': 'ORD-12345',
        'totalAmount': '₹1,250.00',
        'orderItems': [
          {'name': 'Product 1', 'quantity': '2', 'price': '500.00'},
          {'name': 'Product 2', 'quantity': '1', 'price': '250.00'},
        ],
        'message': 'Please deliver to the reception.',
        'orderStatus': 'Order Processing',
      },
      {
        'customerName': 'Jane Smith',
        'orderTime': '2025-03-15 15:45',
        'orderId': 'ORD-12346',
        'totalAmount': '₹850.00',
        'orderItems': [
          {'name': 'Product 3', 'quantity': '1', 'price': '850.00'},
        ],
        'message': 'Call before delivery.',
        'orderStatus': 'Shipped',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ongoing Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ChangeNotifierProvider<OngoingOrderProvider>(
          create: (_) => OngoingOrderProvider()..setOrders(exampleOrders),
          child: Consumer<OngoingOrderProvider>(
            builder: (context, provider, child) {
              return ListView.builder(
                itemCount: provider.ongoingOrders.length,
                itemBuilder: (context, index) {
                  final order = provider.ongoingOrders[index];

                  // Create a local provider for this specific order
                  return ChangeNotifierProvider<OngoingOrderProvider>.value(
                    // Use .value to pass an existing provider
                    value: OngoingOrderProvider()..initOrder(order),
                    child: Consumer<OngoingOrderProvider>(
                      builder: (context, orderProvider, _) {
                        return OnGoingOrderWidget(
                          customerName: order['customerName'],
                          orderTime: order['orderTime'],
                          orderId: order['orderId'],
                          totalAmount: order['totalAmount'],
                          orderItems: orderProvider.orderItems,
                          message: order['message'],
                          orderStatus: order['orderStatus'],
                          width: width,
                          height: height,
                          onStatusChange: (String newStatus) {
                            provider.updateOrderStatus(index, newStatus);
                          },
                          onViewDetails: () {
                            provider.viewOrderDetails(index);
                          },
                        );
                      },
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}