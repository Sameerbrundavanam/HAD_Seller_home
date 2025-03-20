// import 'package:flutter/material.dart';
//
// class OrderDetailsScreen extends StatefulWidget {
//   const OrderDetailsScreen({Key? key}) : super(key: key);
//
//   @override
//   State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
// }
//
// class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
//   // Mock data - will be replaced with backend data in production
//   final OrderDetails _orderDetails = OrderDetails(
//     orderId: "120",
//     customerName: "Ayushi",
//     orderTime: "Today at 9:33 Am",
//     phoneNumber: "+923345867968",
//     email: "email",
//     location: "location",
//     message: "Hi please add white suace in my order",
//     items: [
//       OrderItem(name: "Vegetables", quantity: 3, price: 1200),
//       OrderItem(name: "Milk", quantity: 1, price: 640),
//     ],
//     subTotal: 1200,
//     deliveryFee: 200,
//     serviceTax: 100,
//     discount: 100,
//     total: 2100,
//   );
//
//   @override
//   Widget build(BuildContext context) {
//     // Get the screen size for responsive design
//     final Size screenSize = MediaQuery.of(context).size;
//     final double screenWidth = screenSize.width;
//     final double screenHeight = screenSize.height;
//
//     // Calculate responsive text sizes
//     final double bodyFontSize = screenWidth * 0.04;
//     final double titleFontSize = screenWidth * 0.045;
//     final double headingFontSize = screenWidth * 0.05;
//
//     // Calculate responsive padding values
//     final double paddingSmall = screenWidth * 0.02;
//     final double paddingMedium = screenWidth * 0.04;
//     final double paddingLarge = screenWidth * 0.06;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFFE67E22), // Orange color
//         toolbarHeight: screenHeight * 0.08,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'New Order',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: headingFontSize,
//           ),
//         ),
//         actions: [
//           CircleAvatar(
//             backgroundColor: Colors.white24,
//             radius: screenWidth * 0.035,
//             child: Icon(
//               Icons.person,
//               color: Colors.white,
//               size: screenWidth * 0.05,
//             ),
//           ),
//           SizedBox(width: paddingMedium),
//         ],
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           return SingleChildScrollView(
//             child: Column(
//               children: [
//                 _buildCustomerInfo(titleFontSize, bodyFontSize, paddingMedium),
//                 _buildContactButtons(bodyFontSize, paddingMedium, paddingSmall),
//                 _buildMessage(titleFontSize, bodyFontSize, paddingMedium),
//                 _buildItemsList(titleFontSize, bodyFontSize, paddingMedium, paddingSmall),
//                 _buildPrintInvoiceButton(bodyFontSize, paddingMedium),
//                 _buildOrderSummary(titleFontSize, bodyFontSize, paddingMedium, paddingSmall),
//                 _buildActionButtons(bodyFontSize, paddingMedium, paddingSmall),
//                 SizedBox(height: paddingMedium), // Bottom padding
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//
//   Widget _buildCustomerInfo(double titleFontSize, double bodyFontSize, double padding) {
//     return Padding(
//       padding: EdgeInsets.all(padding),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 _orderDetails.customerName,
//                 style: TextStyle(
//                   fontSize: titleFontSize,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               Text(
//                 _orderDetails.orderTime,
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: bodyFontSize * 0.9,
//                 ),
//               ),
//             ],
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 'Order id: ${_orderDetails.orderId}',
//                 style: TextStyle(
//                   fontSize: bodyFontSize * 0.9,
//                   color: Colors.grey[700],
//                 ),
//               ),
//               Text(
//                 'Total ${_orderDetails.total.toStringAsFixed(0)}',
//                 style: TextStyle(
//                   fontSize: bodyFontSize * 0.9,
//                   color: Colors.grey[700],
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildContactButtons(double fontSize, double padding, double spacing) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: padding),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Text(
//                   _orderDetails.phoneNumber,
//                   style: TextStyle(fontSize: fontSize),
//                 ),
//               ),
//               Expanded(
//                 child: _buildContactButton('Call', Icons.call, fontSize, () {
//                   _callCustomer(_orderDetails.phoneNumber);
//                 }),
//               ),
//             ],
//           ),
//           SizedBox(height: spacing * 1.5),
//           Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Text(
//                   _orderDetails.email,
//                   style: TextStyle(fontSize: fontSize),
//                 ),
//               ),
//               Expanded(
//                 child: _buildContactButton('Email', Icons.email, fontSize, () {
//                   _emailCustomer(_orderDetails.email);
//                 }),
//               ),
//             ],
//           ),
//           SizedBox(height: spacing * 1.5),
//           Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Text(
//                   _orderDetails.location,
//                   style: TextStyle(fontSize: fontSize),
//                 ),
//               ),
//               Expanded(
//                 child: _buildContactButton('Navigate', Icons.location_on, fontSize, () {
//                   _navigateToCustomer(_orderDetails.location);
//                 }),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildContactButton(String label, IconData icon, double fontSize, VoidCallback onPressed) {
//     return ElevatedButton(
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         foregroundColor: Color(0xFFE67E22),
//         backgroundColor: Colors.white,
//         side: BorderSide(color: Color(0xFFE67E22)),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(fontSize * 1.2),
//         ),
//         padding: EdgeInsets.symmetric(vertical: fontSize * 0.3),
//       ),
//       child: Text(
//         label,
//         style: TextStyle(fontSize: fontSize * 0.9),
//       ),
//     );
//   }
//
//   Widget _buildMessage(double titleFontSize, double bodyFontSize, double padding) {
//     return Padding(
//       padding: EdgeInsets.all(padding),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Message:',
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: titleFontSize * 0.9,
//             ),
//           ),
//           Text(
//             _orderDetails.message,
//             style: TextStyle(fontSize: bodyFontSize),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildItemsList(double titleFontSize, double bodyFontSize, double padding, double spacing) {
//     return Column(
//       children: [
//         Divider(height: 1, color: Colors.grey[300]),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: padding, vertical: spacing * 1.5),
//           child: Row(
//             children: [
//               Expanded(
//                 flex: 2,
//                 child: Text(
//                   'Items',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: titleFontSize * 0.9,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Text(
//                   'Quantity',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: titleFontSize * 0.9,
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: Text(
//                   'Price',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: titleFontSize * 0.9,
//                   ),
//                   textAlign: TextAlign.right,
//                 ),
//               ),
//             ],
//           ),
//         ),
//         Divider(height: 1, color: Colors.grey[300]),
//         ListView.builder(
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//           itemCount: _orderDetails.items.length,
//           itemBuilder: (context, index) {
//             final item = _orderDetails.items[index];
//             return Padding(
//               padding: EdgeInsets.symmetric(horizontal: padding, vertical: spacing * 1.5),
//               child: Row(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Text(
//                       item.name,
//                       style: TextStyle(fontSize: bodyFontSize),
//                     ),
//                   ),
//                   Expanded(
//                     child: Text(
//                       'Qty ${item.quantity}',
//                       style: TextStyle(fontSize: bodyFontSize),
//                     ),
//                   ),
//                   Expanded(
//                     child: Text(
//                       'INR: ${item.price}',
//                       style: TextStyle(fontSize: bodyFontSize),
//                       textAlign: TextAlign.right,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//         Divider(height: 1, color: Colors.grey[300]),
//       ],
//     );
//   }
//
//   Widget _buildPrintInvoiceButton(double fontSize, double padding) {
//     return Padding(
//       padding: EdgeInsets.all(padding),
//       child: Align(
//         alignment: Alignment.centerLeft,
//         child: OutlinedButton(
//           onPressed: () => _printInvoice(),
//           child: Text(
//             'Print Invoice',
//             style: TextStyle(fontSize: fontSize * 0.9),
//           ),
//           style: OutlinedButton.styleFrom(
//             foregroundColor: Color(0xFFE67E22),
//             side: BorderSide(color: Color(0xFFE67E22)),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(fontSize * 1.2),
//             ),
//             padding: EdgeInsets.symmetric(
//               horizontal: padding * 0.8,
//               vertical: fontSize * 0.3,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOrderSummary(double titleFontSize, double bodyFontSize, double padding, double spacing) {
//     return Padding(
//       padding: EdgeInsets.all(padding),
//       child: Column(
//         children: [
//           _buildSummaryRow('Sub Total', 'INR: ${_orderDetails.subTotal}', bodyFontSize),
//           _buildSummaryRow('Delivery Fee', 'INR: ${_orderDetails.deliveryFee}', bodyFontSize),
//           _buildSummaryRow('Service Tax', 'INR: ${_orderDetails.serviceTax}', bodyFontSize),
//           _buildSummaryRow('Discount 30%', 'INR: ${_orderDetails.discount}', bodyFontSize),
//           SizedBox(height: spacing),
//           _buildSummaryRow(
//             'Total',
//             '${_orderDetails.total}',
//             titleFontSize,
//             isBold: true,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSummaryRow(String label, String value, double fontSize, {bool isBold = false}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: fontSize * 0.25),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
//               fontSize: isBold ? fontSize : fontSize * 0.9,
//             ),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
//               fontSize: isBold ? fontSize : fontSize * 0.9,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildActionButtons(double fontSize, double padding, double spacing) {
//     return Padding(
//       padding: EdgeInsets.all(padding),
//       child: Row(
//         children: [
//           Expanded(
//             child: ElevatedButton(
//               onPressed: () => _cancelOrder(),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red,
//                 foregroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(fontSize * 1.2),
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: fontSize * 0.4),
//               ),
//               child: Text(
//                 'Cancel order',
//                 style: TextStyle(fontSize: fontSize),
//               ),
//             ),
//           ),
//           SizedBox(width: spacing * 2),
//           Expanded(
//             child: ElevatedButton(
//               onPressed: () => _acceptOrder(),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.green,
//                 foregroundColor: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(fontSize * 1.2),
//                 ),
//                 padding: EdgeInsets.symmetric(vertical: fontSize * 0.4),
//               ),
//               child: Text(
//                 'Accept order',
//                 style: TextStyle(fontSize: fontSize),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   // Methods to handle user actions - these will be connected to backend APIs later
//   void _callCustomer(String phoneNumber) {
//     // Implement phone call functionality
//     print('Calling $phoneNumber');
//   }
//
//   void _emailCustomer(String email) {
//     // Implement email functionality
//     print('Emailing $email');
//   }
//
//   void _navigateToCustomer(String location) {
//     // Implement navigation functionality
//     print('Navigating to $location');
//   }
//
//   void _printInvoice() {
//     // Implement print functionality
//     print('Printing invoice for order ${_orderDetails.orderId}');
//   }
//
//   void _cancelOrder() {
//     // API call to cancel order
//     print('Order ${_orderDetails.orderId} cancelled');
//   }
//
//   void _acceptOrder() {
//     // API call to accept order
//     print('Order ${_orderDetails.orderId} accepted');
//   }
// }
//
// // Models for the order data
// class OrderDetails {
//   final String orderId;
//   final String customerName;
//   final String orderTime;
//   final String phoneNumber;
//   final String email;
//   final String location;
//   final String message;
//   final List<OrderItem> items;
//   final double subTotal;
//   final double deliveryFee;
//   final double serviceTax;
//   final double discount;
//   final double total;
//
//   OrderDetails({
//     required this.orderId,
//     required this.customerName,
//     required this.orderTime,
//     required this.phoneNumber,
//     required this.email,
//     required this.location,
//     required this.message,
//     required this.items,
//     required this.subTotal,
//     required this.deliveryFee,
//     required this.serviceTax,
//     required this.discount,
//     required this.total,
//   });
//
//   // Factory constructor to create OrderDetails from API response
//   factory OrderDetails.fromJson(Map<String, dynamic> json) {
//     return OrderDetails(
//       orderId: json['orderId'],
//       customerName: json['customerName'],
//       orderTime: json['orderTime'],
//       phoneNumber: json['phoneNumber'],
//       email: json['email'],
//       location: json['location'],
//       message: json['message'],
//       items: (json['items'] as List)
//           .map((item) => OrderItem.fromJson(item))
//           .toList(),
//       subTotal: json['subTotal'].toDouble(),
//       deliveryFee: json['deliveryFee'].toDouble(),
//       serviceTax: json['serviceTax'].toDouble(),
//       discount: json['discount'].toDouble(),
//       total: json['total'].toDouble(),
//     );
//   }
// }
//
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
//
//   // Factory constructor to create OrderItem from API response
//   factory OrderItem.fromJson(Map<String, dynamic> json) {
//     return OrderItem(
//       name: json['name'],
//       quantity: json['quantity'],
//       price: json['price'].toDouble(),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/new_order_details_provider.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // Get the screen size for responsive design
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    // Calculate responsive text sizes
    final double bodyFontSize = screenWidth * 0.04;
    final double titleFontSize = screenWidth * 0.045;
    final double headingFontSize = screenWidth * 0.05;

    // Calculate responsive padding values
    final double paddingSmall = screenWidth * 0.02;
    final double paddingMedium = screenWidth * 0.04;
    final double paddingLarge = screenWidth * 0.06;

    return Consumer<OrderDetailsProvider>(
      builder: (context, provider, child) {
        final orderDetails = provider.orderDetails;

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFFE67E22), // Orange color
            toolbarHeight: screenHeight * 0.08,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'New Order',
              style: TextStyle(
                color: Colors.white,
                fontSize: headingFontSize,
              ),
            ),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.white24,
                radius: screenWidth * 0.035,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: screenWidth * 0.05,
                ),
              ),
              SizedBox(width: paddingMedium),
            ],
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _buildCustomerInfo(orderDetails, titleFontSize, bodyFontSize, paddingMedium),
                    _buildContactButtons(orderDetails, provider, bodyFontSize, paddingMedium, paddingSmall),
                    _buildMessage(orderDetails, titleFontSize, bodyFontSize, paddingMedium),
                    _buildItemsList(orderDetails, titleFontSize, bodyFontSize, paddingMedium, paddingSmall),
                    _buildPrintInvoiceButton(provider, bodyFontSize, paddingMedium),
                    _buildOrderSummary(orderDetails, titleFontSize, bodyFontSize, paddingMedium, paddingSmall),
                    _buildActionButtons(provider, bodyFontSize, paddingMedium, paddingSmall),
                    SizedBox(height: paddingMedium), // Bottom padding
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildCustomerInfo(OrderDetails orderDetails, double titleFontSize, double bodyFontSize, double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                orderDetails.customerName,
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                orderDetails.orderTime,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: bodyFontSize * 0.9,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Order id: ${orderDetails.orderId}',
                style: TextStyle(
                  fontSize: bodyFontSize * 0.9,
                  color: Colors.grey[700],
                ),
              ),
              Text(
                'Total ${orderDetails.total.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: bodyFontSize * 0.9,
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactButtons(OrderDetails orderDetails, OrderDetailsProvider provider, double fontSize, double padding, double spacing) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  orderDetails.phoneNumber,
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              Expanded(
                child: _buildContactButton('Call', Icons.call, fontSize, () {
                  provider.callCustomer(orderDetails.phoneNumber);
                }),
              ),
            ],
          ),
          SizedBox(height: spacing * 1.5),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  orderDetails.email,
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              Expanded(
                child: _buildContactButton('Email', Icons.email, fontSize, () {
                  provider.emailCustomer(orderDetails.email);
                }),
              ),
            ],
          ),
          SizedBox(height: spacing * 1.5),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  orderDetails.location,
                  style: TextStyle(fontSize: fontSize),
                ),
              ),
              Expanded(
                child: _buildContactButton('Navigate', Icons.location_on, fontSize, () {
                  provider.navigateToCustomer(orderDetails.location);
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContactButton(String label, IconData icon, double fontSize, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: Color(0xFFE67E22),
        backgroundColor: Colors.white,
        side: BorderSide(color: Color(0xFFE67E22)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(fontSize * 1.2),
        ),
        padding: EdgeInsets.symmetric(vertical: fontSize * 0.3),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: fontSize * 0.9),
      ),
    );
  }

  Widget _buildMessage(OrderDetails orderDetails, double titleFontSize, double bodyFontSize, double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Message:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: titleFontSize * 0.9,
            ),
          ),
          Text(
            orderDetails.message,
            style: TextStyle(fontSize: bodyFontSize),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsList(OrderDetails orderDetails, double titleFontSize, double bodyFontSize, double padding, double spacing) {
    return Column(
      children: [
        Divider(height: 1, color: Colors.grey[300]),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: padding, vertical: spacing * 1.5),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Items',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFontSize * 0.9,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Quantity',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFontSize * 0.9,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'Price',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFontSize * 0.9,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        Divider(height: 1, color: Colors.grey[300]),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: orderDetails.items.length,
          itemBuilder: (context, index) {
            final item = orderDetails.items[index];
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: padding, vertical: spacing * 1.5),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      item.name,
                      style: TextStyle(fontSize: bodyFontSize),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Qty ${item.quantity}',
                      style: TextStyle(fontSize: bodyFontSize),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'INR: ${item.price}',
                      style: TextStyle(fontSize: bodyFontSize),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        Divider(height: 1, color: Colors.grey[300]),
      ],
    );
  }

  Widget _buildPrintInvoiceButton(OrderDetailsProvider provider, double fontSize, double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: OutlinedButton(
          onPressed: () => provider.printInvoice(),
          child: Text(
            'Print Invoice',
            style: TextStyle(fontSize: fontSize * 0.9),
          ),
          style: OutlinedButton.styleFrom(
            foregroundColor: Color(0xFFE67E22),
            side: BorderSide(color: Color(0xFFE67E22)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(fontSize * 1.2),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: padding * 0.8,
              vertical: fontSize * 0.3,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSummary(OrderDetails orderDetails, double titleFontSize, double bodyFontSize, double padding, double spacing) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Column(
        children: [
          _buildSummaryRow('Sub Total', 'INR: ${orderDetails.subTotal}', bodyFontSize),
          _buildSummaryRow('Delivery Fee', 'INR: ${orderDetails.deliveryFee}', bodyFontSize),
          _buildSummaryRow('Service Tax', 'INR: ${orderDetails.serviceTax}', bodyFontSize),
          _buildSummaryRow('Discount 30%', 'INR: ${orderDetails.discount}', bodyFontSize),
          SizedBox(height: spacing),
          _buildSummaryRow(
            'Total',
            '${orderDetails.total}',
            titleFontSize,
            isBold: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, double fontSize, {bool isBold = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: fontSize * 0.25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? fontSize : fontSize * 0.9,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              fontSize: isBold ? fontSize : fontSize * 0.9,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons(OrderDetailsProvider provider, double fontSize, double padding, double spacing) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () => provider.cancelOrder(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(fontSize * 1.2),
                ),
                padding: EdgeInsets.symmetric(vertical: fontSize * 0.4),
              ),
              child: Text(
                'Cancel order',
                style: TextStyle(fontSize: fontSize),
              ),
            ),
          ),
          SizedBox(width: spacing * 2),
          Expanded(
            child: ElevatedButton(
              onPressed: () => provider.acceptOrder(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(fontSize * 1.2),
                ),
                padding: EdgeInsets.symmetric(vertical: fontSize * 0.4),
              ),
              child: Text(
                'Accept order',
                style: TextStyle(fontSize: fontSize),
              ),
            ),
          ),
        ],
      ),
    );
  }
}