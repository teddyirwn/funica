import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? action;
  const AppBarWidget({super.key, required this.title, this.action});

  @override
  Size get preferredSize => const Size.fromHeight(80);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      toolbarHeight: 80,
      leadingWidth: 74,

      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/LogoLight.svg',
          width: 24,
          height: 24,
        ),
        onPressed: () {},
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'urbanist',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: action,
    );
  }
}
