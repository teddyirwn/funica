import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/search_filter/sort_filter_bottom_sheet.dart';

class SearchNotFoundScreen extends StatefulWidget {
  final String keyword;

  const SearchNotFoundScreen({super.key, this.keyword = 'Abcdefghijk'});

  @override
  State<SearchNotFoundScreen> createState() => _SearchNotFoundScreenState();
}

class _SearchNotFoundScreenState extends State<SearchNotFoundScreen> {
  late TextEditingController _searchController;

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
                    '0 found',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1F1D2B),
                    ),
                  ),
                ],
              ),
            ),

            // EMPTY STATE (ILUSTRASI & PESAN NOT FOUND)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ILUSTRASI CLIPBOARD KOSONG
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // CLIPBOARD BELAKANG
                          Transform.rotate(
                            angle: -0.15,
                            child: Container(
                              width: 130,
                              height: 160,
                              decoration: BoxDecoration(
                                color: const Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: const Color(0xFFE0E0E0),
                                  width: 2,
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  width: 40,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1F1D2B),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // CLIPBOARD DEPAN
                          Container(
                            width: 140,
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFE0E0E0),
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.03),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 8),
                                    width: 45,
                                    height: 16,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF1F1D2B),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    width: 105,
                                    height: 110,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFEBEBEB),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // TEKS JUDUL
                    const Text(
                      'Not Found',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F1D2B),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // DESKRIPSI
                    Text(
                      'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
