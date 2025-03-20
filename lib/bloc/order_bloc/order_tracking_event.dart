
import '../../models/order.dart';

abstract class OrderTrackingEvent {}

class FetchRouteCoordinatesEvent extends OrderTrackingEvent {
  final Order order;

  FetchRouteCoordinatesEvent(this.order);
}
