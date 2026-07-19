import 'package:flutter/material.dart';
import 'package:funica/core/constants/app_color.dart';
import 'package:funica/presentation/widget/orderListpage/TrackOrderButton.dart';

class OrderCardItem extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String productColor;
  final int quantity;
  final double price;
  final bool isTracking;
  final String status;
  final String buttonTxt;

  const OrderCardItem({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productColor,
    required this.quantity,
    required this.price,
    this.isTracking = false,
    required this.status,
    required this.buttonTxt,
  });

  @override
  Widget build(BuildContext context) {
    debugPrint('OrderCardItem: Button text = $buttonTxt');
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[200],
            ),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontFamily: 'urbanist',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(radius: 10, backgroundColor: Colors.grey[300]),
                    SizedBox(width: 4),
                    Text("$productColor | qty: $quantity"),
                  ],
                ),
                SizedBox(height: 8),
                isTracking
                    ? SizedBox.shrink()
                    : Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Text(status, style: TextStyle(fontSize: 10)),
                      ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      '\$$price',
                      style: TextStyle(
                        fontFamily: 'urbanist',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    isTracking
                        ? SizedBox.shrink()
                        : TrackOrderButton(
                            order: {
                              'imagePath': imagePath,
                              'productName': productName,
                              'productColor': productColor,
                              'quantity': quantity,
                              'price': price,
                              'buttonTxt': buttonTxt ?? 'Track Order',
                            },
                          ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
