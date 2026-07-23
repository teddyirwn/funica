import 'package:flutter/material.dart';

class ReceiptPopupMenu extends StatelessWidget {
  const ReceiptPopupMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share'),
            onTap: () {
              // Handle share action
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.print),
            title: Text('Print'),
            onTap: () {
              // Handle print action
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete'),
            onTap: () {
              // Handle delete action
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
