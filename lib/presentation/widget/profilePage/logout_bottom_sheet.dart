import 'package:flutter/material.dart';
import 'package:funica/presentation/widget/customPrimaryButton.dart';
import 'package:funica/presentation/widget/customSecondaryButton.dart';

class LogoutBottomSheet extends StatelessWidget {
  final VoidCallback onLogout;

  const LogoutBottomSheet({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32.0),
          topRight: Radius.circular(32.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Indicator Bar di atas
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
          const SizedBox(height: 24.0),

          // Title Modal
          const Text(
            'Logout',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
            ),
          ),
          const SizedBox(height: 12.0),

          const Divider(thickness: 1, color: Color(0xFFEEEEEE)),
          const SizedBox(height: 16.0),

          const Text(
            'Are you sure you want to log out?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24.0),

          Row(
            children: [
              Expanded(
                child: Customsecondarybutton(
                  text: 'Cancel',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              const SizedBox(width: 12.0),

              Expanded(
                child: Customprimarybutton(
                  text: "Yes, Logout",
                  onPressed: onLogout,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
        ],
      ),
    );
  }
}
