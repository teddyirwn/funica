import 'package:flutter/material.dart';

import 'package:funica/presentation/widget/orderListpage/OrderCardItem.dart';
import 'package:funica/presentation/widget/orderTrackingPage/AppbarOrderTracking.dart';
import 'package:funica/presentation/widget/orderTrackingPage/DashedLine.dart';
import 'package:funica/presentation/widget/orderTrackingPage/DeliveryProgresIcon.dart';
import 'package:funica/presentation/widget/orderTrackingPage/orderStatus.dart';

class OrderTrackingPage extends StatelessWidget {
  final Map<String, dynamic> order;
  const OrderTrackingPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    debugPrint("Order Tracking Page: $order");
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Appbarordertracking(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OrderCardItem(
                        isTracking: true,
                        imagePath: order['imagePath'] ?? '',
                        productName: order['productName'] ?? '',
                        status: order['status'] ?? '',
                        productColor: order['productColor'] ?? '',
                        quantity: order['quantity'] ?? 0,
                        price: order['price'] ?? 0,
                        buttonText: order['buttonText'] ?? 'Track Order',
                      ),

                      // delivery status
                      SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,

                          children: [
                            Deliveryprogresicon(
                              iconPath: 'assets/icons/ShippingRegular.svg',
                            ),
                            DashedLine(),
                            Deliveryprogresicon(
                              iconPath: 'assets/icons/ShippingCargo.svg',
                            ),
                            DashedLine(),
                            Deliveryprogresicon(
                              iconPath: 'assets/icons/Received.svg',
                            ),
                            DashedLine(),
                            Deliveryprogresicon(
                              iconPath: 'assets/icons/BoxOpen.svg',
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Center(
                        child: Text(
                          "Packet In Delivery",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.grey[300],
                        thickness: 1,
                        height: 32,
                      ),

                      Text(
                        "Order Status Details",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Orderstatus(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
