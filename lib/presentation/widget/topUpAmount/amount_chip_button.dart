import 'package:flutter/material.dart';
import 'package:funica/core/constants/app_color.dart';

class AmountChipButton extends StatelessWidget {
  final String amount;
  const AmountChipButton({super.key, required this.amount});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,

        fixedSize: Size(116, 38),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(50),
        ),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      ),
      onPressed: () {},
      child: Text(
        "\$$amount",
        style: TextStyle(
          color: AppColors.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
