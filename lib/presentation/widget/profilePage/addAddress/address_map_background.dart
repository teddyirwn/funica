import 'package:flutter/material.dart';
import 'custom_triangle_clipper.dart';

class AddressMapBackground extends StatelessWidget {
  final String mapImagePath;
  final String userImagePath;

  const AddressMapBackground({
    super.key,
    required this.mapImagePath,
    required this.userImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Image.asset(
              mapImagePath,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.15,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(userImagePath),
                  ),
                ),
                ClipPath(
                  clipper: TriangleClipper(),
                  child: Container(color: Colors.black, width: 12, height: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
