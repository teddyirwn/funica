import 'package:flutter/material.dart';
import 'package:funica/presentation/widget/customAppbarWidget.dart';
import 'package:funica/presentation/widget/customPrimaryButton.dart';
import 'package:funica/presentation/widget/profilePage/editProfile/custom_text_field.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController fullNameController = TextEditingController(
    text: "Andrew Ainsley",
  );
  final TextEditingController nicknameController = TextEditingController(
    text: "Andrew",
  );
  final TextEditingController dobController = TextEditingController(
    text: "12/27/1995",
  );
  final TextEditingController emailController = TextEditingController(
    text: "andrew_ainsley@yourdomain.com",
  );
  final TextEditingController countryController = TextEditingController(
    text: "United States",
  );
  final TextEditingController phoneController = TextEditingController(
    text: "+1 111 467 378 399",
  );
  final TextEditingController genderController = TextEditingController(
    text: "Male",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Customappbarwidget(title: "Edit Profile", actions: []),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextField(
                        label: "Full Name",
                        hintText: "Full Name",
                        controller: fullNameController,
                      ),
                      CustomTextField(
                        label: "Nickname",
                        hintText: "Nickname",
                        controller: nicknameController,
                      ),
                      CustomTextField(
                        label: "Date of Birth",
                        hintText: "Date of Birth",
                        controller: dobController,
                        readOnly: true,
                        suffixIcon: const Icon(Icons.calendar_month_outlined),
                        onTap: () {},
                      ),
                      CustomTextField(
                        label: "Email",
                        hintText: "Email",
                        controller: emailController,
                        suffixIcon: const Icon(Icons.email_outlined),
                      ),
                      CustomTextField(
                        label: "Country",
                        hintText: "Country",
                        controller: countryController,
                        readOnly: true,
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      ),
                      CustomTextField(
                        label: "Phone Number",
                        hintText: "Phone Number",
                        controller: phoneController,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 16, right: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text("🇺🇸"),
                              SizedBox(width: 4),
                              Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                        ),
                      ),
                      CustomTextField(
                        label: "Gender",
                        hintText: "Gender",
                        controller: genderController,
                        readOnly: true,
                        suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),
                ),
              ),
              Customprimarybutton(
                text: "Update",
                onPressed: () {
                  return Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
