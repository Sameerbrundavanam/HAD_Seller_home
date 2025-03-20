// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart' as latlng;
// import 'package:latlong2/latlong.dart' as gmaps;
// import 'package:url_launcher/url_launcher.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:http/http.dart' as http;
//
//
// /// Model for an order
// class Order {
//   final String customerName;
//   final int orderId;
//   final DateTime orderTime;
//   final double total;
//   final String phone;
//   final String email;
//   final List<OrderItem> items;
//   final List<gmaps.LatLng> routeCoordinates;
//   final String message;
//
//   Order({
//     required this.customerName,
//     required this.orderId,
//     required this.orderTime,
//     required this.total,
//     required this.phone,
//     required this.email,
//     required this.items,
//     required this.routeCoordinates,
//     required this.message,
//   });
// }
//
// /// Model for an individual order item
// class OrderItem {
//   final String name;
//   final int quantity;
//   final double price;
//
//   OrderItem({
//     required this.name,
//     required this.quantity,
//     required this.price,
//   });
// }
//
// class OrderTrackingScreen extends StatefulWidget {
//   final Order order;
//   const OrderTrackingScreen({super.key, required this.order});
//
//   @override
//   State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
// }
//
// class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
//   final MapController _mapController = MapController();
//   List<gmaps.LatLng> _routeCoordinates = [];
//   final List<Marker> _markers = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _requestPermissions();
//     _fetchRoute(); // Fetch route data
//   }
//
//   /// Request location permission
//   Future<void> _requestPermissions() async {
//     final status = await Permission.location.request();
//     if (!status.isGranted) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Location permission is required for tracking.')),
//       );
//     }
//   }
//
//   /// Fetch route coordinates from OSRM API
//   Future<void> _fetchRoute() async {
//     if (widget.order.routeCoordinates.length < 2) return;
//
//     final gmaps.LatLng startPoint = widget.order.routeCoordinates.first;
//     final gmaps.LatLng endPoint = widget.order.routeCoordinates.last;
//
//     final String url =
//         'https://router.project-osrm.org/route/v1/driving/${startPoint.longitude},${startPoint.latitude};${endPoint.longitude},${endPoint.latitude}?overview=full&geometries=geojson';
//
//     final response = await http.get(Uri.parse(url));
//
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       print('OSRM Response: ${response.body}'); // Debugging
//
//       final List coordinates = data['routes'][0]['geometry']['coordinates'];
//       setState(() {
//         _routeCoordinates = coordinates
//             .map((coord) => gmaps.LatLng(coord[1], coord[0])) // Convert [lon, lat] to LatLng
//             .toList();
//
//         _setRoutePolylines();
//
//         // Move map to first route point
//         if (_routeCoordinates.isNotEmpty) {
//           _mapController.move(_routeCoordinates.first as latlng.LatLng, 12);
//         }
//       });
//     } else {
//       print('Failed to fetch route. Status Code: ${response.statusCode}');
//     }
//   }
//
//   /// Set polylines and markers on the map
//   void _setRoutePolylines() {
//     setState(() {
//       _markers.clear();
//
//       if (_routeCoordinates.isNotEmpty) {
//         _markers.addAll([
//           Marker(
//             point: _routeCoordinates.first,
//             width: 50,
//             height: 50,
//             child: const Icon(Icons.store, color: Colors.red, size: 30),
//           ),
//           if (_routeCoordinates.length > 1)
//             Marker(
//               point: _routeCoordinates[1],
//               child: const Icon(
//                 Icons.delivery_dining,
//                 color: Colors.blue,
//                 size: 40,
//               ),
//             ),
//           Marker(
//             point: _routeCoordinates.last,
//             width: 50,
//             height: 50,
//             child: const Icon(Icons.flag, color: Colors.green, size: 30),
//           ),
//         ]);
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _mapController.dispose();
//     super.dispose();
//   }
//
//   /// Launch a URL with error handling.
//   Future<void> _launchUrl(String url) async {
//     final uri = Uri.parse(url);
//     if (await canLaunchUrl(uri)) {
//       await launchUrl(uri);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Could not launch $url')),
//       );
//     }
//   }
//
//   /// A reusable widget for contact rows.
//   Widget _buildContactRow({
//     required String label,
//     required String value,
//     required String action,
//     required VoidCallback onTap,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//             ),
//           ),
//           GestureDetector(
//             onTap: onTap,
//             child: Container(
//               width: 100,
//               padding: const EdgeInsets.symmetric(vertical: 8),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.deepOrange),
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               child: Text(
//                 action,
//                 style: const TextStyle(
//                   color: Colors.deepOrange,
//                   fontWeight: FontWeight.w500,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   /// A helper method to format the [DateTime].
//   String _formatDateTime(DateTime dateTime) {
//     final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
//     final minute = dateTime.minute.toString().padLeft(2, '0');
//     final period = dateTime.hour >= 12 ? 'PM' : 'AM';
//     return '$hour:$minute $period';
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Track Order'),
//         backgroundColor: Colors.deepOrange,
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 16.0),
//             child: CircleAvatar(
//               backgroundColor: Colors.white24,
//               child: Icon(Icons.person, color: Colors.white),
//             ),
//           ),
//         ],
//       ),
//       body: Stack(
//         children: [
//           // Main screen content
//           Positioned.fill(
//             child: FlutterMap(
//               mapController: _mapController,
//               options: MapOptions(
//                 initialCenter: _routeCoordinates.isNotEmpty
//                     ? _routeCoordinates.first
//                     : latlng.LatLng(20.5937, 78.9629), // Default to India center
//                 initialZoom: _routeCoordinates.isNotEmpty ? 12 : 4,
//               ),
//               children: [
//                 TileLayer(
//                   urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//                   subdomains: const ['a', 'b', 'c'],
//                 ),
//                 if (_routeCoordinates.isNotEmpty)
//                   PolylineLayer(
//                     polylines: [
//                       Polyline(
//                         points: _routeCoordinates,
//                         strokeWidth: 5,
//                         color: Colors.deepOrange,
//                       ),
//                     ],
//                   ),
//                 MarkerLayer(
//                   markers: _markers,
//                 ),
//               ],
//             ),
//           ),
//
//           // DraggableScrollableSheet as a persistent bottom sheet
//           DraggableScrollableSheet(
//             initialChildSize: 0.3, // Start at 30% height
//             minChildSize: 0.1, // Minimum height (10% of screen)
//             maxChildSize: 0.9, // Maximum height (90% of screen)
//             builder: (context, scrollController) {
//               return Container(
//                 padding: const EdgeInsets.all(16),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black26,
//                       spreadRadius: 1,
//                       blurRadius: 10,
//                     ),
//                   ],
//                 ),
//                 child: SingleChildScrollView(
//                   controller: scrollController, // Allows smooth dragging
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Drag Handle
//                       Center(
//                         child: Container(
//                           width: 50,
//                           height: 5,
//                           margin: const EdgeInsets.only(bottom: 12),
//                           decoration: BoxDecoration(
//                             color: Colors.black26,
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                       ),
//
//                       // Order Header
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             widget.order.customerName,
//                             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             'Order ID: ${widget.order.orderId}',
//                             style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             _formatDateTime(widget.order.orderTime),
//                             style: const TextStyle(color: Colors.black54),
//                           ),
//                           Text(
//                             'Total INR ${widget.order.total.toStringAsFixed(2)}',
//                             style: const TextStyle(fontWeight: FontWeight.w500),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 16),
//
//                       // Contact Info
//                       _buildContactRow(
//                         label: 'Phone',
//                         value: widget.order.phone,
//                         action: 'Call',
//                         onTap: () => _launchUrl('tel:${widget.order.phone}'),
//                       ),
//                       _buildContactRow(
//                         label: 'Email',
//                         value: widget.order.email,
//                         action: 'Email',
//                         onTap: () => _launchUrl('mailto:${widget.order.email}'),
//                       ),
//                       _buildContactRow(
//                         label: 'Destination',
//                         value: 'Navigate',
//                         action: 'Navigate',
//                         onTap: () {
//                           final dest = widget.order.routeCoordinates.last;
//                           _launchUrl('https://maps.google.com/?q=${dest.latitude},${dest.longitude}');
//                         },
//                       ),
//                       const SizedBox(height: 16),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Message:',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Text(
//                         widget.order.message,
//                         style: TextStyle(
//                           color: Colors.grey[600],
//                           fontSize: 14,
//                         ),
//                       ),
//                     ],
//                   ),
//                       // Order Items
//                       const Divider(thickness: 1,color: Color(0xFFF0812D)),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Expanded(flex: 2,child: Text("Items"),),
//                           Expanded(child: Text("Quantity", textAlign: TextAlign.center),),
//                           Expanded(child: Text("Price", textAlign: TextAlign.right)),
//                         ],
//                       ),
//                       const Divider(thickness: 1,color: Color(0xFFF0812D)),
//                       Column(
//                         children: widget.order.items.map((item) {
//                           return Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 4.0),
//                             child: Row(
//                               children: [
//                                 Expanded(flex: 2, child: Text(item.name)),
//                                 Expanded(child: Text('Qty: ${item.quantity}', textAlign: TextAlign.center)),
//                                 Expanded(child: Text('INR ${item.price.toStringAsFixed(2)}', textAlign: TextAlign.right)),
//                               ],
//                             ),
//                           );
//                         }).toList(),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
//
// }
//
// /// Entry point of the app. For now, we are using sample data.
// /// Later, you can replace this data with backend responses.
// final sampleOrder = Order(
//   customerName: 'Ayushi',
//   orderId: 120,
//   orderTime: DateTime.now(),
//   total: 1840.0,
//   phone: '+923345867968',
//   email: 'customer@example.com',
//   items: [
//     OrderItem(name: 'Naan and Korma', quantity: 3, price: 1200.0),
//     // Add more items if needed.
//   ],
//   routeCoordinates: const [
//     gmaps.LatLng(-33.7, 150.9), // Restaurant location
//     gmaps.LatLng(-33.8, 151.0), // Delivery person's current position
//     gmaps.LatLng(-33.9, 151.1), // Destination
//   ],
//   message: "Hi please add white sauce in my order",
// );
//
// /// The root widget that injects the [Order] data into [OrderTrackingScreen].
// class MyTrackApp extends StatelessWidget {
//   final Order order;
//   const MyTrackApp({super.key, required this.order});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Order Tracking',
//       theme: ThemeData(primarySwatch: Colors.deepOrange),
//       home: OrderTrackingScreen(order: order),
//     );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;
import 'package:latlong2/latlong.dart' as gmaps;
import 'package:url_launcher/url_launcher.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

