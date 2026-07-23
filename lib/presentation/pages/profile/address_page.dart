import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/profile/add_address_page.dart';
import 'package:funica/presentation/widget/profilePage/address/address_card_item.dart';
import 'package:funica/presentation/widget/customAppbarWidget.dart';
import 'package:funica/presentation/widget/customPrimaryButton.dart';

class AddressPage extends StatelessWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: Customappbarwidget(
        title: "Address",
        actions: [],
        backgroundColor: Colors.grey[50]!,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    AddressCardItem(
                      title: 'Home',
                      fullAddress: '61480 Sunbrook Park. PC 5679',
                      isDefault: true,
                      onEditPressed: () {},
                    ),
                    AddressCardItem(
                      title: 'Office',
                      fullAddress: '6993 Meadow Valley Terra. PC 3637',
                      onEditPressed: () {},
                    ),
                    AddressCardItem(
                      title: 'Apartment',
                      fullAddress: '21833 Clyde Gallagher, PC 4662',
                      onEditPressed: () {},
                    ),
                    AddressCardItem(
                      title: "Parent's House",
                      fullAddress: '5259 Blue Bill Park, PC 4627',
                      onEditPressed: () {},
                    ),
                    AddressCardItem(
                      title: 'Town Square',
                      fullAddress: '5375 Summerhouse, PC 4627',
                      onEditPressed: () {},
                    ),
                  ],
                ),
              ),
              Customprimarybutton(
                text: "Add New Address",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const AddAddressPage();
                      },
                    ),
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
