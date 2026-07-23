import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:funica/presentation/widget/customAppbarWidget.dart';
import 'package:funica/presentation/widget/help_center/chat_bubble_widget.dart';

class CustomerServicePage extends StatefulWidget {
  const CustomerServicePage({super.key});

  @override
  State<CustomerServicePage> createState() => _CustomerServicePageState();
}

class _CustomerServicePageState extends State<CustomerServicePage> {
  final TextEditingController _messageController = TextEditingController();

  final List<Map<String, dynamic>> _messages = [
    {'message': 'Hi, good morning 👋', 'time': '10:00 AM', 'isSender': false},
    {
      'message':
          'I am a Customer Service, is there anything I can help you with? 😄',
      'time': '10:01 AM',
      'isSender': false,
    },
    {
      'message': 'I have a problem with my payment.',
      'time': '10:01 AM',
      'isSender': true,
    },
    {
      'message': 'Can you help me solution?',
      'time': '10:01 AM',
      'isSender': true,
    },
    {
      'message':
          'Hi, good morning! Sure, don\'t worry. I am here to help you solve it.',
      'time': '10:02 AM',
      'isSender': false,
    },
    {
      'message': 'What is your problem with payment?',
      'time': '10:02 AM',
      'isSender': false,
    },
  ];

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;

    setState(() {
      _messages.add({
        'message': _messageController.text.trim(),
        'time': '10:05 AM',
        'isSender': true,
      });
    });

    _messageController.clear();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Customappbarwidget(
        title: 'Customer Service',
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/Call.svg"),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/Group.svg"),
          ),

          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 8.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              "Today",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 12.0,
              ),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final chat = _messages[index];
                return ChatBubbleWidget(
                  message: chat['message'],
                  time: chat['time'],
                  isSender: chat['isSender'],
                );
              },
            ),
          ),

          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),

            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _messageController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 24.0,
                                ),
                                hintText: 'Message...',
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              "assets/icons/image.svg",
                              color: Colors.grey.shade400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8.0),

                  GestureDetector(
                    onTap: _sendMessage,
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.black,
                      child: SvgPicture.asset(
                        "assets/icons/Voice.svg",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
