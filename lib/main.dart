//
// //Implementation of track_order.dart with the Sample data
//
// import 'package:flutter/material.dart';
// import 'package:latlong2/latlong.dart';
// import 'Screens/tarck_order.dart';
// import 'models/order.dart';
//
// void main() {
//   final sampleOrder = Order(
//     customerName: 'Ayushi',
//     orderId: 120,
//     orderTime: DateTime.now(),
//     total: 1840.0,
//     phone: '+923345867968',
//     email: 'customer@example.com',
//     items: [
//       OrderItem(name: 'Roti and Dal Makhni', quantity: 3, price: 1200.0),
//     ],
//     routeCoordinates: [
//       LatLng(19.1104, 72.9289), // Restaurant location (Vikhroli, Mumbai)
//       LatLng(19.0734, 72.9289), // Delivery person's current position (5 km away)
//       LatLng(19.0184, 72.9289), // Destination (10 km away from delivery person)
//     ],
//     message: "Hi please add white sauce in my order",
//   );
//
//   runApp(MyApp(order: sampleOrder));
// }
//
// class MyApp extends StatefulWidget {
//   final Order order;
//
//   const MyApp({super.key, required this.order});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MyTrackApp(order: widget.order);
//   }
// }


//Implementation of Order_Completion.dart

import 'package:flutter/material.dart';
import 'package:mishra_ji_seller/Providers/ongoing_order_details_provider.dart';
import 'package:mishra_ji_seller/Screens/new_order_details.dart';
import 'package:provider/provider.dart';
import 'package:mishra_ji_seller/Screens/order_completion.dart';
import 'package:mishra_ji_seller/Screens/seller_home_screen.dart';
import 'Providers/new_order_details_provider.dart';
import 'Providers/order_completion_provider.dart';
import 'Providers/order_provider.dart';
import 'Providers/seller_home_provider.dart';
import 'Screens/new_order.dart';
import 'Screens/ongoing_order_details.dart'; // Import the provider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => OrderProvider(),
        child: const NewOrder(),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// // Import your OrderDetailsScreen
// import 'Screens/new_order.dart';
// import 'Screens/new_order_details.dart';
// import 'Screens/ongoing_order_details.dart';
// import 'Screens/order_completion.dart';
// import 'Screens/seller_home_screen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Order Management App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: const OrderDetailsScreen(), // Set OrderDetailsScreen as home
//       // Alternatively, you can use routes:
//       // routes: {
//       //   '/order-details': (context) => const OrderDetailsScreen(),
//       // },
//     );
//   }
// }