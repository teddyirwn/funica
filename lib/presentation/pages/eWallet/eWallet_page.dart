import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funica/core/constants/app_color.dart';
import 'package:funica/presentation/pages/eWallet/transaction_history_page.dart';
import 'package:funica/presentation/widget/appBar.dart';
import 'package:funica/presentation/widget/eWalletpage/transaction_list_widget.dart';
import 'package:funica/presentation/widget/eWalletpage/wallet_card_widget.dart';

class EwalletPage extends StatelessWidget {
  const EwalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(
          title: "E-Wallet",
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
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                WalletCardWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transaction History",
                      style: TextStyle(
                        fontFamily: 'urbanist',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return TransactionHistoryPage();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontFamily: 'urbanist',
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                TransactionListWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
