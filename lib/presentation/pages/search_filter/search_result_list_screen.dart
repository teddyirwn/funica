import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/search_filter/sort_filter_bottom_sheet.dart';

class SearchResultListScreen extends StatefulWidget {
  final String keyword;

  const SearchResultListScreen({super.key, this.keyword = 'Chair'});

  @override
  State<SearchResultListScreen> createState() => _SearchResultListScreenState();
}

class _SearchResultListScreenState extends State<SearchResultListScreen> {
  late TextEditingController _searchController;

  // 1. MENGGANTI 'icon' MENJADI NAMA FILE GAMBAR ('image')
  final List<Map<String, dynamic>> _searchResults = [
    {
      'name': 'Rocking Chair',
      'rating': '4.5',
      'sold': '8,374',
      'price': '\$105.00',
      'image': 'search_result_1.png',
      'isFavorite': false,
    },
    {
      'name': 'High Chair',
      'rating': '4.8',
      'sold': '7,483',
      'price': '\$90.00',
      'image': 'search_result_2.png',
      'isFavorite': false,
    },
    {
      'name': 'Office Chair',
      'rating': '4.3',
      'sold': '6,937',
      'price': '\$135.00',
      'image': 'search_result_3.png',
      'isFavorite': false,
    },
    {
      'name': 'Iron Chair',
      'rating': '4.9',
      'sold': '8,174',
      'price': '\$80.00',
      'image': 'search_result_4.png',
      'isFavorite': false,
    },
    {
      'name': 'Vintage Wooden Chair',
      'rating': '4.6',
      'sold': '6,843',
      'price': '\$110.00',
      'image': 'search_result_5.png',
      'isFavorite': false,
    },
    {
      'name': 'Modern Ergonomic Chair',
      'rating': '4.7',
      'sold': '7,758',
      'price': '\$150.00',
      'image': 'search_result_6.png',
      'isFavorite': false,
    },
  ];

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: widget.keyword);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // STATUS BAR MANUAL

            // SEARCH BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                    size: 22,
                  ),
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.tune_rounded,
                      color: Color(0xFF1F1D2B),
                      size: 20,
                    ),
                    onPressed: () {
                      // Memunculkan Modal Bottom Sheet
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) => const SortFilterBottomSheet(),
                      );
                    },
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFAFAFA),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // RESULTS HEADER (TITLE & FOUND COUNT)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Results for "${_searchController.text}"',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F1D2B),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    '12,749 founds',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1D2B),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // PRODUCT GRID (2 KOLOM) - MENGGUNAKAN GAMBAR DINAMIS
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const BouncingScrollPhysics(),
                itemCount: _searchResults.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                itemBuilder: (context, index) {
                  final item = _searchResults[index];
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
                            // 2. TAMPILAN GAMBAR PRODUK DINAMIS
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
