import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'vases_details_screen.dart';

class VaseCategoryScreen extends StatefulWidget {
  const VaseCategoryScreen({super.key});

  @override
  State<VaseCategoryScreen> createState() => _VaseCategoryScreenState();
}

class _VaseCategoryScreenState extends State<VaseCategoryScreen> {
  // LIST PRODUK VASE DENGAN NAMA FILE GAMBAR DINAMIS
  final List<Map<String, dynamic>> _vaseProducts = [
    {
      'name': 'Marble Flower Vase',
      'rating': '4.7',
      'sold': '8,563',
      'price': '\$85.00',
      'image': 'vases_1.png',
      'isFavorite': false,
    },
    {
      'name': 'Teak Flower Vase',
      'rating': '3.5',
      'sold': '9,451',
      'price': '\$60.00',
      'image': 'vases_2.png',
      'isFavorite': false,
    },
    {
      'name': 'Pottery Flower Vase',
      'rating': '5.0',
      'sold': '6,712',
      'price': '\$70.00',
      'image': 'vases_3.png',
      'isFavorite': false,
    },
    {
      'name': 'Line Flower Vase',
      'rating': '4.6',
      'sold': '6,331',
      'price': '\$75.00',
      'image': 'vases_4.png',
      'isFavorite': false,
    },
    {
      'name': 'Red Glass Vase',
      'rating': '4.8',
      'sold': '5,120',
      'price': '\$90.00',
      'image': 'vases_5.png',
      'isFavorite': false,
    },
    {
      'name': 'Minimalist Clay Pot',
      'rating': '4.5',
      'sold': '7,890',
      'price': '\$50.00',
      'image': 'vases_6.png',
      'isFavorite': false,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '9:41',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.signal_cellular_alt, size: 18, color: Colors.black),
                      const SizedBox(width: 5),
                      const Icon(Icons.wifi, size: 18, color: Colors.black),
                      const SizedBox(width: 5),
                      Transform.rotate(
                        angle: math.pi / 2,
                        child: const Icon(Icons.battery_full, size: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // HEADER (BACK, TITLE, SEARCH)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Color(0xFF1F1D2B)),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 4),
                  const Expanded(
                    child: Text(
                      'Vase',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F1D2B),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search_rounded, color: Color(0xFF1F1D2B)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // PRODUCT GRID (2 KOLOM)
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const BouncingScrollPhysics(),
                itemCount: _vaseProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final item = _vaseProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VaseDetailsScreen(
                            productName: item['name'] as String,
                            productImage: item['image'] as String, // 👈 MENGIRIM NAMA GAMBAR KE DETAILS SCREEN
                            initialPrice: double.parse(
                              (item['price'] as String).replaceAll('\$', ''),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Column(
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
                              // TAMPILAN GAMBAR PRODUK DINAMIS
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
                                      item['isFavorite'] = !(item['isFavorite'] as bool);
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: const BoxDecoration(
                                      color: Color(0xFF1F1D2B),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      (item['isFavorite'] as bool)
                                          ? Icons.favorite_rounded
                                          : Icons.favorite_border_rounded,
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
                            const Icon(Icons.star_rounded, size: 16, color: Color(0xFF1F1D2B)),
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
                    ),
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