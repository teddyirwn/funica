import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funica/core/constants/app_color.dart';

class Deliveryprogresicon extends StatelessWidget {
  final String iconPath;
  const Deliveryprogresicon({super.key, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(iconPath, width: 36, height: 36),
        SizedBox(height: 8),
        CircleAvatar(
          radius: 10,
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.check,
            size: 12,
            fontWeight: FontWeight.bold,
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
