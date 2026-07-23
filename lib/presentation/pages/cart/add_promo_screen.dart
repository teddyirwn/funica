import 'package:flutter/material.dart';

class AddPromoScreen extends StatefulWidget {
  const AddPromoScreen({super.key});

  @override
  State<AddPromoScreen> createState() => _AddPromoScreenState();
}

class _AddPromoScreenState extends State<AddPromoScreen> {
  int _selectedPromoIndex = 1; // Default discount 30% selected

  final List<Map<String, dynamic>> _promoList = [
    {
      'title': 'Special 25% Off',
      'subtitle': 'Special promo only today!',
      'discountPercent': 25,
    },
    {
      'title': 'Discount 30% Off',
      'subtitle': 'New user special promo',
      'discountPercent': 30,
    },
    {
      'title': 'Special 20% Off',
      'subtitle': 'Special promo only today!',
      'discountPercent': 20,
    },
    {
      'title': 'Discount 40% Off',
      'subtitle': 'Special promo only valid today',
      'discountPercent': 40,
    },
    {
      'title': 'Discount 35% Off',
      'subtitle': 'Special promo only today!',
      'discountPercent': 35,
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

            // HEADER (BACK BUTTON, TITLE, SEARCH)
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
                  const Expanded(
                    child: Text(
                      'Add Promo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F1D2B),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.search_rounded,
                      color: Color(0xFF1F1D2B),
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // PROMO LIST
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const BouncingScrollPhysics(),
                itemCount: _promoList.length,
                itemBuilder: (context, index) {
                  final promo = _promoList[index];

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPromoIndex = index;
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
                            child: const Icon(
                              Icons.confirmation_number_rounded,
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
                                  promo['title'] as String,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1F1D2B),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  promo['subtitle'] as String,
                                  style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Radio<int>(
                            value: index,
                            groupValue: _selectedPromoIndex,
                            activeColor: const Color(0xFF1F1D2B),
                            onChanged: (val) {
                              setState(() {
                                _selectedPromoIndex = val!;
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
                    Navigator.pop(context, _promoList[_selectedPromoIndex]);
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
