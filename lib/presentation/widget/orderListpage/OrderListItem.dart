import 'package:flutter/material.dart';
import 'package:funica/presentation/widget/orderListpage/OrderCardItem.dart';

class OrderListItem extends StatelessWidget {
  final List<Map<String, dynamic>> listOrderItem;
  const OrderListItem({super.key, required this.listOrderItem});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listOrderItem.length,
      itemBuilder: (context, index) {
        return OrderCardItem(
          imagePath: listOrderItem[index]['image'],
          productName: listOrderItem[index]['name'],
          productColor: listOrderItem[index]['option'],
          quantity: listOrderItem[index]['quantity'],
          status: listOrderItem[index]['status'],
          price: (listOrderItem[index]['price'] as num).toDouble(),
          buttonTxt: listOrderItem[index]['buttonText'],
        );
      },
    );
  }
}
