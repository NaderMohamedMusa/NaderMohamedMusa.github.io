import 'package:flutter/material.dart';
import 'constants/colors.dart';
import 'widgets/nav_bar.dart';
import 'sections/home_section.dart';
import 'sections/about_section.dart';
import 'sections/experience_section.dart';
import 'sections/skills_section.dart';
import 'sections/portfolio_section.dart';
import 'sections/contact_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _keys = List.generate(6, (index) => GlobalKey());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    int next = 0;
    for (var i = 0; i < _keys.length; i++) {
      final ctx = _keys[i].currentContext;
      if (ctx == null) continue;
      final box = ctx.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) continue;
      final offset = box.localToGlobal(Offset.zero).dy;
      if (offset <= 140) next = i;
    }
    if (next != _selectedIndex) {
      setState(() => _selectedIndex = next);
    }
  }

  void _scrollToSection(int index) {
    final context = _keys[index].currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 550),
        curve: Curves.easeInOut,
        alignment: 0.02,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      endDrawer: MobileMenu(
        onScrollToSection: _scrollToSection,
        selectedIndex: _selectedIndex,
      ),
      body: Column(
        children: [
          NavBar(
            selectedIndex: _selectedIndex,
            onMenuTap: () => _scaffoldKey.currentState?.openEndDrawer(),
            onScrollToSection: _scrollToSection,
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  HomeSection(
                    key: _keys[0],
                    onViewWork: () => _scrollToSection(4),
                  ),
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
    );
  }
}
