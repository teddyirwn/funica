import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/eWallet/eWallet_page.dart';
import 'package:funica/presentation/widget/customPrimaryButton.dart';
import 'package:funica/presentation/widget/customSecondaryButton.dart';

class CustomSuccessDialog extends StatelessWidget {
  const CustomSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Container(
        width: 340,
        height: 500,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(48),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            children: [
              Image.asset(
                "assets/images/alertSucces.png",
                width: 140,
                height: 140,
              ),
              SizedBox(height: 24),
              Text(
                "Top Up Successful!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Text(
                "You have successfully top up\ne-wallet for \$500",
                textAlign: TextAlign.center,

                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w100),
              ),

              Spacer(),
              Customprimarybutton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => EwalletPage()),
                  );
                },
                text: "Continue",
              ),
              SizedBox(height: 16),
              Customsecondarybutton(
                text: "Cancel",
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
