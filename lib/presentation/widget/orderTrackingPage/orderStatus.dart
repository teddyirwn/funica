import 'package:flutter/material.dart';
import 'package:funica/core/constants/app_color.dart';
import 'package:funica/data/orderStatus.dart';

class Orderstatus extends StatelessWidget {
  const Orderstatus({super.key});

  @override
  Widget build(BuildContext context) {
    final Orderstatus = orderStatus;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: Orderstatus.length,
      itemBuilder: (context, index) {
        final item = Orderstatus[index];
        final isLast = index == Orderstatus.length - 1;

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primaryColor, width: 3),
                  ),
                  child: Center(
                    child: Container(
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),

                if (!isLast)
                  Container(width: 2, height: 40, color: Colors.grey.shade300),
              ],
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "${item["title"]} - ${item["date"]}",
                          style: const TextStyle(
                            fontFamily: 'urbanist',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        item["time"],
                        style: const TextStyle(
                          fontFamily: 'urbanist',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    item["address"],
                    style: const TextStyle(
                      fontFamily: 'urbanist',
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
