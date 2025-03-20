// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// class SellerHomeScreen extends StatefulWidget {
//   const SellerHomeScreen({super.key});
//
//   @override
//   State<SellerHomeScreen> createState() => _SellerHomeScreenState();
// }
//
// class _SellerHomeScreenState extends State<SellerHomeScreen> {
//   XFile? _selectedImage;
//
//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//
//     if (image != null) {
//       setState(() {
//         _selectedImage = image;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.sizeOf(context);
//     final height = size.height;
//     final width = size.width;
//     final double fontSize = width * 0.05;
//     final double iconSize = width * 0.07;
//     int _selectedIndex = 0;
//     String? selectedLocation;
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           backgroundColor: Color(0xFFF0812D),
//           leading: GestureDetector(
//             onTap: () {
//               print("Hello");
//             },
//             child: Icon(
//               Icons.menu,
//               color: Colors.white,
//               size: iconSize,
//             ),
//           ),
//           title: Text(
//             "Mishra Ji -Hyderabad",
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: fontSize,
//             ),
//           ),
//           actions: [
//             GestureDetector(
//               onTap: () {},
//               child: Icon(
//                 Icons.person,
//                 color: Colors.white,
//                 size: iconSize,
//               ),
//             ),
//             SizedBox(width: width * 0.03),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 width: double.infinity,
//                 child: Image(image: AssetImage('assets/Seller_Home.png'),fit: BoxFit.fitHeight,),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top: 8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Image(image: AssetImage('assets/Order_Delivery.png')),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5.0, left: 1.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               border: Border.all(
//                                 color: Colors.white,
//                               ),
//                               borderRadius: BorderRadius.circular(16.0),
//                             ),
//                             child: FittedBox(
//                               child: Padding(
//                                 padding: const EdgeInsets.all(7.0),
//                                 child: Text(
//                                   "Hurry up it's Rush Hour!",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Text(
//                             "3 more order delivery found!",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           Row(
//                             children: [
//                               Text("New Orders"),
//                               SizedBox(width: width * 0.03),
//                               Text("View Details"),
//                               SizedBox(width: width * 0.01),
//                               GestureDetector(
//                                 onTap: () {},
//                                 child: Icon(Icons.arrow_right_alt),
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                     border: Border.all(width: 1.0, color: Colors.black12)),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: height * 0.01, left: width * 0.05),
//                 child: Text(
//                   "Upload Item",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: height * 0.02,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(height * 0.02),
//                 child: CustomPaint(
//                   painter: DashedBorderPainter(),
//                   child: GestureDetector(
//                     onTap: _pickImage,
//                     child: Container(
//                       height: height * 0.15,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Colors.black12,
//                       ),
//                       child: Padding(
//                         padding: EdgeInsets.only(top: height * 0.02),
//                         child: Center(
//                           child: Column(
//                             children: [
//                               if (_selectedImage != null)
//                                 Image.asset(
//                                   _selectedImage!.path,
//                                   height: height * 0.1,
//                                   width: width * 0.3,
//                                   fit: BoxFit.cover,
//                                 )
//                               else
//                                 Column(
//                                   children: [
//                                     Icon(
//                                       Icons.camera,
//                                       color: Color(0xFFF0812D),
//                                     ),
//                                     SizedBox(height: height * 0.01),
//                                     Text(
//                                       "Add Photo",
//                                       style: TextStyle(
//                                         color: Color(0xFFF0812D),
//                                       ),
//                                     ),
//                                     SizedBox(height: height * 0.01),
//                                     Text(
//                                       "PDF, JPG, JPEG, PNG less than 10MB.",
//                                     ),
//                                   ],
//                                 ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: width*0.05,top: height*0.01),
//                 child: Text("Category"),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: width * 0.05, top: height * 0.01, right: width * 0.05),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     border: Border.all(color: Colors.black26),
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: "Enter your category",
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: width*0.05,top: height*0.01),
//                 child: Text("Product"),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: width * 0.05, top: height * 0.01, right: width * 0.05),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     border: Border.all(color: Colors.black26),
//                   ),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       hintText: "Enter product name",
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: width*0.05,top: height*0.01),
//                 child: Text("Product"),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: width * 0.05, top: height * 0.01, right: width * 0.05),
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(16),
//                     border: Border.all(color: Colors.black26),
//                   ),
//                   child: DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       contentPadding: EdgeInsets.zero,
//                     ),
//                     hint: Text("Select your Location"),
//                     value: selectedLocation,
//                     items: ["New York", "London", "Tokyo", "Paris", "Mumbai"]
//                         .map((location) => DropdownMenuItem(
//                       value: location,
//                       child: Text(location),
//                     ))
//                         .toList(),
//                     onChanged: (value) {
//                       setState(() {
//                         selectedLocation = value;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           currentIndex: _selectedIndex,
//           onTap: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.category),
//               label: 'Categories',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_cart),
//               label: 'My cart',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.favorite),
//               label: 'Wishlist',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class DashedBorderPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     double dashWidth = 10, dashSpace = 5;
//     Paint paint = Paint()
//       ..color = Colors.black54
//       ..strokeWidth = 2
//       ..style = PaintingStyle.stroke;
//
//     // Top border
//     double startX = 0;
//     while (startX < size.width) {
//       canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
//       startX += dashWidth + dashSpace;
//     }
//
//     // Bottom border
//     startX = 0;
//     while (startX < size.width) {
//       canvas.drawLine(
//           Offset(startX, size.height), Offset(startX + dashWidth, size.height), paint);
//       startX += dashWidth + dashSpace;
//     }
//
//     // Left border
//     double startY = 0;
//     while (startY < size.height) {
//       canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
//       startY += dashWidth + dashSpace;
//     }
//
//     // Right border
//     startY = 0;
//     while (startY < size.height) {
//       canvas.drawLine(
//           Offset(size.width, startY), Offset(size.width, startY + dashWidth), paint);
//       startY += dashWidth + dashSpace;
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/seller_home_provider.dart';


