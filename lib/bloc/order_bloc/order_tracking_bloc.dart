import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart' as gmaps;
import '../../models/order.dart';
import 'order_tracking_event.dart';
import 'order_tracking_state.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_map/flutter_map.dart';


class OrderTrackingBloc extends Bloc<OrderTrackingEvent, OrderTrackingState> {
  OrderTrackingBloc() : super(OrderTrackingInitialState());

  @override
  Stream<OrderTrackingState> mapEventToState(OrderTrackingEvent event) async* {
    if (event is FetchRouteCoordinatesEvent) {
      yield* _mapFetchRouteCoordinatesToState(event.order);
    }
  }

  Stream<OrderTrackingState> _mapFetchRouteCoordinatesToState(Order order) async* {
    yield OrderTrackingLoadingState();

    try {
      final gmaps.LatLng startPoint = order.routeCoordinates.first as gmaps.LatLng;
      final gmaps.LatLng endPoint = order.routeCoordinates.last as gmaps.LatLng;

      final String url =
          'https://router.project-osrm.org/route/v1/driving/${startPoint.longitude},${startPoint.latitude};${endPoint.longitude},${endPoint.latitude}?overview=full&geometries=geojson';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        final List coordinates = data['routes'][0]['geometry']['coordinates'];
        final List<gmaps.LatLng> routeCoordinates = coordinates
            .map((coord) => gmaps.LatLng(coord[1], coord[0]))
            .toList();

        final List<Marker> markers = _createMarkers(routeCoordinates);

        yield OrderTrackingLoadedState(
          routeCoordinates: routeCoordinates,
          markers: markers,
        );
      } else {
        yield OrderTrackingErrorState('Failed to fetch route');
      }
    } catch (e) {
      yield OrderTrackingErrorState('Error: ${e.toString()}');
    }
  }

  List<Marker> _createMarkers(List<gmaps.LatLng> routeCoordinates) {
    final List<Marker> markers = [];

    if (routeCoordinates.isNotEmpty) {
      markers.add(
        Marker(
          point: routeCoordinates.first,
          width: 50,
          height: 50,
          child: const Icon(Icons.store, color: Colors.red, size: 30),
        ),
      );
      if (routeCoordinates.length > 1) {
        markers.add(
          Marker(
            point: routeCoordinates[1],
            child: const Icon(
              Icons.delivery_dining,
              color: Colors.blue,
              size: 40,
            ),
          ),
        );
      }
      markers.add(
        Marker(
          point: routeCoordinates.last,
          width: 50,
          height: 50,
          child: const Icon(Icons.flag, color: Colors.green, size: 30),
        ),
      );
    }
    return markers;
  }
}
