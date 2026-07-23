import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funica/core/constants/app_color.dart';
import 'package:funica/presentation/pages/eWallet/top_up_amount_screen.dart';

class WalletCardWidget extends StatelessWidget {
  const WalletCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 24),
      height: 221,
      width: double.infinity,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)),
      child: Stack(
        children: [
          Positioned.fill(
            child: Transform.scale(
              scale: 1.3,
              child: Image.asset('assets/images/card.png', fit: BoxFit.cover),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Andrew Ainsley",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "●●●● ●●●● ●●●● 3629",
                          style: TextStyle(fontSize: 14, color: Colors.white),
                        ),
                      ],
                    ),

                    Image.asset(
                      "assets/images/mastercard.png",
                      width: 100,
                      height: 32,
                    ),
                  ],
                ),
                Spacer(),
                Text(
                  "Your balance",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$9,379",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TopUpAmountScreen();
                            },
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(117, 32),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      icon: SvgPicture.asset(
                        "assets/icons/Download.svg",
                        width: 16,
                        height: 16,
                      ),
                      label: Text(
                        "Top Up",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryColor,
                        ),
                      ),
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
