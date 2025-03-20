// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'past_orders.dart';
// import 'ongoing_orders.dart';
//
// class NewOrder extends StatefulWidget {
//   const NewOrder({super.key});
//
//   @override
//   State<NewOrder> createState() => _NewOrderState();
// }
//
// class _NewOrderState extends State<NewOrder> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);
//     final height = size.height;
//     final width = size.width;
//     final double fontSize = width * 0.05;
//     final double iconSize = width * 0.07;
//     List<Map<String, String>> orderItems = [
//       {'name': 'Vegetables', 'quantity': '3', 'price': '1200'},
//       {'name': 'Milk', 'quantity': '1', 'price': '640'},
//     ];
//     List<String> statusOptions = [
//       'Order Processing',
//       'Shipped',
//       'Delivered',
//       'Cancelled',
//     ];
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             backgroundColor: Color(0xFFF0812D),
//             leading: GestureDetector(
//               onTap: () {},
//               child: Icon(
//                 FontAwesomeIcons.arrowLeftLong,
//                 color: Colors.white,
//               ),
//             ),
//             title: Text(
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
//               preferredSize: Size.fromHeight(50.0),
//               child: Container(
//                 color: Colors.white,
//                 child: TabBar(
//                   tabs: [
//                     Tab(text: 'New Orders'),
//                     Tab(text: 'Ongoing Orders'),
//                     Tab(text: 'Past Orders'),
//                   ],
//                   indicatorColor: Colors.orange,
//                   labelColor: Color(0xFFF0812D),
//                   unselectedLabelColor: Colors.black,
//                 ),
//               ),
//             ),
//           ),
//           body: TabBarView(
//             children: [
//               ListView.builder(
//                 itemCount: 2,
//                 itemBuilder: (context, index) {
//                   return buildListViewContainer(
//                     context: context,
//                     customerName: 'Ayushi',
//                     orderTime: 'Today at 9:33 AM',
//                     orderId: '120',
//                     totalAmount: 1840,
//                     items: [
//                       {'name': 'Vegetables', 'quantity': 3, 'price': 1200},
//                       {'name': 'Milk', 'quantity': 1, 'price': 640},
//                     ],
//                     message: 'Hi, please add white sauce in my order',
//                     onCall: () => print('Calling...'),
//                     onViewDetails: () => print('Viewing details...'),
//                     onCancel: () => print('Order canceled...'),
//                     onAccept: () => print('Order accepted...'),
//                   );
//                 },
//               ),
//               ListView.builder(
//                 itemCount: 2,
//                 itemBuilder: (context, index) {
//                   return OnGoingOrderWidget(
//                     customerName: 'Ayushi',
//                     orderTime: 'Today at 9:33 AM',
//                     orderId: '120',
//                     totalAmount: '1,840',
//                     orderItems: orderItems,
//                     message: 'Hi, please add white sauce to my order',
//                     orderStatus: 'Order Processing',
//                     width: width,
//                     height: height,
//                     onStatusChange: (String newStatus) {
//                       print("Order status updated to: $newStatus");
//                     },
//                     onViewDetails: () {
//                       print("Navigating to order details...");
//                     },
//                   );
//                 },
//               ),
//               ListView.builder(
//                 itemCount: 2,
//                 itemBuilder: (context, index) {
//                   return PastOrderWidget(
//                     customerName: 'Ayushi',
//                     orderTime: 'Today at 9:33 AM',
//                     orderId: '120',
//                     totalAmount: '1,840',
//                     orderItems: orderItems,
//                     message: 'Hi, please add white sauce to my order',
//                     orderStatus: 'Order Processing',
//                     onViewDetails: () {
//                       print("Navigating to order details...");
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
//   required double totalAmount,
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
//                   'Total INR: $totalAmount',
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
//                     item['name'],
//                     style: TextStyle(
//                       fontSize: width * 0.04,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         'Qty ${item['quantity']}',
//                         style: TextStyle(
//                           color: Colors.grey[600],
//                           fontSize: width * 0.035,
//                         ),
//                       ),
//                       const SizedBox(width: 20),
//                       Text(
//                         'INR: ${item['price']}',
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
//                   side: BorderSide(color: Colors.orange),
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
//                       side: BorderSide(color: Colors.orange),
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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../Providers/ongoing_order_provider.dart';
import '../Providers/order_provider.dart';
import '../Providers/past_order_provider.dart';
import 'past_orders.dart';
import 'ongoing_orders.dart';

