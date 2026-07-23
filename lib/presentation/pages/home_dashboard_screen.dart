import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/home_action_menu/most_populer_screen.dart';
import 'package:funica/presentation/pages/home_action_menu/notification_screen.dart';
import 'package:funica/presentation/pages/home_action_menu/special_offers_screen.dart';
import 'package:funica/presentation/pages/home_action_menu/wishlist_screen.dart';
import 'package:funica/presentation/pages/product_detail/chair_category_screen.dart';
import 'package:funica/presentation/pages/product_detail/cupboard_category_screen.dart';
import 'package:funica/presentation/pages/product_detail/kitchen_category_screen.dart';
import 'package:funica/presentation/pages/product_detail/lamp_category_screen.dart';
import 'package:funica/presentation/pages/product_detail/sofa_category_screen.dart';
import 'package:funica/presentation/pages/product_detail/table_category_screen.dart';
import 'package:funica/presentation/pages/product_detail/vases_category_screen.dart';
import 'package:funica/presentation/pages/search_filter/search_page.dart';
import 'package:funica/presentation/widget/bottom_navigation_bar.dart';

class HomeDashboardScreen extends StatefulWidget {
  const HomeDashboardScreen({super.key});

  @override
  State<HomeDashboardScreen> createState() => _HomeDashboardScreenState();
}

class _HomeDashboardScreenState extends State<HomeDashboardScreen> {
  int _selectedCategoryChipIndex = 0;

  final List<String> _categoryChips = [
    'All',
    'Sofa',
    'Chair',
    'Table',
    'Kitchen',
    'Lamp',
  ];

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Sofa', 'icon': Icons.chair_rounded},
    {'name': 'Chair', 'icon': Icons.chair_alt_rounded},
    {'name': 'Table', 'icon': Icons.table_restaurant_rounded},
    {'name': 'Kitchen', 'icon': Icons.kitchen_rounded},
    {'name': 'Lamp', 'icon': Icons.light_rounded},
    {'name': 'Cupboard', 'icon': Icons.door_sliding_rounded},
    {'name': 'Vase', 'icon': Icons.local_florist_rounded},
    {'name': 'Others', 'icon': Icons.more_horiz_rounded},
  ];

  final List<Map<String, dynamic>> _products = [
    {
      'name': 'Foam Padded Chair',
      'rating': '4.5',
      'sold': '8,374',
      'price': '\$120.00',
      'image': 'home_1.png',
      'isFavorite': false,
    },
    {
      'name': 'Small Bookcase',
      'rating': '4.7',
      'sold': '7,483',
      'price': '\$145.00',
      'image': 'home_2.png',
      'isFavorite': false,
    },
    {
      'name': 'Glass Lamp',
      'rating': '4.3',
      'sold': '6,937',
      'price': '\$40.00',
      'image': 'home_3.png',
      'isFavorite': false,
    },
    {
      'name': 'Glass Package',
      'rating': '4.9',
      'sold': '8,174',
      'price': '\$55.00',
      'image': 'home_4.png',
      'isFavorite': false,
    },
    {
      'name': 'Plastic Chair',
      'rating': '4.6',
      'sold': '6,843',
      'price': '\$65.00',
      'image': 'home_5.png',
      'isFavorite': false,
    },
    {
      'name': 'Wooden Chairs',
      'rating': '4.5',
      'sold': '7,758',
      'price': '\$60.00',
      'image': 'home_6.png',
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
                      const Icon(
                        Icons.signal_cellular_alt,
                        size: 18,
                        color: Colors.black,
                      ),
                      const SizedBox(width: 5),
                      const Icon(Icons.wifi, size: 18, color: Colors.black),
                      const SizedBox(width: 5),
                      Transform.rotate(
                        angle: math.pi / 2,
                        child: const Icon(
                          Icons.battery_full,
                          size: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ISI KONTEN SCROLLABLE
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),

                    // 1. HEADER PROFILE & NOTIFICATION
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundColor: Color(0xFFF3F3F3),
                          backgroundImage: AssetImage(
                            'assets/images/pp_home.png',
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Good Morning ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  Text('👋', style: TextStyle(fontSize: 14)),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                'Andrew Ainsley',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1F1D2B),
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.notifications_none_rounded,
                            size: 26,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const NotificationScreen(),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.favorite_border_rounded,
                            size: 26,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WishlistScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // 2. SEARCH BAR
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchPage(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.search_rounded,
                              color: Colors.grey,
                              size: 22,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                'Search',
                                style: TextStyle(
                                  color: Colors.grey[400],
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.tune_rounded,
                              color: Color(0xFF1F1D2B),
                              size: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 3. SPECIAL OFFERS SECTION
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Special Offers',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F1D2B),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SpecialOffersScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F1D2B),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // SPECIAL OFFERS BANNER CARD (GAMBAR DINAMIS + DOTS)
                    Container(
                      width: double.infinity,
                      height: 165,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEBEBEB),
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      '25%',
                                      style: TextStyle(
                                        fontSize: 32,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1F1D2B),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    const Text(
                                      "Today's Special!",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1F1D2B),
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'Get discount for every\norder, only valid for today',
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey[700],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/images/special_offer.png', // 👈 FILE GAMBAR KURSI UNTUK SPECIAL OFFER
                                height: 130,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            child: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1F1D2B),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 4. CATEGORY GRID (8 ITEM)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.8,
                          ),
                      itemBuilder: (context, index) {
                        final item = _categories[index];
                        return GestureDetector(
                          onTap: () {
                            if (item['name'] == 'Sofa') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const SofaCategoryScreen(),
                                ),
                              );
                            }
                            if (item['name'] == 'Chair') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const ChairCategoryScreen(),
                                ),
                              );
                            }
                            if (item['name'] == 'Table') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TableCategoryScreen(),
                                ),
                              );
                            }
                            if (item['name'] == 'Kitchen') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const KitchenCategoryScreen(),
                                ),
                              );
                            }
                            if (item['name'] == 'Lamp') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LampCategoryScreen(),
                                ),
                              );
                            }
                            if (item['name'] == 'Cupboard') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const CupboardCategoryScreen(),
                                ),
                              );
                            }
                            if (item['name'] == 'Vase') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const VaseCategoryScreen(),
                                ),
                              );
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFAFAFA),
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  item['icon'] as IconData,
                                  color: const Color(0xFF1F1D2B),
                                  size: 26,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item['name'] as String,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1F1D2B),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 24),

                    // 5. MOST POPULAR SECTION
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Most Popular',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1F1D2B),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const MostPopularScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'See All',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F1D2B),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // HORIZONTAL CATEGORY CHIPS
                    SizedBox(
                      height: 38,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _categoryChips.length,
                        itemBuilder: (context, index) {
                          final isSelected =
                              index == _selectedCategoryChipIndex;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedCategoryChipIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
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
                                  _categoryChips[index],
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

                    // PRODUCT GRID (2 KOLOM)
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.68,
                          ),
                      itemBuilder: (context, index) {
                        final product = _products[index];
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
                                  Center(
                                    child: Image.asset(
                                      'assets/images/${product['image']}',
                                      fit: BoxFit.contain,
                                      errorBuilder:
                                          (context, error, stackTrace) {
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
                                          product['isFavorite'] =
                                              !(product['isFavorite'] as bool);
                                        });
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF1F1D2B),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          (product['isFavorite'] as bool)
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
                              product['name'] as String,
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
                                  product['rating'] as String,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF1F1D2B),
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Text(
                                  '|   ${product['sold']} sold',
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
                              product['price'] as String,
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
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // 6. BOTTOM NAVIGATION BAR
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 0),
    );
  }
}
