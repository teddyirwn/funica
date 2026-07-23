import 'package:flutter/material.dart';

import 'package:funica/presentation/widget/customAppbarWidget.dart';
import 'package:funica/presentation/widget/customPrimaryButton.dart';
import 'package:funica/presentation/widget/topUpPin/PinTextField.dart';
import 'package:funica/presentation/widget/topUpPin/custom_success_dialog.dart';

class TopUpPinScreen extends StatelessWidget {
  const TopUpPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: Customappbarwidget(title: "Enter Your PIN"),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: height * 0.08),

              const Text(
                "Enter your PIN to confirm top up",
                style: TextStyle(fontSize: 18),
              ),

              SizedBox(height: height * 0.08),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  PinTextField(),
                  PinTextField(),
                  PinTextField(),
                  PinTextField(),
                ],
              ),

              SizedBox(height: height * 0.1),

              Customprimarybutton(
                text: "Continue",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomSuccessDialog();
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
