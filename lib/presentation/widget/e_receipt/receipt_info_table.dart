import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funica/core/constants/app_color.dart';

class ReceiptInfoTable extends StatelessWidget {
  const ReceiptInfoTable({super.key});

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
                "Payment Methods",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              Spacer(),
              Text(
                "My E-Wallet",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Date",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              Spacer(),
              Text(
                "Dec 15, 2024 | 10:00:27 AM",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 20),

          Row(
            children: [
              Text(
                "Transaction ID",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              Spacer(),
              Text(
                "SK7263727399",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/copy.svg"),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Status",
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
              ),
              Container(
                width: 40,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Paid",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
