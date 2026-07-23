import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/search_filter/search_not_found_screen.dart';
import 'package:funica/presentation/pages/search_filter/search_result_list_screen.dart';
import 'package:funica/presentation/pages/search_filter/sort_filter_bottom_sheet.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  List<String> _recentSearches = [
    'Plastic Chair',
    'Marble Flower Vase',
    'Bedroom Lamp',
    'Wooden Chairs',
    'Kitchen Tools',
    'Glass Package',
    'Foam Padded Chair',
    'Small Bookcase',
  ];

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: TextField(
                controller: _searchController,
                autofocus: true,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15),
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
                        isScrollControlled:
                            true, // Agar tinggi modal bisa menyesuaikan konten
                        backgroundColor: Colors
                            .transparent, // Background transparan agar sudut melengkung terlihat
                        builder: (context) => const SortFilterBottomSheet(),
                      );
                    },
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFAFAFA),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF1F1D2B),
                      width: 1.5,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    // Contoh logika: jika mengandung kata "chair" -> arahkan ke SearchResultListScreen
                    if (value.toLowerCase().contains('chair')) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchResultListScreen(keyword: value),
                        ),
                      );
                    } else {
                      // Jika kata kunci lain -> arahkan ke SearchNotFoundScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SearchNotFoundScreen(keyword: value),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1D2B),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _recentSearches.clear();
                      });
                    },
                    child: const Text(
                      'Clear All',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F1D2B),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(color: Color(0xFFEEEEEE), thickness: 1),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const BouncingScrollPhysics(),
                itemCount: _recentSearches.length,
                itemBuilder: (context, index) {
                  final item = _recentSearches[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _recentSearches.removeAt(index);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.grey[400]!,
                                width: 1.5,
                              ),
                            ),
                            child: Icon(
                              Icons.close_rounded,
                              size: 14,
                              color: Colors.grey[500],
                            ),
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
