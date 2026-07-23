import 'package:flutter/material.dart';

class PrivacySectionWidget extends StatelessWidget {
  final String title;
  final String content;

  const PrivacySectionWidget({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 12.0),
        Text(
          content,
          style: TextStyle(
            fontSize: 14.0,
            height: 1.6,
            color: Colors.grey.shade800,
          ),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 24.0),
      ],
    );
  }
}
