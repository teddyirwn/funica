import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/product_detail/sofa_details_screen.dart';


class SofaCategoryScreen extends StatefulWidget {
  const SofaCategoryScreen({super.key});

  @override
  State<SofaCategoryScreen> createState() => _SofaCategoryScreenState();
}

class _SofaCategoryScreenState extends State<SofaCategoryScreen> {
  // LIST PRODUK SOFA DENGAN GAMBAR DINAMIS
  final List<Map<String, dynamic>> _sofaProducts = [
    {
      'name': 'Modern Chesterfield',
      'rating': '4.8',
      'sold': '8,120',
      'price': '\$280.00',
      'image': 'sofa_1.png',
      'isFavorite': false,
    },
    {
      'name': 'Minimalist Fabric Sofa',
      'rating': '4.9',
      'sold': '9,430',
      'price': '\$250.00',
      'image': 'sofa_2.png',
      'isFavorite': false,
    },
    {
      'name': 'Velvet Accent Sofa',
      'rating': '4.6',
      'sold': '6,150',
      'price': '\$310.00',
      'image': 'sofa_3.png',
      'isFavorite': false,
    },
    {
      'name': 'Sectional Leather Sofa',
      'rating': '4.7',
      'sold': '7,890',
      'price': '\$420.00',
      'image': 'sofa_4.png',
      'isFavorite': false,
    },
    {
      'name': 'Scandinavian Two-Seater',
      'rating': '4.5',
      'sold': '5,620',
      'price': '\$210.00',
      'image': 'sofa_5.png',
      'isFavorite': false,
    },
    {
      'name': 'Luxury Recliner Sofa',
      'rating': '4.9',
      'sold': '8,900',
      'price': '\$380.00',
      'image': 'sofa_6.png',
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
                      'Sofa',
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
                itemCount: _sofaProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final item = _sofaProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SofaDetailsScreen(
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
                              // MEMANGGIL GAMBAR SOFA SECARA DINAMIS
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