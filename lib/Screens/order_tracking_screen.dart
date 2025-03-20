import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart' as gmaps;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;
import '../bloc/order_bloc/order_tracking_bloc.dart';
import '../bloc/order_bloc/order_tracking_event.dart';
import '../bloc/order_bloc/order_tracking_state.dart';
import '../models/order.dart';

class OrderTrackingScreen extends StatefulWidget {
  final Order order;
  const OrderTrackingScreen({super.key, required this.order});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  final MapController _mapController = MapController();
  List<gmaps.LatLng> _routeCoordinates = [];
  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    // Fetching route coordinates when the screen is initialized
    BlocProvider.of<OrderTrackingBloc>(context).add(FetchRouteCoordinatesEvent(widget.order));
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
      body: BlocBuilder<OrderTrackingBloc, OrderTrackingState>(
        builder: (context, state) {
          // Display loading indicator while fetching data
          if (state is OrderTrackingLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          // Display error message if there is an error in fetching data
          else if (state is OrderTrackingErrorState) {
            return Center(child: Text(state.message));
          }
          // Display the map with data when fetched successfully
          else if (state is OrderTrackingLoadedState) {
            // Get route coordinates and markers from the loaded state
            _routeCoordinates = state.routeCoordinates;
            _markers = state.markers;

            return Stack(
              children: [
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
                // Additional UI elements like Bottom Sheet can go here
              ],
            );
          }
          // Return an empty container if the state is unhandled
          return Container();
        },
      ),
    );
  }
}
