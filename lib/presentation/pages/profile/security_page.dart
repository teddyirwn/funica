import 'package:flutter/material.dart';
import 'package:funica/presentation/widget/customAppbarWidget.dart';
import 'package:funica/presentation/widget/customSecondaryButton.dart';
import 'package:funica/presentation/widget/profilePage/security_switch_tile.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool _rememberMe = true;
  bool _faceId = true;
  bool _biometricId = false;
  bool _googleAuthenticator = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Customappbarwidget(title: 'Security'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  SecuritySwitchTile(
                    title: 'Remember me',
                    value: _rememberMe,
                    onChanged: (val) => setState(() => _rememberMe = val),
                  ),
                  SecuritySwitchTile(
                    title: 'Face ID',
                    value: _faceId,
                    onChanged: (val) => setState(() => _faceId = val),
                  ),
                  SecuritySwitchTile(
                    title: 'Biometric ID',
                    value: _biometricId,
                    onChanged: (val) => setState(() => _biometricId = val),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Google Authenticator",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                            size: 20,
                          ),
                          onPressed: () {
                            // Handle info button press
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),

                  Customsecondarybutton(text: "Change PIN"),
                  const SizedBox(height: 16.0),
                  Customsecondarybutton(text: "Change Password"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
