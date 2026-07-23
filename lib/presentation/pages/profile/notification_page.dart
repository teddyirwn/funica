import 'package:flutter/material.dart';
import 'package:funica/core/constants/app_color.dart';
import 'package:funica/presentation/widget/customAppbarWidget.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool _generalNotification = true;
  bool _sound = true;
  bool _vibrate = false;
  bool _specialOffers = true;
  bool _promoDiscount = false;
  bool _payments = true;
  bool _appUpdate = true;
  bool _newServiceAvailable = false;
  bool _newTipsAvailable = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbarwidget(title: 'Notification'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        children: [
          _buildSwitchItem(
            title: 'General Notification',
            value: _generalNotification,
            onChanged: (val) => setState(() => _generalNotification = val),
          ),
          _buildSwitchItem(
            title: 'Sound',
            value: _sound,
            onChanged: (val) => setState(() => _sound = val),
          ),
          _buildSwitchItem(
            title: 'Vibrate',
            value: _vibrate,
            onChanged: (val) => setState(() => _vibrate = val),
          ),
          _buildSwitchItem(
            title: 'Special Offers',
            value: _specialOffers,
            onChanged: (val) => setState(() => _specialOffers = val),
          ),
          _buildSwitchItem(
            title: 'Promo & Discount',
            value: _promoDiscount,
            onChanged: (val) => setState(() => _promoDiscount = val),
          ),
          _buildSwitchItem(
            title: 'Payments',
            value: _payments,
            onChanged: (val) => setState(() => _payments = val),
          ),
          _buildSwitchItem(
            title: 'App Update',
            value: _appUpdate,
            onChanged: (val) => setState(() => _appUpdate = val),
          ),
          _buildSwitchItem(
            title: 'New Service Available',
            value: _newServiceAvailable,
            onChanged: (val) => setState(() => _newServiceAvailable = val),
          ),
          _buildSwitchItem(
            title: 'New Tips Available',
            value: _newTipsAvailable,
            onChanged: (val) => setState(() => _newTipsAvailable = val),
          ),
        ],
      ),
    );
  }

  Widget _buildSwitchItem({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        value: value,
        onChanged: onChanged,

        activeColor: Colors.white,
        activeTrackColor: AppColors.primaryColor,

        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.grey.shade300,

        overlayColor: WidgetStateProperty.all(
          AppColors.primaryColor.withOpacity(0.15),
        ),
      ),
    );
  }
}
