import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funica/core/constants/app_color.dart';
import 'package:funica/presentation/pages/order_tracking_page.dart';
import 'package:funica/presentation/widget/orderListpage/OrderCardItem.dart';

class TrackOrderButton extends StatelessWidget {
  final Map<String, dynamic> order;
  const TrackOrderButton({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    debugPrint('TrackOrderButton: Button text = ${order}');
    return SizedBox(
      width: 110,
      height: 36,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          padding: EdgeInsets.zero,
        ),
        onPressed: () {
          if (order['buttonText'] == 'Track Order') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => OrderTrackingPage(order: order),
              ),
            );
          } else {
            _showModalBottomSheet(context);
          }
        },
        child: Text(
          order['buttonText'] ?? 'Track Order',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.70,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Divider(
                  color: Colors.grey[200],
                  thickness: 3,
                  indent: 170,
                  endIndent: 170,
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Leave a Review',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(color: Colors.grey[100], thickness: 1, height: 32),
              OrderCardItem(
                imagePath: order['imagePath'],
                productName: order['productName'],
                productColor: order['productColor'],
                quantity: order['quantity'],
                price: order['price'],
                status: order['status'],
                isTracking: true,
                buttonText: order['buttonText'],
              ),
              Divider(color: Colors.grey[100], thickness: 1, height: 32),
              SizedBox(height: 16),
              Center(
                child: Expanded(
                  child: Column(
                    children: [
                      Text(
                        "How is your order?",
                        style: TextStyle(
                          fontFamily: 'urbanist',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Please give your rating & also your review...",
                        style: TextStyle(
                          fontFamily: 'urbanist',
                          fontSize: 14,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.star_rounded,
                              color: Colors.black,
                              size: 32,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.star_rounded,
                              color: Colors.black,
                              size: 32,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.star_rounded,
                              color: Colors.black,
                              size: 32,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.star_rounded,
                              color: Colors.black,
                              size: 32,
                            ),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.star_rounded,
                              color: Colors.grey,
                              size: 32,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Very good product & fast delivery!',
                          fillColor: Colors.grey[200],
                          suffixIconConstraints: const BoxConstraints(
                            minWidth: 20,
                            minHeight: 20,
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(
                              right: 16.0,
                              left: 12.0,
                            ),
                            child: SvgPicture.asset(
                              'assets/icons/Image3.svg',
                              width: 20,
                              height: 20,
                              fit: BoxFit.contain,
                            ),
                          ),
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black),
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(color: Colors.grey[100], thickness: 1, height: 32),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 58),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 16),

                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(double.infinity, 58),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
