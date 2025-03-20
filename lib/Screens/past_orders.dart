// import 'package:flutter/material.dart';
//
// class PastOrderWidget extends StatefulWidget {
//   final String customerName;
//   final String orderTime;
//   final String orderId;
//   final String totalAmount;
//   final List<Map<String, String>> orderItems;
//   final String message;
//   final String orderStatus;
//   final VoidCallback onViewDetails;
//
//   const PastOrderWidget({
//     Key? key,
//     required this.customerName,
//     required this.orderTime,
//     required this.orderId,
//     required this.totalAmount,
//     required this.orderItems,
//     required this.message,
//     required this.orderStatus,
//     required this.onViewDetails,
//   }) : super(key: key);
//
//   @override
//   _PastOrderWidgetState createState() => _PastOrderWidgetState();
// }
//
// class _PastOrderWidgetState extends State<PastOrderWidget> {
//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//
//     return Container(
//       padding: EdgeInsets.all(width * 0.04),
//       decoration: _containerDecoration(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildOrderHeader(width, height),
//           SizedBox(height: height * 0.03),
//           ...widget.orderItems.map((item) => Padding(
//             padding: EdgeInsets.only(bottom: height * 0.015),
//             child: _buildOrderItem(
//                 item['name']!, item['quantity']!, item['price']!, width, height),
//           )),
//           SizedBox(height: height * 0.03),
//           _buildMessageSection(width, height),
//           SizedBox(height: height * 0.03),
//           _buildOrderActions(width, height),
//           SizedBox(height: height * 0.002),
//           Container(
//             height: height * 0.0001,
//             width: width,
//             decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.black12,
//                   width: 1.0,
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
//
//   BoxDecoration _containerDecoration() {
//     return BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(8),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.1),
//           spreadRadius: 1,
//           blurRadius: 4,
//           offset: const Offset(0, 2),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildOrderHeader(double width, double height) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.customerName,
//               style: TextStyle(
//                 fontSize: height * 0.02,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             Text(
//               widget.orderTime,
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: height * 0.015,
//               ),
//             ),
//           ],
//         ),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               'Order ID: ${widget.orderId}',
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: height * 0.015,
//               ),
//             ),
//             Text(
//               'Total ${widget.totalAmount}',
//               style: TextStyle(
//                 fontSize: height * 0.02,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildOrderItem(String name, String quantity, String price, double width, double height) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           name,
//           style: TextStyle(
//             fontSize: height * 0.02,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         Row(
//           children: [
//             Text(
//               'Qty $quantity',
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: height * 0.015,
//               ),
//             ),
//             SizedBox(width: width * 0.05),
//             Text(
//               'INR: $price',
//               style: TextStyle(
//                 fontSize: height * 0.02,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildMessageSection(double width, double height) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Message:',
//           style: TextStyle(
//             fontSize: height * 0.02,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         SizedBox(width: width * 0.02),
//         Text(
//           widget.message,
//           style: TextStyle(
//             color: Colors.grey[600],
//             fontSize: height * 0.015,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildOrderActions(double width, double height) {
//     return SizedBox(
//       width: width,
//       height: height * 0.08,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           SizedBox(
//             width: width * 0.2,
//             child: Text(
//               "Order Status",
//               style: TextStyle(fontSize: height * 0.013),
//             ),
//           ),
//           Spacer(),
//           SizedBox(
//             width: width * 0.3,
//             child: OutlinedButton(
//               onPressed: widget.onViewDetails,
//               style: OutlinedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: height * 0.015),
//                 side: BorderSide(color: Colors.orange),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(width * 0.06),
//                 ),
//               ),
//               child: FittedBox(
//                 child: Text(
//                   'View Details',
//                   style: TextStyle(
//                     color: Colors.orange,
//                     fontSize: height * 0.02,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/past_order_provider.dart';


class PastOrderWidget extends StatelessWidget {
  final PastOrder order;
  final VoidCallback? onViewDetails;

  const PastOrderWidget({
    Key? key,
    required this.order,
    this.onViewDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.all(width * 0.04),
      decoration: _containerDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOrderHeader(width, height),
          SizedBox(height: height * 0.03),
          ...order.orderItems.map((item) => Padding(
            padding: EdgeInsets.only(bottom: height * 0.015),
            child: _buildOrderItem(
                item.name, item.quantity, item.price, width, height),
          )),
          SizedBox(height: height * 0.03),
          _buildMessageSection(width, height),
          SizedBox(height: height * 0.03),
          _buildOrderActions(width, height, context),
          SizedBox(height: height * 0.002),
          Container(
            height: height * 0.0001,
            width: width,
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 1.0,
                )),
          ),
        ],
      ),
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    );
  }

  Widget _buildOrderHeader(double width, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              order.customerName,
              style: TextStyle(
                fontSize: height * 0.02,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              order.orderTime,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: height * 0.015,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Order ID: ${order.orderId}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: height * 0.015,
              ),
            ),
            Text(
              'Total ${order.totalAmount}',
              style: TextStyle(
                fontSize: height * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderItem(String name, String quantity, String price, double width, double height) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: height * 0.02,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            Text(
              'Qty $quantity',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: height * 0.015,
              ),
            ),
            SizedBox(width: width * 0.05),
            Text(
              'INR: $price',
              style: TextStyle(
                fontSize: height * 0.02,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMessageSection(double width, double height) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Message:',
          style: TextStyle(
            fontSize: height * 0.02,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: width * 0.02),
        Text(
          order.message,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: height * 0.015,
          ),
        ),
      ],
    );
  }

  Widget _buildOrderActions(double width, double height, BuildContext context) {
    return SizedBox(
      width: width,
      height: height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 0.2,
            child: Text(
              "Order Status: ${order.orderStatus}",
              style: TextStyle(fontSize: height * 0.013),
            ),
          ),
          Spacer(),
          SizedBox(
            width: width * 0.3,
            child: OutlinedButton(
              onPressed: onViewDetails ?? () {
                // Default behavior if no callback provided
                context.read<PastOrderProvider>().selectOrder(order);
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: height * 0.015),
                side: BorderSide(color: Colors.orange),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.06),
                ),
              ),
              child: FittedBox(
                child: Text(
                  'View Details',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: height * 0.02,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}