import 'package:flutter/material.dart';
import 'package:funica/presentation/widget/topUpAmount/amount_chip_button.dart';

class AmountChipList extends StatelessWidget {
  AmountChipList({super.key});

  final List<String> amounts = [
    "10",
    "20",
    "50",
    "100",
    "200",
    "250",
    "500",
    "750",
    "1000",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 2.8,
      ),
      itemCount: amounts.length,
      itemBuilder: (BuildContext context, int index) {
        return AmountChipButton(amount: amounts[index]);
      },
    );
  }
}
