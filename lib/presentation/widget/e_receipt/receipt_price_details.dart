import 'package:flutter/material.dart';

class ReceiptPriceDetails extends StatelessWidget {
  const ReceiptPriceDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Amount",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              Spacer(),
              Text(
                "\$120.00",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Promo",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              Spacer(),
              Text(
                "- \$36.00",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Divider(color: Colors.grey[300], thickness: 1),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Total",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              Spacer(),
              Text(
                "\$84.00",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
