import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funica/data/transaction_item.dart';
import 'package:funica/presentation/widget/customAppbarWidget.dart';
import 'package:funica/presentation/widget/eWalletpage/transaction_item_widget.dart';

class TransactionHistoryPage extends StatelessWidget {
  TransactionHistoryPage({super.key});

  final List<Map<String, dynamic>> transactions = listTransactionItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Customappbarwidget(
          title: "Transaction History",
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset("assets/icons/Search.svg"),
            ),
          ],
        ),
        body: ListView.builder(
          padding: const EdgeInsets.all(24),
          itemCount: transactions.length,
          itemBuilder: (BuildContext context, int index) {
            final transaction = transactions[index];
            return TransactionItemWidget(
              name: transaction["name"] as String,
              date: transaction["date"] as String,
              price: transaction["price"] as int,
              status: transaction["status"] as String,
              statusIcon: transaction["statusIcon"] as String,
              image: transaction["image"] as String,
            );
          },
        ),
      ),
    );
  }
}
