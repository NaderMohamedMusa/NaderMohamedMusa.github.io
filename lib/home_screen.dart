import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'widgets/nav_bar.dart';
import 'sections/home_section.dart';
import 'sections/about_section.dart';
import 'sections/experience_section.dart';
import 'sections/skills_section.dart';
import 'sections/portfolio_section.dart';
import 'sections/contact_section.dart';
import 'utils/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _keys = List.generate(6, (index) => GlobalKey());

  void _scrollToSection(int index) {
    final context = _keys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
            opacity: 0.8, // Increased opacity to ensure it's visible
          ),
        ),
        child: Column(
          children: [
            NavBar(
              onMenuTap: () {
                 // Initial implementation of drawer or mobile menu can go here
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Menu Tapped")));
              },
              onScrollToSection: _scrollToSection,
            ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HomeSection(key: _keys[0]),
                  Container(key: _keys[1], child: const AboutSection()),
                  Container(key: _keys[2], child: const ExperienceSection()),
                  Container(key: _keys[3], child: SkillsSection()),
                  Container(key: _keys[4], child: PortfolioSection()),
                  Container(key: _keys[5], child: const ContactSection()),
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
