import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/eWallet/top_up_pin_screen.dart';
import 'package:funica/presentation/widget/customAppbarWidget.dart';
import 'package:funica/presentation/widget/customPrimaryButton.dart';
import 'package:funica/presentation/widget/customSecondaryButton.dart';
import 'package:funica/presentation/widget/topUpAmount/payment_method_list.dart';

class PaymentMethodTile extends StatelessWidget {
  const PaymentMethodTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbarwidget(title: "Top Up E-Wallet"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select the top up method you want to use.",
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24),
            PaymentMethodList(),
            Customsecondarybutton(text: "Add New Payment Method"),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(
            horizontal: BorderSide(color: Colors.grey[300]!, width: 1),
          ),

          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(30),
            right: Radius.circular(30),
          ),
        ),
        child: Customprimarybutton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return TopUpPinScreen();
                },
              ),
            );
          },
          text: "Continue",
        ),
      ),
    );
  }
}
