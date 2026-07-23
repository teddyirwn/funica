import 'package:flutter/material.dart';

class SortFilterBottomSheet extends StatefulWidget {
  const SortFilterBottomSheet({super.key});

  @override
  State<SortFilterBottomSheet> createState() => _SortFilterBottomSheetState();
}

class _SortFilterBottomSheetState extends State<SortFilterBottomSheet> {
  int _selectedCategory = 2; // Default Chair
  RangeValues _priceRange = const RangeValues(20, 140);
  int _selectedSortBy = 1; // Default Most Recent
  int _selectedRating = 2; // Default Star 4

  final List<String> _categories = ['All', 'Sofa', 'Chair', 'Table', 'Kitchen'];
  final List<String> _sortByOptions = ['Popular', 'Most Recent', 'Price High', 'Price Low'];
  final List<String> _ratingOptions = ['All', '5', '4', '3', '2'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // INDIKATOR DRAG BARS
          Center(
            child: Container(
              width: 38,
              height: 3,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // JUDUL MODAL
          const Center(
            child: Text(
              'Sort & Filter',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1D2B),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Divider(color: Color(0xFFEEEEEE), thickness: 1),
          const SizedBox(height: 16),

          // 1. CATEGORIES
          const Text(
            'Categories',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F1D2B),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 38,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              itemBuilder: (context, index) {
                final isSelected = index == _selectedCategory;
                return _buildFilterChip(
                  label: _categories[index],
                  isSelected: isSelected,
                  onTap: () => setState(() => _selectedCategory = index),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // 2. PRICE RANGE
          const Text(
            'Price Range',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F1D2B),
            ),
          ),
          const SizedBox(height: 12),
          RangeSlider(
            values: _priceRange,
            min: 0,
            max: 200,
            activeColor: const Color(0xFF1F1D2B),
            inactiveColor: const Color(0xFFEEEEEE),
            onChanged: (RangeValues values) {
              setState(() {
                _priceRange = values;
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${_priceRange.start.round()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xFF1F1D2B),
                  ),
                ),
                Text(
                  '\$${_priceRange.end.round()}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Color(0xFF1F1D2B),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // 3. SORT BY
          const Text(
            'Sort by',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F1D2B),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 38,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _sortByOptions.length,
              itemBuilder: (context, index) {
                final isSelected = index == _selectedSortBy;
                return _buildFilterChip(
                  label: _sortByOptions[index],
                  isSelected: isSelected,
                  onTap: () => setState(() => _selectedSortBy = index),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // 4. RATING
          const Text(
            'Rating',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F1D2B),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 38,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _ratingOptions.length,
              itemBuilder: (context, index) {
                final isSelected = index == _selectedRating;
                final label = _ratingOptions[index] == 'All'
                    ? 'All'
                    : '★ ${_ratingOptions[index]}';
                return _buildFilterChip(
                  label: label,
                  isSelected: isSelected,
                  onTap: () => setState(() => _selectedRating = index),
                );
              },
            ),
          ),
          const SizedBox(height: 24),

          // 5. TOMBOL RESET & APPLY
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedCategory = 0;
                        _priceRange = const RangeValues(20, 140);
                        _selectedSortBy = 0;
                        _selectedRating = 0;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEBEBEB),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                    ),
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        color: Color(0xFF1F1D2B),
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
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
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1F1D2B) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFF1F1D2B),
            width: 1.5,
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : const Color(0xFF1F1D2B),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}