class SellerHomeScreen extends StatelessWidget {
  const SellerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SellerHomeProvider(),
      child: const SellerHomeView(),
    );
  }
}

class SellerHomeView extends StatelessWidget {
  const SellerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SellerHomeProvider>(context);
    final size = MediaQuery.sizeOf(context);
    final height = size.height;
    final width = size.width;
    final double fontSize = width * 0.05;
    final double iconSize = width * 0.07;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color(0xFFF0812D),
          leading: GestureDetector(
            onTap: () {
              print("Hello");
            },
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: iconSize,
            ),
          ),
          title: Text(
            "Mishra Ji -Hyderabad",
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
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
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image(image: const AssetImage('assets/Seller_Home.png'), fit: BoxFit.fitHeight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Image(image: AssetImage('assets/Order_Delivery.png')),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, left: 1.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: const FittedBox(
                              child: Padding(
                                padding: EdgeInsets.all(7.0),
                                child: Text(
                                  "Hurry up it's Rush Hour!",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            "3 more order delivery found!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              const Text("New Orders"),
                              SizedBox(width: width * 0.03),
                              const Text("View Details"),
                              SizedBox(width: width * 0.01),
                              GestureDetector(
                                onTap: () {},
                                child: const Icon(Icons.arrow_right_alt),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(width: 1.0, color: Colors.black12)),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01, left: width * 0.05),
                child: Text(
                  "Upload Item",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.02,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(height * 0.02),
                child: CustomPaint(
                  painter: DashedBorderPainter(),
                  child: GestureDetector(
                    onTap: () => provider.pickImage(),
                    child: Container(
                      height: height * 0.15,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(top: height * 0.02),
                        child: Center(
                          child: Column(
                            children: [
                              if (provider.selectedImage != null)
                                Image.asset(
                                  provider.selectedImage!.path,
                                  height: height * 0.1,
                                  width: width * 0.3,
                                  fit: BoxFit.cover,
                                )
                              else
                                Column(
                                  children: [
                                    const Icon(
                                      Icons.camera,
                                      color: Color(0xFFF0812D),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    const Text(
                                      "Add Photo",
                                      style: TextStyle(
                                        color: Color(0xFFF0812D),
                                      ),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    const Text(
                                      "PDF, JPG, JPEG, PNG less than 10MB.",
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width*0.05, top: height*0.01),
                child: const Text("Category"),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05, top: height * 0.01, right: width * 0.05),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black26),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Enter your category",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width*0.05, top: height*0.01),
                child: const Text("Product"),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05, top: height * 0.01, right: width * 0.05),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black26),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Enter product name",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width*0.05, top: height*0.01),
                child: const Text("Location"),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.05, top: height * 0.01, right: width * 0.05),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black26),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    hint: const Text("Select your Location"),
                    value: provider.selectedLocation,
                    items: ["New York", "London", "Tokyo", "Paris", "Mumbai"]
                        .map((location) => DropdownMenuItem(
                      value: location,
                      child: Text(location),
                    ))
                        .toList(),
                    onChanged: (value) {
                      provider.setSelectedLocation(value);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: provider.selectedIndex,
          onTap: (index) {
            provider.setSelectedIndex(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'My cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Wishlist',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double dashWidth = 10, dashSpace = 5;
    Paint paint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Top border
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }

    // Bottom border
    startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
          Offset(startX, size.height), Offset(startX + dashWidth, size.height), paint);
      startX += dashWidth + dashSpace;
    }

    // Left border
    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(Offset(0, startY), Offset(0, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }

    // Right border
    startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
          Offset(size.width, startY), Offset(size.width, startY + dashWidth), paint);
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}