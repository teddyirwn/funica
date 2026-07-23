import 'package:flutter/material.dart';
import 'package:funica/presentation/widget/customAppbarWidget.dart';
import 'package:funica/presentation/widget/profilePage/language_tile_widget.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String _selectedLanguage = 'English (US)';

  final List<String> _suggestedLanguages = ['English (US)', 'English (UK)'];

  final List<String> _allLanguages = [
    'Mandarin',
    'Hindi',
    'Spanish',
    'French',
    'Arabic',
    'Bengali',
    'Russian',
    'Indonesian',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Customappbarwidget(title: 'Language'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
        children: [
          _buildSectionHeader('Suggested'),
          const SizedBox(height: 8.0),
          ..._suggestedLanguages.map((lang) {
            return LanguageTileWidget(
              title: lang,
              isSelected: _selectedLanguage == lang,
              onTap: () {
                setState(() {
                  _selectedLanguage = lang;
                });
              },
            );
          }),

          const SizedBox(height: 16.0),
          const Divider(thickness: 1, color: Color(0xFFEEEEEE)),
          const SizedBox(height: 16.0),

          _buildSectionHeader('Language'),
          const SizedBox(height: 8.0),
          ..._allLanguages.map((lang) {
            return LanguageTileWidget(
              title: lang,
              isSelected: _selectedLanguage == lang,
              onTap: () {
                setState(() {
                  _selectedLanguage = lang;
                });
              },
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }
}
