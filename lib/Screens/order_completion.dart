// import 'package:flutter/material.dart';
//
// class OrderCompletionScreen extends StatefulWidget {
//   const OrderCompletionScreen({super.key});
//
//   @override
//   State<OrderCompletionScreen> createState() => _OrderCompletionScreenState();
// }
//
// class _OrderCompletionScreenState extends State<OrderCompletionScreen> {
//   // Sample static data (would come from backend when connected)
//   Map<String, dynamic> orderData = {
//     'customerName': 'Ayushi',
//     'orderTime': '9:33 Am',
//     'orderId': '120',
//     'total': '1,840',
//     'phone': '+923345867968',
//     'message': 'Hi please add white suace in my order',
//     'items': [
//       {'name': 'Vegetables', 'quantity': 3, 'price': 1200},
//       {'name': 'Milk', 'quantity': 1, 'price': 640},
//     ],
//     'subTotal': 1200,
//     'deliveryFee': 200,
//     'serviceTax': 100,
//     'discount': 100,
//     'discountPercentage': 30,
//     'grandTotal': 2100,
//     'status': 'Order delivered'
//   };
//
//   // This function would be used to update order data when backend connection is established
//   void updateOrderData(Map<String, dynamic> newData) {
//     setState(() {
//       orderData = newData;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);
//     final height = size.height;
//     final width = size.width;
//     final double fontSize = width * 0.05;
//     final double iconSize = width * 0.07;
//
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             _buildHeader(width, height, fontSize, iconSize),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: width * 0.04),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildCustomerInfo(width, height, fontSize),
//                       _buildContactButtons(width, height, fontSize),
//                       _buildCustomerMessage(width, height, fontSize),
//                       _buildOrderItems(width, height, fontSize),
//                       _buildPrintInvoiceButton(width, height, fontSize),
//                       _buildOrderSummary(width, height, fontSize),
//                       _buildOrderStatus(width, height, fontSize),
//                       SizedBox(height: height * 0.03),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader(double width, double height, double fontSize, double iconSize) {
//     return Container(
//       padding: EdgeInsets.symmetric(
//         horizontal: width * 0.04,
//         vertical: height * 0.015,
//       ),
//       color: const Color(0xFFE98A37),
//       child: Row(
//         children: [
//           IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               color: Colors.white,
//               size: iconSize,
//             ),
//             onPressed: () => Navigator.of(context).pop(),
//             padding: EdgeInsets.all(width * 0.01),
//             constraints: const BoxConstraints(),
//           ),
//           Expanded(
//             child: Text(
//               'Complete Order',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: fontSize,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           CircleAvatar(
//             backgroundColor: Colors.white,
//             radius: width * 0.035,
//             child: Icon(
//               Icons.person,
//               color: Colors.grey,
//               size: iconSize * 0.8,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCustomerInfo(double width, double height, double fontSize) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: height * 0.015),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 orderData['customerName'],
//                 style: TextStyle(
//                   fontSize: fontSize * 0.88,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 'Today at ${orderData['orderTime']}',
//                 style: TextStyle(
//                   fontSize: fontSize * 0.68,
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 'Order id: ${orderData['orderId']}',
//                 style: TextStyle(
//                   fontSize: fontSize * 0.68,
//                   color: Colors.grey[600],
//                 ),
//               ),
//               Text(
//                 'Total ${orderData['total']}',
//                 style: TextStyle(
//                   fontSize: fontSize * 0.68,
//                   color: Colors.grey[600],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildContactButtons(double width, double height, double fontSize) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: height * 0.01),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 orderData['phone'],
//                 style: TextStyle(fontSize: fontSize * 0.76),
//               ),
//               OutlinedButton(
//                 onPressed: () {
//                  print("debugging call");
//                 },
//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Color(0xFFE98A37)),
//                   foregroundColor: const Color(0xFFE98A37),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: width * 0.04,
//                     vertical: height * 0.008,
//                   ),
//                   minimumSize: Size(width * 0.15, height * 0.04),
//                   textStyle: TextStyle(fontSize: fontSize * 0.68),
//                 ),
//                 child: const Text('Call'),
//               ),
//             ],
//           ),
//           SizedBox(height: height * 0.01),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'email',
//                 style: TextStyle(fontSize: fontSize * 0.76),
//               ),
//               OutlinedButton(
//                 onPressed: () {
//                   print("debugging email");
//                 },
//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Color(0xFFE98A37)),
//                   foregroundColor: const Color(0xFFE98A37),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: width * 0.04,
//                     vertical: height * 0.008,
//                   ),
//                   minimumSize: Size(width * 0.15, height * 0.04),
//                   textStyle: TextStyle(fontSize: fontSize * 0.68),
//                 ),
//                 child: const Text('Email'),
//               ),
//             ],
//           ),
//           SizedBox(height: height * 0.01),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Location',
//                 style: TextStyle(fontSize: fontSize * 0.76),
//               ),
//               OutlinedButton(
//                 onPressed: () {
//                   print("debugging navigate");
//                 },
//                 style: OutlinedButton.styleFrom(
//                   side: const BorderSide(color: Color(0xFFE98A37)),
//                   foregroundColor: const Color(0xFFE98A37),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: width * 0.04,
//                     vertical: height * 0.008,
//                   ),
//                   minimumSize: Size(width * 0.15, height * 0.04),
//                   textStyle: TextStyle(fontSize: fontSize * 0.68),
//                 ),
//                 child: const Text('Navigate'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildCustomerMessage(double width, double height, double fontSize) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: height * 0.01),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Message:',
//             style: TextStyle(
//               fontSize: fontSize * 0.76,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: height * 0.005),
//           Text(
//             orderData['message'],
//             style: TextStyle(fontSize: fontSize * 0.76),
//           ),
//           SizedBox(height: height * 0.01),
//           Divider(thickness: height * 0.001),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderItems(double width, double height, double fontSize) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: height * 0.01),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 flex: 4,
//                 child: Text(
//                   'Items',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: fontSize * 0.76,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Text(
//                   'Quantity',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: fontSize * 0.76,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 flex: 3,
//                 child: Text(
//                   'Price',
//                   textAlign: TextAlign.right,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: fontSize * 0.76,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Divider(thickness: height * 0.001),
//           ...List.generate(
//             orderData['items'].length,
//                 (index) => Padding(
//               padding: EdgeInsets.symmetric(vertical: height * 0.005),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 4,
//                     child: Text(
//                       orderData['items'][index]['name'],
//                       style: TextStyle(fontSize: fontSize * 0.76),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 3,
//                     child: Text(
//                       'Qty ${orderData['items'][index]['quantity']}',
//                       style: TextStyle(fontSize: fontSize * 0.76),
//                     ),
//                   ),
//                   Expanded(
//                     flex: 3,
//                     child: Text(
//                       'Rs: ${orderData['items'][index]['price']}',
//                       textAlign: TextAlign.right,
//                       style: TextStyle(fontSize: fontSize * 0.76),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Divider(thickness: height * 0.001),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildPrintInvoiceButton(double width, double height, double fontSize) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: height * 0.01),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: OutlinedButton(
//           onPressed: () {
//            print("debugging invoice");
//           },
//           style: OutlinedButton.styleFrom(
//             side: const BorderSide(color: Color(0xFFE98A37)),
//             foregroundColor: const Color(0xFFE98A37),
//             padding: EdgeInsets.symmetric(
//               horizontal: width * 0.04,
//               vertical: height * 0.008,
//             ),
//             minimumSize: Size(width * 0.25, height * 0.04),
//             textStyle: TextStyle(fontSize: fontSize * 0.68),
//           ),
//           child: const Text('Print Invoice'),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOrderSummary(double width, double height, double fontSize) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: height * 0.01),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Sub Total',
//                 style: TextStyle(fontSize: fontSize * 0.76),
//               ),
//               Text(
//                 'INR: ${orderData['subTotal']}',
//                 style: TextStyle(fontSize: fontSize * 0.76),
//               ),
//             ],
//           ),
//           SizedBox(height: height * 0.005),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Delivery Fee',
//                 style: TextStyle(fontSize: fontSize * 0.76),
//               ),
//               Text(
//                 'INR: ${orderData['deliveryFee']}',
//                 style: TextStyle(fontSize: fontSize * 0.76),
//               ),
//             ],
//           ),
//           SizedBox(height: height * 0.005),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Service Tax',
//                 style: TextStyle(fontSize: fontSize * 0.76),
//               ),
//               Text(
//                 'INR: ${orderData['serviceTax']}',
//                 style: TextStyle(fontSize: fontSize * 0.76),
//               ),
//             ],
//           ),
//           SizedBox(height: height * 0.005),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Discount ${orderData['discountPercentage']}%',
//                 style: TextStyle(fontSize: fontSize * 0.76),
//               ),
//               Text(
//                 'INR: ${orderData['discount']}',
//                 style: TextStyle(fontSize: fontSize * 0.76),
//               ),
//             ],
//           ),
//           SizedBox(height: height * 0.01),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Total',
//                 style: TextStyle(
//                   fontSize: fontSize * 0.88,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 '${orderData['grandTotal']}',
//                 style: TextStyle(
//                   fontSize: fontSize * 0.88,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: height * 0.01),
//           Divider(thickness: height * 0.001),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderStatus(double width, double height, double fontSize) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: height * 0.015),
//       child: Center(
//         child: Text(
//           'Order Status : ${orderData['status']}',
//           style: TextStyle(
//             color: Colors.green,
//             fontSize: fontSize * 0.88,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/order_completion_provider.dart';

