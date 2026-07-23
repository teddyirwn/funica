import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funica/presentation/pages/auth/light_sign_in.dart';
import 'package:funica/presentation/pages/help_center/help_center_page.dart';
import 'package:funica/presentation/pages/profile/address_page.dart';
import 'package:funica/presentation/pages/profile/edit_profile_page.dart';
import 'package:funica/presentation/pages/profile/invite_friends_page.dart';
import 'package:funica/presentation/pages/profile/language_page.dart';
import 'package:funica/presentation/pages/profile/notification_page.dart';
import 'package:funica/presentation/pages/profile/payment_page.dart';
import 'package:funica/presentation/pages/profile/privacy_policy_page.dart';
import 'package:funica/presentation/pages/profile/security_page.dart';
import 'package:funica/presentation/widget/appBar.dart';
import 'package:funica/presentation/widget/bottom_navigation_bar.dart';
import 'package:funica/presentation/widget/profilePage/logout_bottom_sheet.dart';
import 'package:funica/presentation/widget/profilePage/profile_header_widged.dart';
import 'package:funica/presentation/widget/profilePage/profile_menu_tile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = false;
    return Scaffold(
      appBar: AppBarWidget(
        title: 'Profile',
        action: [
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          children: [
            ProfileHeaderWidget(
              imagePath: 'assets/images/user.png',
              name: 'Andrew Ainsley',
              phoneNumber: '+1 111 467 378 399',
              onEditImagePressed: () {},
            ),
            const SizedBox(height: 24),
            const Divider(color: Colors.black12, thickness: 1),
            const SizedBox(height: 12),

            ProfileMenuTile(
              icon: "assets/icons/person.svg",
              title: 'Edit Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const EditProfilePage();
                    },
                  ),
                );
              },
            ),
            ProfileMenuTile(
              icon: "assets/icons/Location.svg",
              title: 'Address',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const AddressPage();
                    },
                  ),
                );
              },
            ),
            ProfileMenuTile(
              icon: "assets/icons/Notification.svg",
              title: 'Notification',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const NotificationPage();
                    },
                  ),
                );
              },
            ),
            ProfileMenuTile(
              icon: "assets/icons/Wallet.svg",
              title: 'Payment',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const PaymentPage();
                    },
                  ),
                );
              },
            ),
            ProfileMenuTile(
              icon: "assets/icons/Shield_Done.svg",
              title: 'Security',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SecurityPage();
                    },
                  ),
                );
              },
            ),
            ProfileMenuTile(
              icon: "assets/icons/More_Circle.svg",
              title: 'Language',
              value: 'English (US)',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const LanguagePage();
                    },
                  ),
                );
              },
            ),
            ProfileMenuTile(
              icon: "assets/icons/Show.svg",
              title: 'Dark Mode',
              trailing: Switch.adaptive(
                value: isDarkMode,
                activeColor: Colors.black,
                onChanged: (val) {
                  setState(() {
                    isDarkMode = val;
                  });
                },
              ),
            ),
            ProfileMenuTile(
              icon: "assets/icons/Lock.svg",
              title: 'Privacy Policy',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const PrivacyPolicyPage();
                    },
                  ),
                );
              },
            ),
            ProfileMenuTile(
              icon: "assets/icons/Info_Square.svg",
              title: 'Help Center',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HelpCenterPage();
                    },
                  ),
                );
              },
            ),
            ProfileMenuTile(
              icon: "assets/icons/3_User.svg",
              title: 'Invite Friends',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const InviteFriendsPage();
                    },
                  ),
                );
              },
            ),
            ProfileMenuTile(
              icon: "assets/icons/Logout.svg",
              title: 'Logout',
              color: Colors.redAccent,
              onTap: () {
                _showLogoutDialog(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 4),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return LogoutBottomSheet(
          onLogout: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SignInScreen();
                },
              ),
            );
          },
        );
      },
    );
  }
}
