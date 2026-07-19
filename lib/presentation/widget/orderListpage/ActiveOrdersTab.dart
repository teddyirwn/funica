import 'package:flutter/material.dart';
import 'package:funica/core/constants/app_color.dart';
import 'package:funica/data/complateOrders.dart';
import 'package:funica/data/list_order_item.dart';
import 'package:funica/presentation/widget/orderListpage/OrderListItem.dart';

class Activeorderstab extends StatelessWidget {
  const Activeorderstab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listOrder = listOrderItem;
    final List<Map<String, dynamic>> completedOrder = completedOrders;


    return Expanded(
      child: DefaultTabController(
        length: 2,

        child: Column(
          children: [
            const TabBar(
              indicatorColor: AppColors.primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 4,
              labelStyle: TextStyle(
                fontFamily: 'urbanist',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              labelColor: AppColors.primaryColor,
              unselectedLabelColor: AppColors.secondary,
              tabs: [
                Tab(text: 'Active'),
                Tab(text: 'Completed'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: OrderListItem(listOrderItem: listOrder)),
                  Center(child: OrderListItem(listOrderItem: completedOrder)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