class NewOrder extends StatelessWidget {
  const NewOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => OrderProvider(),
      child: const NewOrderView(),
    );
  }
}

class NewOrderView extends StatelessWidget {
  const NewOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    final width = size.width;
    final double fontSize = width * 0.05;
    final double iconSize = width * 0.07;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        initialIndex: provider.selectedTabIndex,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color(0xFFF0812D),
            leading: GestureDetector(
              onTap: () {},
              child: Icon(
                FontAwesomeIcons.arrowLeftLong,
                color: Colors.white,
                size: width * 0.05,
              ),
            ),
            title: Text(
              "Our Orders",
              style: TextStyle(
                color: Colors.white,
                fontSize: width * 0.05,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: iconSize,
                ),
              ),
              SizedBox(width: width * 0.03),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(height * 0.06),
              child: Container(
                color: Colors.white,
                child: TabBar(
                  tabs: [
                    Tab(
                      text: 'New Orders',
                      height: height * 0.05,
                    ),
                    Tab(
                      text: 'Ongoing Orders',
                      height: height * 0.05,
                    ),
                    Tab(
                      text: 'Past Orders',
                      height: height * 0.05,
                    ),
                  ],
                  indicatorColor: Colors.orange,
                  labelColor: const Color(0xFFF0812D),
                  unselectedLabelColor: Colors.black,
                  labelStyle: TextStyle(fontSize: width * 0.035),
                  unselectedLabelStyle: TextStyle(fontSize: width * 0.035),
                  onTap: (index) {
                    provider.setSelectedTabIndex(index);
                  },
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              // New Orders Tab
              ListView.builder(
                itemCount: provider.newOrders.length,
                itemBuilder: (context, index) {
                  final order = provider.newOrders[index];
                  return buildListViewContainer(
                    context: context,
                    customerName: order['customerName'],
                    orderTime: order['orderTime'],
                    orderId: order['orderId'],
                    totalAmount: order['totalAmount'],
                    items: order['items'],
                    message: order['message'],
                    onCall: () => provider.callCustomer(index),
                    onViewDetails: () => provider.viewOrderDetails(index),
                    onCancel: () => provider.cancelOrder(index),
                    onAccept: () => provider.acceptOrder(index),
                  );
                },
              ),

              // Ongoing Orders Tab
              ListView.builder(
                itemCount: provider.ongoingOrders.length,
                itemBuilder: (context, index) {
                  final order = provider.ongoingOrders[index];

                  return Padding(
                    padding: EdgeInsets.only(bottom: height * 0.02),
                    child: ChangeNotifierProvider<OngoingOrderProvider>.value(
                      // Use .value constructor to avoid recreating providers
                      value: OngoingOrderProvider()..initOrder(order),
                      child: Consumer<OngoingOrderProvider>(
                        builder: (context, orderProvider, _) {
                          return OnGoingOrderWidget(
                            customerName: order['customerName'] ?? '',
                            orderTime: order['orderTime'] ?? '',
                            orderId: order['orderId'] ?? '',
                            totalAmount: order['totalAmount'] ?? '',
                            orderItems: orderProvider.orderItems,  // Use orderProvider instead of provider
                            message: order['message'] ?? '',
                            orderStatus: orderProvider.selectedStatus,  // Use current state from provider
                            width: width,
                            height: height,
                            onStatusChange: (String newStatus) {
                              // Update both providers
                              Future.microtask(() {
                                provider.updateOrderStatus(index, newStatus);
                                orderProvider.initOrder({
                                  ...order,
                                  'orderStatus': newStatus,
                                });
                              });
                            },
                            onViewDetails: () {
                              provider.viewOrderDetails(index);
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
              // Past Orders Tab
              ListView.builder(
                itemCount: provider.pastOrders.length,
                itemBuilder: (context, index) {
                  final legacyOrder = provider.pastOrders[index];

                  // Convert the legacy order format to a PastOrder object
                  final order = PastOrder(
                    customerName: legacyOrder['customerName'] ?? '',
                    orderTime: legacyOrder['orderTime'] ?? '',
                    orderId: legacyOrder['orderId'] ?? '',
                    totalAmount: legacyOrder['totalAmount'] ?? '',
                    // Convert the order items to the new format
                    orderItems: provider.orderItems.map((item) =>
                        OrderItem(
                            name: item['name'] ?? '',
                            quantity: item['quantity'] ?? '',
                            price: item['price'] ?? ''
                        )
                    ).toList(),
                    message: legacyOrder['message'] ?? '',
                    orderStatus: legacyOrder['orderStatus'] ?? '',
                  );

                  return Padding(
                    padding: EdgeInsets.only(bottom: height * 0.02),
                    child: PastOrderWidget(
                      order: order,
                      onViewDetails: () {
                        provider.viewOrderDetails(index);
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildListViewContainer({
  required BuildContext context,
  required String customerName,
  required String orderTime,
  required String orderId,
  required num totalAmount,
  required List<Map<String, dynamic>> items,
  required String message,
  required VoidCallback onCall,
  required VoidCallback onViewDetails,
  required VoidCallback onCancel,
  required VoidCallback onAccept,
}) {
  final size = MediaQuery.of(context).size;
  final height = size.height;
  final width = size.width;

  return Container(
    padding: EdgeInsets.all(width * 0.04),
    margin: EdgeInsets.all(width * 0.02),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(width * 0.03),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          spreadRadius: width * 0.003,
          blurRadius: width * 0.025,
          offset: Offset(0, height * 0.001),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  customerName,
                  style: TextStyle(
                    fontSize: width * 0.06,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  orderTime,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: width * 0.035,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Order id: $orderId',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: width * 0.035,
                  ),
                ),
                Text(
                  'Total INR: $totalAmount',
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: height * 0.025),
        Column(
          children: items.map((item) {
            return Padding(
              padding: EdgeInsets.only(bottom: height * 0.015),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item['name'].toString(),
                    style: TextStyle(
                      fontSize: width * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Qty ${item['quantity'].toString()}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: width * 0.035,
                        ),
                      ),
                      SizedBox(width: width * 0.05),
                      Text(
                        'INR: ${item['price'].toString()}',
                        style: TextStyle(
                          fontSize: width * 0.04,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        SizedBox(height: height * 0.025),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Message:',
              style: TextStyle(
                fontSize: width * 0.04,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: height * 0.005),
            Text(
              message,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: width * 0.035,
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.025),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: onCall,
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: height * 0.015),
                  side: BorderSide(color: Colors.orange, width: width * 0.002),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * 0.06),
                  ),
                ),
                child: Text(
                  'Call',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: width * 0.04,
                  ),
                ),
              ),
            ),
            SizedBox(width: width * 0.03),
            Expanded(
                child: FittedBox(
                  child: OutlinedButton(
                    onPressed: onViewDetails,
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: height * 0.015),
                      side: BorderSide(color: Colors.orange, width: width * 0.002),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.06),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: Text(
                        'View Details',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: width * 0.04,
                        ),
                      ),
                    ),
                  ),
                )
            ),
            SizedBox(width: width * 0.03),
            Expanded(
                child: FittedBox(
                  child: ElevatedButton(
                    onPressed: onCancel,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: height * 0.015),
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.06),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: Text(
                        'Cancel Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                        ),
                      ),
                    ),
                  ),
                )
            ),
            SizedBox(width: width * 0.03),
            Expanded(
                child: FittedBox(
                  child: ElevatedButton(
                    onPressed: onAccept,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: height * 0.015),
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(width * 0.06),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.02),
                      child: Text(
                        'Accept Order',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: width * 0.04,
                        ),
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      ],
    ),
  );
}