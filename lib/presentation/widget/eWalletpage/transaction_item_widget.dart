import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TransactionItemWidget extends StatelessWidget {
  final String name;
  final String date;
  final int price;
  final String status;
  final String statusIcon;
  final String image;
  const TransactionItemWidget({
    super.key,
    required this.name,
    required this.date,
    required this.price,
    required this.status,
    required this.statusIcon,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey[200],
            child: Image.asset(image, width: 50, height: 50, fit: BoxFit.cover),
          ),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                date,
                style: TextStyle(fontSize: 14, color: Colors.grey[400]),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$$price",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    status,
                    style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                  ),
                  SvgPicture.asset(statusIcon, width: 16, height: 16),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
