import 'package:latlong2/latlong.dart' as latlng;

/// Model for a tracking order
class TrackingOrder {
  final String customerName;
  final int orderId;
  final DateTime orderTime;
  final double total;
  final String phone;
  final String email;
  final List<TrackingOrderItem> items;
  final List<latlng.LatLng> routeCoordinates;
  final String message;

  TrackingOrder({
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

/// Model for an individual tracking order item
class TrackingOrderItem {
  final String name;
  final int quantity;
  final double price;

  TrackingOrderItem({
    required this.name,
    required this.quantity,
    required this.price,
  });
}

/// Sample tracking order data
final sampleTrackingOrder = TrackingOrder(
  customerName: 'Ayushi',
  orderId: 120,
  orderTime: DateTime.now(),
  total: 1840.0,
  phone: '+923345867968',
  email: 'customer@example.com',
  items: [
    TrackingOrderItem(name: 'Naan and Korma', quantity: 3, price: 1200.0),
    // Add more items if needed.
  ],
  routeCoordinates: const [
    latlng.LatLng(-33.7, 150.9), // Restaurant location
    latlng.LatLng(-33.8, 151.0), // Delivery person's current position
    latlng.LatLng(-33.9, 151.1), // Destination
  ],
  message: "Hi please add white sauce in my order",
);