import 'dart:math' as math;
import 'package:flutter/material.dart';

class ViewReviewsScreen extends StatefulWidget {
  final String ratingText;

  const ViewReviewsScreen({super.key, this.ratingText = '4.7 (7,376 reviews)'});

  @override
  State<ViewReviewsScreen> createState() => _ViewReviewsScreenState();
}

class _ViewReviewsScreenState extends State<ViewReviewsScreen> {
  int _selectedRatingFilter = 0;

  final List<String> _ratingFilters = ['All', '5', '4', '3', '2', '1'];

  // 1. TAMBAHKAN PATH FILE GAMBAR PROFIL DI DUMMY DATA
  final List<Map<String, dynamic>> _reviewsList = [
    {
      'name': 'Darlene Robertson',
      'rating': 5,
      'comment':
          'The item is very good, my son likes it very much and watching it every day 💯💯💯',
      'likes': 729,
      'isLiked': true,
      'timeAgo': '6 days ago',
      'image': 'pp_review1.png',
    },
    {
      'name': 'Jane Cooper',
      'rating': 4,
      'comment':
          'The seller is very fast in sending packet. I just bought it and the item arrived in just 1 day! 👍👍',
      'likes': 625,
      'isLiked': false,
      'timeAgo': '6 days ago',
      'image': 'pp_review2.png',
    },
    {
      'name': 'Jenny Wilson',
      'rating': 4,
      'comment':
          'I just bought it and the vase is really good! I highly recommend it! 😄😄',
      'likes': 578,
      'isLiked': true,
      'timeAgo': '6 days ago',
      'image': 'pp_review3.png',
    },
    {
      'name': 'Marvin McKinney',
      'rating': 5,
      'comment':
          'The item is very good, my son likes it very much and watching it every day 💯💯💯',
      'likes': 347,
      'isLiked': false,
      'timeAgo': '6 weeks ago',
      'image': 'pp_review4.png',
    },
    {
      'name': 'Theresa Webb',
      'rating': 4,
      'comment':
          'The seller is very fast in sending packet. I just bought it and the item arrived in just 1 day! 👍👍',
      'likes': 289,
      'isLiked': false,
      'timeAgo': '2 months ago',
      'image': 'pp_review1.png',
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

            // HEADER (BACK BUTTON, TITLE, SEARCH ICON)
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
                  Expanded(
                    child: Text(
                      widget.ratingText,
                      style: const TextStyle(
                        fontSize: 20,
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

            // RATING FILTER CHIPS (HORIZONTAL SCROLL)
            SizedBox(
              height: 38,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: _ratingFilters.length,
                itemBuilder: (context, index) {
                  final isSelected = index == _selectedRatingFilter;
                  final label = _ratingFilters[index] == 'All'
                      ? '★ All'
                      : '★ ${_ratingFilters[index]}';

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedRatingFilter = index;
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
                          label,
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

            // LIST OF REVIEWS
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                physics: const BouncingScrollPhysics(),
                itemCount: _reviewsList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 24),
                itemBuilder: (context, index) {
                  final review = _reviewsList[index];
                  final isLiked = review['isLiked'] as bool;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // USER HEADER (AVATAR, NAME, RATING BADGE, MORE ICON)
                      Row(
                        children: [
                          // 2. MENGGUNAKAN backgroundImage DENGAN AssetImage & ERROR HANDLER
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: const Color(0xFFF3F3F3),
                            backgroundImage: AssetImage(
                              'assets/images/${review['image']}',
                            ),
                            onBackgroundImageError: (exception, stackTrace) {
                              // Tampilan fallback jika gambar gagal dimuat
                            },
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              review['name'] as String,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1F1D2B),
                              ),
                            ),
                          ),
                          // BADGE RATING ITEM
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFF1F1D2B),
                                width: 1.5,
                              ),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  size: 14,
                                  color: Color(0xFF1F1D2B),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${review['rating']}',
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF1F1D2B),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(
                              Icons.more_horiz_rounded,
                              color: Color(0xFF1F1D2B),
                              size: 20,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // COMMENT TEXT
                      Text(
                        review['comment'] as String,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[800],
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // LIKE & TIME AGO
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                review['isLiked'] = !isLiked;
                                if (review['isLiked'] as bool) {
                                  review['likes'] =
                                      (review['likes'] as int) + 1;
                                } else {
                                  review['likes'] =
                                      (review['likes'] as int) - 1;
                                }
                              });
                            },
                            child: Icon(
                              isLiked
                                  ? Icons.favorite_rounded
                                  : Icons.favorite_border_rounded,
                              color: isLiked
                                  ? Colors.red
                                  : const Color(0xFF1F1D2B),
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            '${review['likes']}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF1F1D2B),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Text(
                            review['timeAgo'] as String,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[500],
                            ),
                          ),
                        ],
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
