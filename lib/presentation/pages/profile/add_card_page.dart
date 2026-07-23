import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funica/presentation/widget/customAppbarWidget.dart';
import 'package:funica/presentation/widget/customPrimaryButton.dart';
import 'package:funica/presentation/widget/profilePage/addCard/credit_card_preview_widget.dart';
import 'package:funica/presentation/widget/profilePage/editProfile/custom_text_field.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _cardNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void dispose() {
    _cardNameController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Customappbarwidget(
        title: 'Add New Card',
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/Group.svg"),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const CreditCardPreviewWidget(),
              const SizedBox(height: 24.0),

              CustomTextField(
                label: 'Card Name',
                hintText: 'Andrew Ainsley',
                controller: _cardNameController,
              ),
              const SizedBox(height: 20.0),

              CustomTextField(
                label: 'Card Number',
                hintText: '2672 4738 2234 5726',
                controller: _cardNumberController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20.0),

              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'Expiry Date',
                      hintText: '09/25',
                      controller: _expiryDateController,
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    child: CustomTextField(
                      label: 'CVV',
                      hintText: '699',
                      controller: _cvvController,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32.0),

              Customprimarybutton(
                text: 'Add',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
