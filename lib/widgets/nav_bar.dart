import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../utils/responsive.dart';

import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onMenuTap;
  final Function(int) onScrollToSection;

  const NavBar({
    Key? key, 
    required this.onMenuTap,
    required this.onScrollToSection,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      color: AppColors.background.withOpacity(0.8), // Glassmorphism effect base
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "<Nader />",
            style: AppStyles.headline2.copyWith(color: AppColors.secondary),
          ),
          if (!Responsive.isMobile(context))
            Row(
              children: [
                _NavBarItem("Home", () => onScrollToSection(0)),
                _NavBarItem("About", () => onScrollToSection(1)),
                _NavBarItem("Experience", () => onScrollToSection(2)),
                _NavBarItem("Skills", () => onScrollToSection(3)),
                _NavBarItem("Projects", () => onScrollToSection(4)),
                _NavBarItem("Contact", () => onScrollToSection(5)),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () async {
                    final Uri url = Uri.parse("https://drive.google.com/file/d/1rgKNaUMRgjmhAdj7_e7un5CHXKFMT-Ys/view");
                    if (!await launchUrl(url)) {
                       // Handle error
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.secondary,
                    foregroundColor: AppColors.black,
                  ),
                  child: const Text("Resume"),
                )
              ],
            )
          else
            IconButton(
              onPressed: onMenuTap,
              icon: const Icon(Icons.menu, color: AppColors.white),
            )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _NavBarItem(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          title,
          style: AppStyles.bodyText.copyWith(
            color: AppColors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
