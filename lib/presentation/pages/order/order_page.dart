import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funica/presentation/widget/appBar.dart';
import 'package:funica/presentation/widget/bottom_navigation_bar.dart';
import 'package:funica/presentation/widget/orderListpage/ActiveOrdersTab.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: "My Orders",
          action: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/icons/Search.svg',
                width: 24,
                height: 24,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18),
              child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/Group.svg',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [SizedBox(height: 24), Activeorderstab()]),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 2),
      ),
    );
  }
}