import '../Providers/track_order_provider.dart';
import '../models/order.dart';

// Import the provider file


class OrderTrackingScreen extends StatefulWidget {
  final Order order;
  const OrderTrackingScreen({super.key, required this.order});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  final MapController _mapController = MapController();
  List<gmaps.LatLng> _routeCoordinates = [];
  final List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _requestPermissions();
    _fetchRoute(); // Fetch route data
  }

  /// Request location permission
  Future<void> _requestPermissions() async {
    final status = await Permission.location.request();
    if (!status.isGranted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Location permission is required for tracking.')),
      );
    }
  }

  /// Fetch route coordinates from OSRM API
  Future<void> _fetchRoute() async {
    if (widget.order.routeCoordinates.length < 2) return;

    final gmaps.LatLng startPoint = widget.order.routeCoordinates.first;
    final gmaps.LatLng endPoint = widget.order.routeCoordinates.last;

    final String url =
        'https://router.project-osrm.org/route/v1/driving/${startPoint.longitude},${startPoint.latitude};${endPoint.longitude},${endPoint.latitude}?overview=full&geometries=geojson';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('OSRM Response: ${response.body}'); // Debugging

      final List coordinates = data['routes'][0]['geometry']['coordinates'];
      setState(() {
        _routeCoordinates = coordinates
            .map((coord) => gmaps.LatLng(coord[1], coord[0])) // Convert [lon, lat] to LatLng
            .toList();

        _setRoutePolylines();

        // Move map to first route point
        if (_routeCoordinates.isNotEmpty) {
          _mapController.move(_routeCoordinates.first as latlng.LatLng, 12);
        }
      });
    } else {
      print('Failed to fetch route. Status Code: ${response.statusCode}');
    }
  }

  /// Set polylines and markers on the map
  void _setRoutePolylines() {
    setState(() {
      _markers.clear();

      if (_routeCoordinates.isNotEmpty) {
        _markers.addAll([
          Marker(
            point: _routeCoordinates.first,
            width: 50,
            height: 50,
            child: const Icon(Icons.store, color: Colors.red, size: 30),
          ),
          if (_routeCoordinates.length > 1)
            Marker(
              point: _routeCoordinates[1],
              child: const Icon(
                Icons.delivery_dining,
                color: Colors.blue,
                size: 40,
              ),
            ),
          Marker(
            point: _routeCoordinates.last,
            width: 50,
            height: 50,
            child: const Icon(Icons.flag, color: Colors.green, size: 30),
          ),
        ]);
      }
    });
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  /// Launch a URL with error handling.
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }

  /// A reusable widget for contact rows.
  Widget _buildContactRow({
    required String label,
    required String value,
    required String action,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 100,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrange),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                action,
                style: const TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// A helper method to format the [DateTime].
  String _formatDateTime(DateTime dateTime) {
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = dateTime.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Track Order'),
        backgroundColor: Colors.deepOrange,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(Icons.person, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Main screen content
          Positioned.fill(
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _routeCoordinates.isNotEmpty
                    ? _routeCoordinates.first
                    : latlng.LatLng(20.5937, 78.9629), // Default to India center
                initialZoom: _routeCoordinates.isNotEmpty ? 12 : 4,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: const ['a', 'b', 'c'],
                ),
                if (_routeCoordinates.isNotEmpty)
                  PolylineLayer(
                    polylines: [
                      Polyline(
                        points: _routeCoordinates,
                        strokeWidth: 5,
                        color: Colors.deepOrange,
                      ),
                    ],
                  ),
                MarkerLayer(
                  markers: _markers,
                ),
              ],
            ),
          ),

          // DraggableScrollableSheet as a persistent bottom sheet
          DraggableScrollableSheet(
            initialChildSize: 0.3, // Start at 30% height
            minChildSize: 0.1, // Minimum height (10% of screen)
            maxChildSize: 0.9, // Maximum height (90% of screen)
            builder: (context, scrollController) {
              return Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController, // Allows smooth dragging
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Drag Handle
                      Center(
                        child: Container(
                          width: 50,
                          height: 5,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),

                      // Order Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.order.customerName,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Order ID: ${widget.order.orderId}',
                            style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.black54),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _formatDateTime(widget.order.orderTime),
                            style: const TextStyle(color: Colors.black54),
                          ),
                          Text(
                            'Total INR ${widget.order.total.toStringAsFixed(2)}',
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Contact Info
                      _buildContactRow(
                        label: 'Phone',
                        value: widget.order.phone,
                        action: 'Call',
                        onTap: () => _launchUrl('tel:${widget.order.phone}'),
                      ),
                      _buildContactRow(
                        label: 'Email',
                        value: widget.order.email,
                        action: 'Email',
                        onTap: () => _launchUrl('mailto:${widget.order.email}'),
                      ),
                      _buildContactRow(
                        label: 'Destination',
                        value: 'Navigate',
                        action: 'Navigate',
                        onTap: () {
                          final dest = widget.order.routeCoordinates.last;
                          _launchUrl('https://maps.google.com/?q=${dest.latitude},${dest.longitude}');
                        },
                      ),
                      const SizedBox(height: 16),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Message:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            widget.order.message,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      // Order Items
                      const Divider(thickness: 1,color: Color(0xFFF0812D)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(flex: 2,child: Text("Items"),),
                          Expanded(child: Text("Quantity", textAlign: TextAlign.center),),
                          Expanded(child: Text("Price", textAlign: TextAlign.right)),
                        ],
                      ),
                      const Divider(thickness: 1,color: Color(0xFFF0812D)),
                      Column(
                        children: widget.order.items.map((item) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Row(
                              children: [
                                Expanded(flex: 2, child: Text(item.name)),
                                Expanded(child: Text('Qty: ${item.quantity}', textAlign: TextAlign.center)),
                                Expanded(child: Text('INR ${item.price.toStringAsFixed(2)}', textAlign: TextAlign.right)),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// The root widget that injects the [Order] data into [OrderTrackingScreen].
class MyTrackApp extends StatelessWidget {
  final Order order;
  const MyTrackApp({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Order Tracking',
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: OrderTrackingScreen(order: order),
    );
  }
}