import 'package:flutter/material.dart';
import 'lamp_details_screen.dart';

class LampCategoryScreen extends StatefulWidget {
  const LampCategoryScreen({super.key});

  @override
  State<LampCategoryScreen> createState() => _LampCategoryScreenState();
}

class _LampCategoryScreenState extends State<LampCategoryScreen> {
  // LIST PRODUK LAMP DENGAN NAMA FILE GAMBAR DINAMIS
  final List<Map<String, dynamic>> _lampProducts = [
    {
      'name': 'Parabolic Reflector',
      'rating': '4.8',
      'sold': '7,884',
      'price': '\$85.00',
      'image': 'lamp_1.png',
      'isFavorite': false,
    },
    {
      'name': 'Mirrorred Reflector',
      'rating': '4.9',
      'sold': '8,463',
      'price': '\$90.00',
      'image': 'lamp_2.png',
      'isFavorite': false,
    },
    {
      'name': 'Parabolic Iron Lamp',
      'rating': '5.0',
      'sold': '6,482',
      'price': '\$75.00',
      'image': 'lamp_3.png',
      'isFavorite': false,
    },
    {
      'name': 'Parabolic Lamp',
      'rating': '4.9',
      'sold': '7,692',
      'price': '\$55.00',
      'image': 'lamp_4.png',
      'isFavorite': false,
    },
    {
      'name': 'Bronze Dome Lamp',
      'rating': '4.7',
      'sold': '5,310',
      'price': '\$110.00',
      'image': 'lamp_5.png',
      'isFavorite': false,
    },
    {
      'name': 'Geometric Cage Lamp',
      'rating': '4.8',
      'sold': '9,120',
      'price': '\$95.00',
      'image': 'lamp_6.png',
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

            // HEADER (BACK, TITLE, SEARCH)
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
                      'Lamp',
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
            const SizedBox(height: 8),

            // PRODUCT GRID (2 KOLOM)
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const BouncingScrollPhysics(),
                itemCount: _lampProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final item = _lampProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LampDetailsScreen(
                            productName: item['name'] as String,
                            productImage:
                                item['image']
                                    as String, // 👈 MENGIRIM NAMA GAMBAR KE DETAILS SCREEN
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
                              // TAMPILAN GAMBAR PRODUK
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
                                      item['isFavorite'] =
                                          !(item['isFavorite'] as bool);
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
