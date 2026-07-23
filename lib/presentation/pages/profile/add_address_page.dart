import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funica/presentation/widget/customAppbarWidget.dart';
import 'package:funica/presentation/widget/profilePage/addAddress/address_form_bottom_sheet.dart';
import 'package:funica/presentation/widget/profilePage/addAddress/address_map_background.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  bool isDefaultAddress = false;
  final TextEditingController nameAddressController = TextEditingController(
    text: "Apartment",
  );
  final TextEditingController addressDetailsController = TextEditingController(
    text: "2899 Summer Drive Taylor, PC 48180",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Customappbarwidget(
        title: 'Add New Address',
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/Group.svg"),
          ),
        ],
      ),
      body: Stack(
        children: [
          const AddressMapBackground(
            mapImagePath: 'assets/images/maps.png',
            userImagePath: 'assets/images/user.png',
          ),

          AddressFormBottomSheet(
            isDefaultAddress: isDefaultAddress,
            onDefaultChanged: (value) {
              setState(() {
                isDefaultAddress = value ?? false;
              });
            },
            onAddPressed: () {},
          ),
        ],
      ),
    );
  }
}
