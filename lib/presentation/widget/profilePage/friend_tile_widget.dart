import 'package:flutter/material.dart';

class FriendTileWidget extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final String avatarUrl;
  final bool isInvited;
  final VoidCallback onInviteTap;

  const FriendTileWidget({
    super.key,
    required this.name,
    required this.phoneNumber,
    required this.avatarUrl,
    required this.isInvited,
    required this.onInviteTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: AssetImage(avatarUrl),
          ),
          const SizedBox(width: 16.0),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  phoneNumber,
                  style: TextStyle(fontSize: 14.0, color: Colors.grey.shade600),
                ),
              ],
            ),
          ),

          SizedBox(
            width: 84,
            height: 36,
            child: ElevatedButton(
              onPressed: onInviteTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: isInvited ? Colors.white : Colors.black,
                elevation: 0,
                side: BorderSide(color: Colors.black, width: 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding: EdgeInsets.zero,
              ),
              child: Text(
                isInvited ? 'Invited' : 'Invite',
                style: TextStyle(
                  color: isInvited ? Colors.black : Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
