import 'package:flutter/material.dart';
import 'package:funica/presentation/widget/customAppbarWidget.dart';
import 'package:funica/presentation/widget/e_receipt/menu_pop_up.dart';
import 'package:funica/presentation/widget/e_receipt/receipt_info_table.dart';
import 'package:funica/presentation/widget/e_receipt/receipt_price_details.dart';
import 'package:funica/presentation/widget/e_receipt/receipt_product_tile.dart';

class EReceiptPage extends StatelessWidget {
  const EReceiptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Customappbarwidget(title: "E-Receipt", actions: [MenuPopUp()]),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 200,
                child: Image.asset(
                  "assets/images/barcode.png",
                  width: 500,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              ReceiptProductTile(),
              SizedBox(height: 20),
              ReceiptPriceDetails(),
              SizedBox(height: 20),
              ReceiptInfoTable(),
              SizedBox(height: 20),
              Container(
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
                child: Row(
                  children: [
                    Text(
                      "Category",
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                    Spacer(),
                    Text(
                      "Orders",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.keyboard_arrow_down_rounded, size: 30),
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
