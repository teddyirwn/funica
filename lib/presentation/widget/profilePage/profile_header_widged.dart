import 'package:flutter/material.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String imagePath;
  final String name;
  final String phoneNumber;
  final VoidCallback? onEditImagePressed;

  const ProfileHeaderWidget({
    super.key,
    required this.imagePath,
    required this.name,
    required this.phoneNumber,
    this.onEditImagePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            CircleAvatar(radius: 50, backgroundImage: AssetImage(imagePath)),
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: onEditImagePressed,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.edit, size: 14, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          name,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          phoneNumber,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
