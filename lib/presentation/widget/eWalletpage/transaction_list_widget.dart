import 'package:flutter/material.dart';
import 'package:funica/data/transaction_item.dart';
import 'package:funica/presentation/widget/eWalletpage/transaction_item_widget.dart';

class TransactionListWidget extends StatelessWidget {
  const TransactionListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> data = listTransactionItem;
    debugPrint("Transaction List: $data");
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 5,
      itemBuilder: (context, index) {
        return TransactionItemWidget(
          name: data[index]['name'],
          date: data[index]['date'],
          price: data[index]['price'],
          status: data[index]['status'],
          statusIcon: data[index]['statusIcon'],
          image: data[index]['image'],
        );
      },
    );
  }
}
