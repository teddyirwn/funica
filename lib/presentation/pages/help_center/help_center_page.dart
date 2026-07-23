import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:funica/presentation/pages/help_center/customer_service_page.dart';
import 'package:funica/presentation/widget/customAppbarWidget.dart';
import 'package:funica/presentation/widget/help_center/contact_item_widget.dart';
import 'package:funica/presentation/widget/help_center/faq_item_widget.dart';
import 'package:funica/core/constants/app_color.dart';

class HelpCenterPage extends StatefulWidget {
  const HelpCenterPage({super.key});

  @override
  State<HelpCenterPage> createState() => _HelpCenterPageState();
}

class _HelpCenterPageState extends State<HelpCenterPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedCategoryIndex = 0;

  final List<String> _categories = ['General', 'Account', 'Service', 'Payment'];

  final List<Map<String, String>> _faqList = [
    {
      'question': 'What is Fasto?',
      'answer':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    },
    {
      'question': 'How to use Fasto?',
      'answer':
          'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    },
    {
      'question': 'How do I cancel an order?',
      'answer':
          'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
    },
    {
      'question': 'Is Fasto free to use?',
      'answer':
          'Excepteur sint occaecat cupiditate non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    },
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Customappbarwidget(
        title: 'Help Center',
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/Group.svg"),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(child: _buildTabBar()),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            indicatorColor: AppColors.primaryColor,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 4,
            labelStyle: TextStyle(
              fontFamily: 'urbanist',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: AppColors.secondary,
            tabs: [
              Tab(text: 'FAQ'),
              Tab(text: 'Contact Us'),
            ],
          ),
          Expanded(
            child: TabBarView(children: [_buildFaqTab(), _buildContactUsTab()]),
          ),
        ],
      ),
    );
  }

  Widget _buildFaqTab() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      children: [
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: _categories.length,
            itemBuilder: (context, index) {
              final isSelected = _selectedCategoryIndex == index;
              return Container(
                margin: const EdgeInsets.only(right: 8.0),
                child: ChoiceChip(
                  label: Text(
                    _categories[index],
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  selected: isSelected,
                  selectedColor: Colors.black,
                  backgroundColor: Colors.white,

                  padding: const EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: 10,
                  ),

                  showCheckmark: false,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                      color: isSelected ? Colors.black : Colors.black,
                    ),
                  ),
                  onSelected: (bool selected) {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 20.0),

        SizedBox(
          height: 56,
          child: TextFormField(
            expands: true,
            maxLines: null,
            minLines: null,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              suffixIcon: const Icon(Icons.filter_list, color: Colors.black),

              filled: true,
              fillColor: const Color(0xFFFAFAFA),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        const SizedBox(height: 20.0),

        ..._faqList.map((faq) {
          return FaqItemWidget(
            question: faq['question']!,
            answer: faq['answer']!,
          );
        }),
      ],
    );
  }

  Widget _buildContactUsTab() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      children: [
        ContactItemWidget(
          title: 'Customer Service',
          icon: "assets/icons/headphone.svg",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CustomerServicePage(),
              ),
            );
          },
        ),
        ContactItemWidget(
          title: 'WhatsApp',
          icon: "assets/icons/whatshap.svg",
          onTap: () {},
        ),
        ContactItemWidget(
          title: 'Website',
          icon: "assets/icons/internet.svg",
          onTap: () {},
        ),
        ContactItemWidget(
          title: 'Facebook',
          icon: "assets/icons/facebook.svg",
          onTap: () {},
        ),
        ContactItemWidget(
          title: 'Twitter',
          icon: "assets/icons/twiter.svg",
          onTap: () {},
        ),
        ContactItemWidget(
          title: 'Instagram',
          icon: "assets/icons/instagram.svg",
          onTap: () {},
        ),
      ],
    );
  }
}
