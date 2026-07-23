import 'dart:math' as math;
import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  int _selectedCategoryIndex = 0;

  final List<String> _categories = [
    'All',
    'Sofa',
    'Chair',
    'Table',
    'Kitchen',
    'Lamp',
  ];

  // 1. MENGGANTI 'icon' MENJADI NAMA FILE GAMBAR ('image')
  final List<Map<String, dynamic>> _wishlistItems = [
    {
      'name': 'Shiny Wooden Chair',
      'rating': '4.6',
      'sold': '6,641',
      'price': '\$115.00',
      'image': 'wishlist_1.png',
    },
    {
      'name': 'Bedroom Lamp',
      'rating': '4.8',
      'sold': '7,461',
      'price': '\$40.00',
      'image': 'wishlist_2.png',
    },
    {
      'name': 'Marble Flower Vase',
      'rating': '4.8',
      'sold': '6,378',
      'price': '\$90.00',
      'image': 'wishlist_3.png',
    },
    {
      'name': 'Knife Package',
      'rating': '4.5',
      'sold': '5,372',
      'price': '\$125.00',
      'image': 'wishlist_4.png',
    },
    {
      'name': 'Plastic Chair',
      'rating': '4.6',
      'sold': '6,843',
      'price': '\$65.00',
      'image': 'wishlist_5.png',
    },
    {
      'name': 'Wooden Chairs',
      'rating': '4.5',
      'sold': '7,758',
      'price': '\$60.00',
      'image': 'wishlist_6.png',
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

            // HEADER (Back, Title, Search Icon)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF1F1D2B),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(width: 4),
                  const Expanded(
                    child: Text(
                      'My Wishlist',
                      style: TextStyle(
                        fontSize: 22,
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

            // HORIZONTAL CATEGORIES
            const SizedBox(height: 8),
            SizedBox(
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: _categories.length,
                itemBuilder: (context, index) {
                  final isSelected = index == _selectedCategoryIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategoryIndex = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF1F1D2B)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF1F1D2B),
                          width: 1.5,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          _categories[index],
                          style: TextStyle(
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF1F1D2B),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // PRODUCT GRID (2 KOLOM) - MENGGUNAKAN GAMBAR DINAMIS
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const BouncingScrollPhysics(),
                itemCount: _wishlistItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final item = _wishlistItems[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 160,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            // 2. TAMPILAN GAMBAR PRODUK WISHLIST DINAMIS
                            Center(
                              child: Image.asset(
                                'assets/images/${item['image']}',
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.image_not_supported_rounded,
                                    color: Colors.grey,
                                    size: 40,
                                  );
                                },
                              ),
                            ),
                            Positioned(
                              top: 4,
                              right: 4,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _wishlistItems.removeAt(index);
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: const BoxDecoration(
                                    color: Color(0xFF1F1D2B),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.favorite_rounded,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item['name'] as String,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F1D2B),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            size: 16,
                            color: Color(0xFF1F1D2B),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            item['rating'] as String,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F1D2B),
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '|   ${item['sold']} sold',
                            style: TextStyle(
                              fontSize: 10,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        item['price'] as String,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F1D2B),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
