import 'package:flutter/material.dart';
import 'package:funica/presentation/widget/customAppbarWidget.dart';
import 'package:funica/presentation/widget/profilePage/friend_tile_widget.dart';

class InviteFriendsPage extends StatefulWidget {
  const InviteFriendsPage({super.key});

  @override
  State<InviteFriendsPage> createState() => _InviteFriendsPageState();
}

class _InviteFriendsPageState extends State<InviteFriendsPage> {
  // Model data dummy teman
  final List<Map<String, dynamic>> _friendsList = [
    {
      'id': '1',
      'name': 'Tynisha Obey',
      'phone': '+1-300-555-0135',
      'avatar': 'assets/images/userProfile/user1.png',
      'isInvited': false,
    },
    {
      'id': '2',
      'name': 'Florencio Dorrance',
      'phone': '+1-202-555-0167',
      'avatar': 'assets/images/userProfile/user2.png',
      'isInvited': true,
    },
    {
      'id': '3',
      'name': 'Chantal Shelburne',
      'phone': '+1-300-555-0119',
      'avatar': 'assets/images/userProfile/user3.png',
      'isInvited': false,
    },
    {
      'id': '4',
      'name': 'Maryland Winkles',
      'phone': '+1-300-555-0161',
      'avatar': 'assets/images/userProfile/user4.png',
      'isInvited': false,
    },
    {
      'id': '5',
      'name': 'Rodolfo Goode',
      'phone': '+1-300-555-0136',
      'avatar': 'assets/images/userProfile/user5.png',
      'isInvited': true,
    },
    {
      'id': '6',
      'name': 'Benny Spanbauer',
      'phone': '+1-202-555-0172',
      'avatar': 'assets/images/userProfile/user6.png',
      'isInvited': false,
    },
    {
      'id': '7',
      'name': 'Tyra Dhillon',
      'phone': '+1-202-555-0118',
      'avatar': 'assets/images/userProfile/user7.png',
      'isInvited': false,
    },
    {
      'id': '8',
      'name': 'Jammie Charbonneau',
      'phone': '+1-300-555-0128',
      'avatar': 'assets/images/userProfile/user8.png',
      'isInvited': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Customappbarwidget(title: "Invite Friends"),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        itemCount: _friendsList.length,
        itemBuilder: (context, index) {
          final friend = _friendsList[index];

          return FriendTileWidget(
            name: friend['name'],
            phoneNumber: friend['phone'],
            avatarUrl: friend['avatar'],
            isInvited: friend['isInvited'],
            onInviteTap: () {
              setState(() {
                // Toggle status invite
                _friendsList[index]['isInvited'] =
                    !_friendsList[index]['isInvited'];
              });
            },
          );
        },
      ),
    );
  }
}
