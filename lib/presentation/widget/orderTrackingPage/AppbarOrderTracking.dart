import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Appbarordertracking extends StatelessWidget {
  const Appbarordertracking({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  'assets/icons/ArrowLeft.svg',
                  width: 28,
                  height: 28,
                ),
              ),
              Text(
                "Track Order",
                style: TextStyle(
                  fontFamily: 'urbanist',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/Search.svg',
            width: 28,
            height: 28,
          ),
        ),
      ],
    );
  }
}
