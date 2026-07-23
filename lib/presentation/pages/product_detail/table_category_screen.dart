import 'package:flutter/material.dart';
import 'table_details_screen.dart';

class TableCategoryScreen extends StatefulWidget {
  const TableCategoryScreen({super.key});

  @override
  State<TableCategoryScreen> createState() => _TableCategoryScreenState();
}

class _TableCategoryScreenState extends State<TableCategoryScreen> {
  // LIST PRODUK TABLE DENGAN NAMA FILE GAMBAR DINAMIS
  final List<Map<String, dynamic>> _tableProducts = [
    {
      'name': 'Mini Wooden Table',
      'rating': '4.6',
      'sold': '8,477',
      'price': '\$55.00',
      'image': 'table_1.png',
      'isFavorite': false,
    },
    {
      'name': 'Table + Chair',
      'rating': '4.9',
      'sold': '9,373',
      'price': '\$90.00',
      'image': 'table_2.png',
      'isFavorite': false,
    },
    {
      'name': 'Table + Chair',
      'rating': '4.5',
      'sold': '6,195',
      'price': '\$165.00',
      'image': 'table_3.png',
      'isFavorite': false,
    },
    {
      'name': 'Table + 2 Chairs',
      'rating': '4.2',
      'sold': '5,668',
      'price': '\$150.00',
      'image': 'table_4.png',
      'isFavorite': false,
    },
    {
      'name': 'Modern Office Desk',
      'rating': '4.8',
      'sold': '7,210',
      'price': '\$185.00',
      'image': 'table_5.png',
      'isFavorite': false,
    },
    {
      'name': 'Round Wooden Stool Table',
      'rating': '4.4',
      'sold': '6,120',
      'price': '\$70.00',
      'image': 'table_6.png',
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
                      'Table',
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
                itemCount: _tableProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final item = _tableProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TableDetailsScreen(
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
