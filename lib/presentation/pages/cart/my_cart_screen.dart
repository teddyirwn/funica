import 'package:flutter/material.dart';
import 'package:funica/presentation/pages/checkout/checkout_screen.dart';
import 'package:funica/presentation/widget/appBar.dart';
import 'package:funica/presentation/widget/bottom_navigation_bar.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {

  // DATA DUMMY CART ITEM SESUAI DESAIN UI
  final List<Map<String, dynamic>> _cartItems = [
    {
      'name': 'Lawson Chair',
      'color': 'Blue Grey',
      'colorValue': const Color(0xFF5A7285),
      'price': 120.0,
      'quantity': 1,
      'image': 'cart_1.png',
    },
    {
      'name': 'Parabolic Reflector',
      'color': 'Brown',
      'colorValue': const Color(0xFF8B5A2B),
      'price': 170.0,
      'quantity': 2,
      'image': 'cart_2.png',
    },
    {
      'name': 'Mini Wooden Table',
      'color': 'Brown',
      'colorValue': const Color(0xFF8B5A2B),
      'price': 165.0,
      'quantity': 3,
      'image': 'cart_3.png',
    },
    {
      'name': 'Wooden Wardrobe',
      'color': 'Natural Wood',
      'colorValue': const Color(0xFF8B5A2B),
      'price': 190.0,
      'quantity': 1,
      'image': 'cart_4.png',
    },
  ];

  // HITUNG TOTAL PRICE DINAMIS
  double get _totalPrice {
    double total = 0.0;
    for (var item in _cartItems) {
      total += (item['price'] as double) * (item['quantity'] as int);
    }
    return total;
  }

  // FUNGSI MEMUNCULKAN BOTTOM SHEET "REMOVE FROM CART?" (SESUAI GAMBAR)
  void _showRemoveFromCartDialog(int index) {
    final item = _cartItems[index];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // INDIKATOR HANDLE BAR ATAS
              Container(
                width: 38,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),

              // JUDUL MODAL
              const Text(
                'Remove From Cart?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F1D2B),
                ),
              ),
              const SizedBox(height: 16),
              const Divider(color: Color(0xFFEEEEEE), thickness: 1),
              const SizedBox(height: 16),

              // ITEM CARD PREVIEW DENGAN QUANTITY SELECTOR (PERSIS ACUAN)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 15,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // GAMBAR PRODUK
                    Container(
                      width: 80,
                      height: 80,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/images/${item['image']}',
                          fit: BoxFit.contain,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(
                              Icons.image_not_supported_rounded,
                              color: Colors.grey,
                              size: 32,
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),

                    // DETAIL PRODUK
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  color: item['colorValue'] as Color,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                item['color'] as String,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '\$${(item['price'] as double).toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF1F1D2B),
                                ),
                              ),

                              // QUANTITY DISPLAY DI MODAL
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFAFAFA),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.remove,
                                      size: 14,
                                      color: Color(0xFF1F1D2B),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Text(
                                        '${item['quantity']}',
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFF1F1D2B),
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.add,
                                      size: 14,
                                      color: Color(0xFF1F1D2B),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Color(0xFFEEEEEE), thickness: 1),
              const SizedBox(height: 20),

              // TOMBOL CANCEL & YES, REMOVE (DESAIN BUNDAR/OVAL)
              Row(
                children: [
                  // TOMBOL CANCEL
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFEAEAEA),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27),
                          ),
                        ),
                        child: const Text(
                          'Cancel',
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

                  // TOMBOL YES, REMOVE
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _cartItems.removeAt(index);
                          });
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1F1D2B),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27),
                          ),
                        ),
                        child: const Text(
                          'Yes, Remove',
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
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarWidget(
        title: 'My Cart',
        action: [
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
              color: Color(0xFF1F1D2B),
              size: 24,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // STATUS BAR MANUAL

            // LIST CART ITEMS SCROLLABLE
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                physics: const BouncingScrollPhysics(),
                itemCount: _cartItems.length,
                itemBuilder: (context, index) {
                  final item = _cartItems[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 15,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // GAMBAR PRODUK
                        Container(
                          width: 90,
                          height: 90,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Image.asset(
                              'assets/images/${item['image']}',
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.image_not_supported_rounded,
                                  color: Colors.grey,
                                  size: 32,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),

                        // DETAIL PRODUK (NAMA, WARNA, HARGA)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // NAMA & TOMBOL DELETE
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      item['name'] as String,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF1F1D2B),
                                      ),
                                    ),
                                  ),
                                  // TAP DELETE SEKARANG HANYA MEMANGGIL DIALOG REMOVE
                                  GestureDetector(
                                    onTap: () {
                                      _showRemoveFromCartDialog(index);
                                    },
                                    child: const Icon(
                                      Icons.delete_outline_rounded,
                                      size: 20,
                                      color: Color(0xFF1F1D2B),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),

                              // DESKRIPSI WARNA
                              Row(
                                children: [
                                  Container(
                                    width: 12,
                                    height: 12,
                                    decoration: BoxDecoration(
                                      color: item['colorValue'] as Color,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    item['color'] as String,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),

                              // HARGA & QUANTITY SELECTOR
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '\$${(item['price'] as double).toStringAsFixed(2)}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF1F1D2B),
                                    ),
                                  ),

                                  // QUANTITY SELECTOR
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFAFAFA),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Row(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            if ((item['quantity'] as int) > 1) {
                                              setState(() {
                                                item['quantity'] =
                                                    (item['quantity'] as int) -
                                                    1;
                                              });
                                            }
                                          },
                                          child: const Icon(
                                            Icons.remove,
                                            size: 16,
                                            color: Color(0xFF1F1D2B),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          child: Text(
                                            '${item['quantity']}',
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF1F1D2B),
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              item['quantity'] =
                                                  (item['quantity'] as int) + 1;
                                            });
                                          },
                                          child: const Icon(
                                            Icons.add,
                                            size: 16,
                                            color: Color(0xFF1F1D2B),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // BOTTOM CHECKOUT BAR
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 10,
                    offset: const Offset(0, -4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total price',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '\$${_totalPrice.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F1D2B),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: SizedBox(
                      height: 54,
                      child: ElevatedButton(
                        onPressed: () {
                          // NAVIGASI KE CHECKOUT SCREEN
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CheckoutScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1F1D2B),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Checkout',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.arrow_forward_rounded,
                              color: Colors.white,
                              size: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // BOTTOM NAVIGATION BAR
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(selectedIndex: 1),
    );
  }
}
