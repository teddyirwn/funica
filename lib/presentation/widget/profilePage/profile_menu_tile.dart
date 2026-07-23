import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funica/core/constants/app_color.dart';

class ProfileMenuTile extends StatelessWidget {
  final String icon;
  final String title;
  final String? value;
  final Widget? trailing;
  final Color? color;
  final VoidCallback? onTap;

  const ProfileMenuTile({
    super.key,
    required this.icon,
    required this.title,
    this.value,
    this.trailing,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(icon, width: 24, height: 24),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: color ?? AppColors.primaryColor,
        ),
      ),
      trailing:
          trailing ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (value != null) ...[
                Text(
                  value!,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 8),
              ],
              if (color == null)
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: Colors.black87,
                ),
            ],
          ),
    );
  }
}