class OrderCompletionScreen extends StatelessWidget {
  const OrderCompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderCompletionProvider>(context);
    final orderData = provider.orderData;

    final size = MediaQuery.sizeOf(context);
    final height = size.height;
    final width = size.width;
    final double fontSize = width * 0.05;
    final double iconSize = width * 0.07;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, width, height, fontSize, iconSize),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCustomerInfo(orderData, width, height, fontSize),
                      _buildContactButtons(context, orderData, width, height, fontSize),
                      _buildCustomerMessage(orderData, width, height, fontSize),
                      _buildOrderItems(orderData, width, height, fontSize),
                      _buildPrintInvoiceButton(context, width, height, fontSize),
                      _buildOrderSummary(orderData, width, height, fontSize),
                      _buildOrderStatus(orderData, width, height, fontSize),
                      SizedBox(height: height * 0.03),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, double width, double height, double fontSize, double iconSize) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.015,
      ),
      color: const Color(0xFFE98A37),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: iconSize,
            ),
            onPressed: () => Navigator.of(context).pop(),
            padding: EdgeInsets.all(width * 0.01),
            constraints: const BoxConstraints(),
          ),
          Expanded(
            child: Text(
              'Complete Order',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: width * 0.035,
            child: Icon(
              Icons.person,
              color: Colors.grey,
              size: iconSize * 0.8,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerInfo(Map<String, dynamic> orderData, double width, double height, double fontSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.015),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderData['customerName'],
                style: TextStyle(
                  fontSize: fontSize * 0.88,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Today at ${orderData['orderTime']}',
                style: TextStyle(
                  fontSize: fontSize * 0.68,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Order id: ${orderData['orderId']}',
                style: TextStyle(
                  fontSize: fontSize * 0.68,
                  color: Colors.grey[600],
                ),
              ),
              Text(
                'Total ${orderData['total']}',
                style: TextStyle(
                  fontSize: fontSize * 0.68,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactButtons(BuildContext context, Map<String, dynamic> orderData, double width, double height, double fontSize) {
    final provider = Provider.of<OrderCompletionProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderData['phone'],
                style: TextStyle(fontSize: fontSize * 0.76),
              ),
              OutlinedButton(
                onPressed: () => provider.callCustomer(orderData['phone']),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFE98A37)),
                  foregroundColor: const Color(0xFFE98A37),
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.008,
                  ),
                  minimumSize: Size(width * 0.15, height * 0.04),
                  textStyle: TextStyle(fontSize: fontSize * 0.68),
                ),
                child: const Text('Call'),
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'email',
                style: TextStyle(fontSize: fontSize * 0.76),
              ),
              OutlinedButton(
                onPressed: () => provider.emailCustomer(),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFE98A37)),
                  foregroundColor: const Color(0xFFE98A37),
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.008,
                  ),
                  minimumSize: Size(width * 0.15, height * 0.04),
                  textStyle: TextStyle(fontSize: fontSize * 0.68),
                ),
                child: const Text('Email'),
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Location',
                style: TextStyle(fontSize: fontSize * 0.76),
              ),
              OutlinedButton(
                onPressed: () => provider.navigateToCustomer(),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xFFE98A37)),
                  foregroundColor: const Color(0xFFE98A37),
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04,
                    vertical: height * 0.008,
                  ),
                  minimumSize: Size(width * 0.15, height * 0.04),
                  textStyle: TextStyle(fontSize: fontSize * 0.68),
                ),
                child: const Text('Navigate'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCustomerMessage(Map<String, dynamic> orderData, double width, double height, double fontSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Message:',
            style: TextStyle(
              fontSize: fontSize * 0.76,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: height * 0.005),
          Text(
            orderData['message'],
            style: TextStyle(fontSize: fontSize * 0.76),
          ),
          SizedBox(height: height * 0.01),
          Divider(thickness: height * 0.001),
        ],
      ),
    );
  }

  Widget _buildOrderItems(Map<String, dynamic> orderData, double width, double height, double fontSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Text(
                  'Items',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize * 0.76,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Quantity',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize * 0.76,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Price',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: fontSize * 0.76,
                  ),
                ),
              ),
            ],
          ),
          Divider(thickness: height * 0.001),
          ...List.generate(
            orderData['items'].length,
                (index) => Padding(
              padding: EdgeInsets.symmetric(vertical: height * 0.005),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      orderData['items'][index]['name'],
                      style: TextStyle(fontSize: fontSize * 0.76),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Qty ${orderData['items'][index]['quantity']}',
                      style: TextStyle(fontSize: fontSize * 0.76),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      'Rs: ${orderData['items'][index]['price']}',
                      textAlign: TextAlign.right,
                      style: TextStyle(fontSize: fontSize * 0.76),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(thickness: height * 0.001),
        ],
      ),
    );
  }

  Widget _buildPrintInvoiceButton(BuildContext context, double width, double height, double fontSize) {
    final provider = Provider.of<OrderCompletionProvider>(context, listen: false);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Align(
        alignment: Alignment.centerLeft,
        child: OutlinedButton(
          onPressed: () => provider.printInvoice(),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFFE98A37)),
            foregroundColor: const Color(0xFFE98A37),
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.04,
              vertical: height * 0.008,
            ),
            minimumSize: Size(width * 0.25, height * 0.04),
            textStyle: TextStyle(fontSize: fontSize * 0.68),
          ),
          child: const Text('Print Invoice'),
        ),
      ),
    );
  }

  Widget _buildOrderSummary(Map<String, dynamic> orderData, double width, double height, double fontSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.01),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sub Total',
                style: TextStyle(fontSize: fontSize * 0.76),
              ),
              Text(
                'INR: ${orderData['subTotal']}',
                style: TextStyle(fontSize: fontSize * 0.76),
              ),
            ],
          ),
          SizedBox(height: height * 0.005),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Delivery Fee',
                style: TextStyle(fontSize: fontSize * 0.76),
              ),
              Text(
                'INR: ${orderData['deliveryFee']}',
                style: TextStyle(fontSize: fontSize * 0.76),
              ),
            ],
          ),
          SizedBox(height: height * 0.005),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Service Tax',
                style: TextStyle(fontSize: fontSize * 0.76),
              ),
              Text(
                'INR: ${orderData['serviceTax']}',
                style: TextStyle(fontSize: fontSize * 0.76),
              ),
            ],
          ),
          SizedBox(height: height * 0.005),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount ${orderData['discountPercentage']}%',
                style: TextStyle(fontSize: fontSize * 0.76),
              ),
              Text(
                'INR: ${orderData['discount']}',
                style: TextStyle(fontSize: fontSize * 0.76),
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: fontSize * 0.88,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${orderData['grandTotal']}',
                style: TextStyle(
                  fontSize: fontSize * 0.88,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Divider(thickness: height * 0.001),
        ],
      ),
    );
  }

  Widget _buildOrderStatus(Map<String, dynamic> orderData, double width, double height, double fontSize) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: height * 0.015),
      child: Center(
        child: Text(
          'Order Status : ${orderData['status']}',
          style: TextStyle(
            color: Colors.green,
            fontSize: fontSize * 0.88,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}