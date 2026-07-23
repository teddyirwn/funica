import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/eWallet/payment_method_tile.dart';
import 'package:funica/presentation/widget/customAppbarWidget.dart';
import 'package:funica/presentation/widget/customPrimaryButton.dart';
import 'package:funica/presentation/widget/topUpAmount/amount_chip_list.dart';
import 'package:funica/presentation/widget/topUpAmount/amount_display_box.dart';

class TopUpAmountScreen extends StatelessWidget {
  const TopUpAmountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbarwidget(title: "Top Up E-Wallet"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Text("Enter the amount of top up", style: TextStyle(fontSize: 16)),
            SizedBox(height: 24),

            AmountDisplayBox(),
            SizedBox(height: 24),
            AmountChipList(),
            SizedBox(height: 24),
            Customprimarybutton(
              text: "Continue",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PaymentMethodTile();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
