// import 'package:flutter/material.dart';
//
// class OnGoingOrderWidget extends StatefulWidget {
//   final String customerName;
//   final String orderTime;
//   final String orderId;
//   final String totalAmount;
//   final List<Map<String, String>> orderItems;
//   final String message;
//   final String orderStatus;
//   final double width;
//   final double height;
//   final VoidCallback onViewDetails;
//   final Function(String) onStatusChange;
//
//   const OnGoingOrderWidget({
//     Key? key,
//     required this.customerName,
//     required this.orderTime,
//     required this.orderId,
//     required this.totalAmount,
//     required this.orderItems,
//     required this.message,
//     required this.orderStatus,
//     required this.width,
//     required this.height,
//     required this.onViewDetails,
//     required this.onStatusChange,
//   }) : super(key: key);
//
//   @override
//   _OnGoingOrderState createState() => _OnGoingOrderState();
// }
//
// class _OnGoingOrderState extends State<OnGoingOrderWidget> {
//   late String selectedStatus;
//
//   @override
//   void initState() {
//     super.initState();
//     selectedStatus = widget.orderStatus;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: _containerDecoration(),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           _buildOrderHeader(widget.customerName, widget.orderTime, widget.orderId, widget.totalAmount, widget.height, widget.width),
//           const SizedBox(height: 24),
//           ...widget.orderItems.map((item) => Padding(
//             padding: const EdgeInsets.only(bottom: 12.0),
//             child: _buildOrderItem(item['name']!, item['quantity']!, item['price']!),
//           )),
//           const SizedBox(height: 24),
//           _buildMessageSection(widget.message),
//           const SizedBox(height: 24),
//           _buildOrderActions(),
//           const SizedBox(height: 2),
//           Container(
//             height: widget.height * 0.0001,
//             width: widget.width,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.black12,
//                 width: 1.0,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderActions() {
//     List<String> statusOptions = ['Order Processing', 'Shipped', 'Delivered', 'Cancelled'];
//
//     return SizedBox(
//       width: widget.width,
//       height: widget.height * 0.08,
//       child: Row(
//         children: [
//           SizedBox(
//             width: widget.width * 0.2,
//             child: Text(
//               "Order Status",
//               style: TextStyle(fontSize: widget.width * 0.030),
//             ),
//           ),
//           SizedBox(width: widget.width * 0.02),
//           SizedBox(
//             width: widget.width * 0.35,
//             child: Container(
//               padding: EdgeInsets.symmetric(vertical: widget.height * 0.008),
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey[300]!),
//                 borderRadius: BorderRadius.circular(widget.width * 0.01),
//               ),
//               child: DropdownButton<String>(
//                 value: selectedStatus,
//                 onChanged: (String? newValue) {
//                   if (newValue != null) {
//                     setState(() {
//                       selectedStatus = newValue;
//                     });
//                     widget.onStatusChange(newValue);
//                   }
//                 },
//                 items: statusOptions
//                     .map((String value) => DropdownMenuItem<String>(
//                   value: value,
//                   child: Padding(
//                     padding: EdgeInsets.all(widget.width * 0.02),
//                     child: Text(
//                       value,
//                       style: TextStyle(
//                         color: Colors.orange[700],
//                         fontSize: widget.width * 0.030,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ))
//                     .toList(),
//                 underline: Container(),
//                 icon: Icon(
//                   Icons.arrow_drop_down,
//                   color: Colors.orange[700],
//                 ),
//                 isExpanded: true,
//                 style: TextStyle(
//                   color: Colors.orange[700],
//                   fontSize: widget.width * 0.030,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ),
//           SizedBox(width: widget.width * 0.03),
//           SizedBox(
//             width: widget.width * 0.3,
//             child: OutlinedButton(
//               onPressed: widget.onViewDetails,
//               style: OutlinedButton.styleFrom(
//                 padding: EdgeInsets.symmetric(vertical: widget.height * 0.015),
//                 side: const BorderSide(color: Colors.orange),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(widget.width * 0.06),
//                 ),
//               ),
//               child: FittedBox(
//                 child: Text(
//                   'View Details',
//                   style: TextStyle(
//                     color: Colors.orange,
//                     fontSize: widget.width * 0.030,
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
//
// BoxDecoration _containerDecoration() {
//   return BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(8),
//     boxShadow: [
//       BoxShadow(
//         color: Colors.grey.withOpacity(0.1),
//         spreadRadius: 1,
//         blurRadius: 4,
//         offset: const Offset(0, 2),
//       ),
//     ],
//   );
// }
//
// Widget _buildOrderHeader(String customerName, String orderTime, String orderId, String totalAmount, double height, double width) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             customerName,
//             style: TextStyle(
//               fontSize: height * 0.02,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           Text(
//             orderTime,
//             style: TextStyle(
//               color: Colors.grey[600],
//               fontSize: 14,
//             ),
//           ),
//         ],
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Text(
//             'Order ID: $orderId',
//             style: TextStyle(
//               color: Colors.grey[600],
//               fontSize: 14,
//             ),
//           ),
//           Text(
//             'Total $totalAmount',
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     ],
//   );
// }
//
// Widget _buildOrderItem(String name, String quantity, String price) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       Text(
//         name,
//         style: const TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       Row(
//         children: [
//           Text(
//             'Qty $quantity',
//             style: TextStyle(
//               color: Colors.grey[600],
//               fontSize: 14,
//             ),
//           ),
//           const SizedBox(width: 20),
//           Text(
//             'INR: $price',
//             style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     ],
//   );
// }
//
// Widget _buildMessageSection(String message) {
//   return Row(
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       const Text(
//         'Message:',
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       const SizedBox(width: 8),
//       Text(
//         message,
//         style: TextStyle(
//           color: Colors.grey[600],
//           fontSize: 14,
//         ),
//       ),
//     ],
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import '../Providers/ongoing_order_provider.dart';
// import 'past_orders.dart';
// import 'ongoing_orders.dart';
//
// class NewOrder extends StatelessWidget {
//   const NewOrder({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => OnGoingOrderProvider(),
//       child: const NewOrderView(),
//     );
//   }
// }
//
// class NewOrderView extends StatelessWidget {
//   const NewOrderView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<OnGoingOrderProvider>(context);
//     final size = MediaQuery.sizeOf(context);
//     final height = size.height;
//     final width = size.width;
//     final double iconSize = width * 0.07;
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DefaultTabController(
//         length: 3,
//         initialIndex: provider.selectedTabIndex,
//         child: Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             backgroundColor: const Color(0xFFF0812D),
//             leading: GestureDetector(
//               onTap: () {},
//               child: const Icon(
//                 FontAwesomeIcons.arrowLeftLong,
//                 color: Colors.white,
//               ),
//             ),
//             title: const Text(
//               "Our Orders",
//               style: TextStyle(color: Colors.white),
//             ),
//             actions: [
//               GestureDetector(
//                 onTap: () {},
//                 child: Icon(
//                   Icons.person,
//                   color: Colors.white,
//                   size: iconSize,
//                 ),
//               ),
//               SizedBox(width: width * 0.03),
//             ],
//             bottom: PreferredSize(
//               preferredSize: const Size.fromHeight(50.0),
//               child: Container(
//                 color: Colors.white,
//                 child: TabBar(
//                   tabs: const [
//                     Tab(text: 'New Orders'),
//                     Tab(text: 'Ongoing Orders'),
//                     Tab(text: 'Past Orders'),
//                   ],
//                   indicatorColor: Colors.orange,
//                   labelColor: const Color(0xFFF0812D),
//                   unselectedLabelColor: Colors.black,
//                   onTap: (index) {
//                     provider.setSelectedTabIndex(index);
//                   },
//                 ),
//               ),
//             ),
//           ),
//           body: TabBarView(
//             children: [
//               // New Orders Tab
//               ListView.builder(
//                 itemCount: provider.newOrders.length,
//                 itemBuilder: (context, index) {
//                   final order = provider.newOrders[index];
//                   return buildListViewContainer(
//                     context: context,
//                     customerName: order['customerName'],
//                     orderTime: order['orderTime'],
//                     orderId: order['orderId'],
//                     totalAmount: order['totalAmount'], // This is now a double
//                     items: order['items'],
//                     message: order['message'],
//                     onCall: () => provider.callCustomer(index),
//                     onViewDetails: () => provider.viewOrderDetails(index),
//                     onCancel: () => provider.cancelOrder(index),
//                     onAccept: () => provider.acceptOrder(index),
//                   );
//                 },
//               ),
//
//               // Ongoing Orders Tab
//               ListView.builder(
//                 itemCount: provider.ongoingOrders.length,
//                 itemBuilder: (context, index) {
//                   final order = provider.ongoingOrders[index];
//                   return OnGoingOrderWidget(
//                     customerName: order['customerName'],
//                     orderTime: order['orderTime'],
//                     orderId: order['orderId'],
//                     totalAmount: order['totalAmount'],
//                     orderItems: provider.orderItems,
//                     message: order['message'],
//                     orderStatus: order['orderStatus'],
//                     width: width,
//                     height: height,
//                     onStatusChange: (String newStatus) {
//                       provider.updateOrderStatus(index, newStatus);
//                     },
//                     onViewDetails: () {
//                       provider.viewOrderDetails(index);
//                     },
//                   );
//                 },
//               ),
//
//               // Past Orders Tab
//               ListView.builder(
//                 itemCount: provider.pastOrders.length,
//                 itemBuilder: (context, index) {
//                   final order = provider.pastOrders[index];
//                   return PastOrderWidget(
//                     customerName: order['customerName'],
//                     orderTime: order['orderTime'],
//                     orderId: order['orderId'],
//                     totalAmount: order['totalAmount'],
//                     orderItems: provider.orderItems,
//                     message: order['message'],
//                     orderStatus: order['orderStatus'],
//                     onViewDetails: () {
//                       provider.viewOrderDetails(index);
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// Widget buildListViewContainer({
//   required BuildContext context,
//   required String customerName,
//   required String orderTime,
//   required String orderId,
//   required double totalAmount, // Keep as double
//   required List<Map<String, dynamic>> items,
//   required String message,
//   required VoidCallback onCall,
//   required VoidCallback onViewDetails,
//   required VoidCallback onCancel,
//   required VoidCallback onAccept,
// }) {
//   final size = MediaQuery.sizeOf(context);
//   final width = size.width;
//
//   return Container(
//     padding: EdgeInsets.all(width * 0.04),
//     margin: const EdgeInsets.all(8.0),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(12),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.grey.withOpacity(0.1),
//           spreadRadius: 1,
//           blurRadius: 10,
//           offset: const Offset(0, 1),
//         ),
//       ],
//     ),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   customerName,
//                   style: TextStyle(
//                     fontSize: width * 0.06,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Text(
//                   orderTime,
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: width * 0.035,
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   'Order id: $orderId',
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: width * 0.035,
//                   ),
//                 ),
//                 Text(
//                   'Total INR: ${totalAmount.toInt()}', // Convert to int for display if needed
//                   style: TextStyle(
//                     fontSize: width * 0.04,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Column(
//           children: items.map((item) {
//             return Padding(
//               padding: const EdgeInsets.only(bottom: 12),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     item['name'].toString(),
//                     style: TextStyle(
//                       fontSize: width * 0.04,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'Qty ${item['quantity'].toString()}',
//                         style: TextStyle(
//                           color: Colors.grey[600],
//                           fontSize: width * 0.035,
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       Text(
//                         'INR: ${item['price'].toString()}',
//                         style: TextStyle(
//                           fontSize: width * 0.04,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           }).toList(),
//         ),
//         const SizedBox(height: 20),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Message:',
//               style: TextStyle(
//                 fontSize: width * 0.04,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const SizedBox(height: 4),
//             Text(
//               message,
//               style: TextStyle(
//                 color: Colors.grey[600],
//                 fontSize: width * 0.035,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Row(
//           children: [
//             Expanded(
//               child: OutlinedButton(
//                 onPressed: onCall,
//                 style: OutlinedButton.styleFrom(
//                   padding: const EdgeInsets.symmetric(vertical: 12),
//                   side: const BorderSide(color: Colors.orange),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                 ),
//                 child: Text(
//                   'Call',
//                   style: TextStyle(
//                     color: Colors.orange,
//                     fontSize: width * 0.04,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//                 child: FittedBox(
//                   child: OutlinedButton(
//                     onPressed: onViewDetails,
//                     style: OutlinedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       side: const BorderSide(color: Colors.orange),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         'View Details',
//                         style: TextStyle(
//                           color: Colors.orange,
//                           fontSize: width * 0.04,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//                 child: FittedBox(
//                   child: ElevatedButton(
//                     onPressed: onCancel,
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       backgroundColor: Colors.red,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         'Cancel Order',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: width * 0.04,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//             ),
//             const SizedBox(width: 12),
//             Expanded(
//                 child: FittedBox(
//                   child: ElevatedButton(
//                     onPressed: onAccept,
//                     style: ElevatedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       backgroundColor: Colors.green,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         'Accept Order',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: width * 0.04,
//                         ),
//                       ),
//                     ),
//                   ),
//                 )
//             ),
//           ],
//         ),
//       ],
//     ),
//   );
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/ongoing_order_provider.dart';
import '../Providers/order_provider.dart';

// Import your provider

class OnGoingOrderScreen extends StatelessWidget {
  const OnGoingOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions for responsive sizing
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Example data - in a real app, this would come from your API or database
    final Map<String, dynamic> orderData = {
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
    };

    void handleStatusChange(String newStatus) {
      // You might want to call an API here or update your database
      print('Order status changed to: $newStatus');
    }

    void viewOrderDetails() {
      // Navigate to a detailed view
      print('Viewing order details for: ${orderData['orderId']}');
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ongoing Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ChangeNotifierProvider<OngoingOrderProvider>(
          create: (_) => OngoingOrderProvider(),
          child: OnGoingOrderWidget(
            customerName: orderData['customerName'] as String,
            orderTime: orderData['orderTime'] as String,
            orderId: orderData['orderId'] as String,
            totalAmount: orderData['totalAmount'] as String,
            orderItems: List<Map<String, String>>.from(
                (orderData['orderItems'] as List).map((item) =>
                Map<String, String>.from(item as Map)
                )
            ),
            message: orderData['message'] as String,
            orderStatus: orderData['orderStatus'] as String,
            width: width,
            height: height,
            onViewDetails: viewOrderDetails,
            onStatusChange: handleStatusChange,
          ),
        ),
      ),
    );
  }
}

class OnGoingOrderWidget extends StatelessWidget {
  final String customerName;
  final String orderTime;
  final String orderId;
  final String totalAmount;
  final List<Map<String, String>> orderItems;
  final String message;
  final String orderStatus;
  final double width;
  final double height;
  final VoidCallback onViewDetails;
  final Function(String) onStatusChange;

  const OnGoingOrderWidget({
    Key? key,
    required this.customerName,
    required this.orderTime,
    required this.orderId,
    required this.totalAmount,
    required this.orderItems,
    required this.message,
    required this.orderStatus,
    required this.width,
    required this.height,
    required this.onViewDetails,
    required this.onStatusChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OngoingOrderProvider>(context);

    // Initialize provider with order data if status doesn't match
    if (provider.selectedStatus != orderStatus) {
      provider.initOrder({
        'customerName': customerName,
        'orderTime': orderTime,
        'orderId': orderId,
        'totalAmount': totalAmount,
        'orderItems': orderItems,
        'message': message,
        'orderStatus': orderStatus,
      });
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _containerDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildOrderHeader(customerName, orderTime, orderId, totalAmount, height, width),
          const SizedBox(height: 24),
          ...orderItems.map((item) => Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: _buildOrderItem(item['name']!, item['quantity']!, item['price']!),
          )),
          const SizedBox(height: 24),
          _buildMessageSection(message),
          const SizedBox(height: 24),
          _buildOrderActions(context, provider),
          const SizedBox(height: 2),
          Container(
            height: height * 0.0001,
            width: width,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black12,
                width: 1.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderActions(BuildContext context, OngoingOrderProvider provider) {
    List<String> statusOptions = ['Order Processing', 'Shipped', 'Delivered', 'Cancelled'];

    return SizedBox(
      width: width,
      height: height * 0.08,
      child: Row(
        children: [
          SizedBox(
            width: width * 0.2,
            child: Text(
              "Order Status",
              style: TextStyle(fontSize: width * 0.030),
            ),
          ),
          SizedBox(width: width * 0.02),
          SizedBox(
            width: width * 0.35,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.008),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(width * 0.01),
              ),
              child: DropdownButton<String>(
                value: provider.selectedStatus,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    // Schedule the update after the current build cycle completes
                    Future.microtask(() {
                      onStatusChange(newValue);
                    });
                  }
                },
                items: statusOptions
                    .map((String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Padding(
                    padding: EdgeInsets.all(width * 0.02),
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Colors.orange[700],
                        fontSize: width * 0.030,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ))
                    .toList(),
                underline: Container(),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.orange[700],
                ),
                isExpanded: true,
                style: TextStyle(
                  color: Colors.orange[700],
                  fontSize: width * 0.030,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(width: width * 0.03),
          SizedBox(
            width: width * 0.3,
            child: OutlinedButton(
              onPressed: onViewDetails,
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: height * 0.015),
                side: const BorderSide(color: Colors.orange),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.06),
                ),
              ),
              child: FittedBox(
                child: Text(
                  'View Details',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: width * 0.030,
                  ),
                ),
              ),
            ),
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

  Widget _buildOrderHeader(String customerName, String orderTime, String orderId, String totalAmount, double height, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              customerName,
              style: TextStyle(
                fontSize: height * 0.02,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              orderTime,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Order ID: $orderId',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            Text(
              'Total $totalAmount',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildOrderItem(String name, String quantity, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          name,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(
          children: [
            Text(
              'Qty $quantity',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(width: 20),
            Text(
              'INR: $price',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMessageSection(String message) {
    return Row(
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
          message,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}