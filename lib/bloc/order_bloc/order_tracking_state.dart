import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as gmaps;
import 'package:flutter_map/flutter_map.dart';

abstract class OrderTrackingState {}

class OrderTrackingInitialState extends OrderTrackingState {}

class OrderTrackingLoadingState extends OrderTrackingState {}

class OrderTrackingLoadedState extends OrderTrackingState {
  final List<gmaps.LatLng> routeCoordinates;
  final List<Marker> markers;

  OrderTrackingLoadedState({required this.routeCoordinates, required this.markers});
}

class OrderTrackingErrorState extends OrderTrackingState {
  final String message;

  OrderTrackingErrorState(this.message);
}
