import 'package:flutter/material.dart';

class ChooseShippingScreen extends StatefulWidget {
  const ChooseShippingScreen({super.key});

  @override
  State<ChooseShippingScreen> createState() => _ChooseShippingScreenState();
}

class _ChooseShippingScreenState extends State<ChooseShippingScreen> {
  int _selectedShippingIndex = 1; // Default Regular selected

  final List<Map<String, dynamic>> _shippingOptions = [
    {
      'title': 'Economy',
      'arrival': 'Estimated Arrival, Dec 20-23',
      'price': 10.00,
      'icon': Icons.local_shipping_rounded,
    },
    {
      'title': 'Regular',
      'arrival': 'Estimated Arrival, Dec 20-22',
      'price': 15.00,
      'icon': Icons.local_shipping_rounded,
    },
    {
      'title': 'Cargo',
      'arrival': 'Estimated Arrival, Dec 19-20',
      'price': 20.00,
      'icon': Icons.local_shipping_rounded,
    },
    {
      'title': 'Express',
      'arrival': 'Estimated Arrival, Dec 18-19',
      'price': 30.00,
      'icon': Icons.local_shipping_rounded,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // STATUS BAR MANUAL

            // HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF1F1D2B),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'Choose Shipping',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1D2B),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // SHIPPING OPTIONS LIST
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const BouncingScrollPhysics(),
                itemCount: _shippingOptions.length,
                itemBuilder: (context, index) {
                  final ship = _shippingOptions[index];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedShippingIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1F1D2B),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              ship['icon'] as IconData,
                              color: Colors.white,
                              size: 22,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ship['title'] as String,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1F1D2B),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  ship['arrival'] as String,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            '\$${(ship['price'] as double).toStringAsFixed(0)}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F1D2B),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Radio<int>(
                            value: index,
                            groupValue: _selectedShippingIndex,
                            activeColor: const Color(0xFF1F1D2B),
                            onChanged: (val) {
                              setState(() {
                                _selectedShippingIndex = val!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // APPLY BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                      context,
                      _shippingOptions[_selectedShippingIndex],
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1F1D2B),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26),
                    ),
                  ),
                  child: const Text(
                    'Apply',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
