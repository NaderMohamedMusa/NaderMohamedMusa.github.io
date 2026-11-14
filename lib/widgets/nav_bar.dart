import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/profile.dart';
import '../constants/styles.dart';
import '../utils/cv_download.dart';
import '../utils/responsive.dart';
import 'app_buttons.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onMenuTap;
  final Function(int) onScrollToSection;
  final int selectedIndex;

  const NavBar({
    super.key,
    required this.onMenuTap,
    required this.onScrollToSection,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final items = ['Home', 'About', 'Experience', 'Skills', 'Projects', 'Contact'];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 20 : 40,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: AppColors.background.withOpacity(0.88),
        border: const Border(bottom: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.primary.withOpacity(0.4)),
                ),
                child: const Center(
                  child: Text(
                    '</>',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(Profile.brand, style: AppStyles.headline2.copyWith(fontSize: 18)),
            ],
          ),
          const Spacer(),
          if (!Responsive.isMobile(context))
            Row(
              children: [
                for (var i = 0; i < items.length; i++)
                  _NavBarItem(
                    items[i],
                    () => onScrollToSection(i),
                    selected: selectedIndex == i,
                  ),
                const SizedBox(width: 16),
                AppPrimaryButton(
                  label: 'Hire Me',
                  icon: Icons.north_east,
                  onTap: () => onScrollToSection(5),
                ),
              ],
            )
          else
            IconButton(
              onPressed: onMenuTap,
              icon: const Icon(Icons.menu_rounded, color: AppColors.white),
            ),
        ],
      ),
    );
  }
}

class MobileMenu extends StatelessWidget {
  final Function(int) onScrollToSection;
  final int selectedIndex;

  const MobileMenu({
    super.key,
    required this.onScrollToSection,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    final items = ['Home', 'About', 'Experience', 'Skills', 'Projects', 'Contact'];
    return Drawer(
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(Profile.brand, style: AppStyles.headline2),
              const SizedBox(height: 28),
              for (var i = 0; i < items.length; i++)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    items[i],
                    style: AppStyles.bodyText.copyWith(
                      color: selectedIndex == i ? AppColors.primary : AppColors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    onScrollToSection(i);
                  },
                ),
              const Spacer(),
              AppPrimaryButton(
                label: 'Download CV',
                icon: Icons.download,
                onTap: CvDownload.open,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;
  final bool selected;

  const _NavBarItem(this.title, this.onTap, {required this.selected});

  @override
  State<_NavBarItem> createState() => _NavBarItemState();
}

class _NavBarItemState extends State<_NavBarItem> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final active = widget.selected || hovered;
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: widget.onTap,
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.title,
                style: AppStyles.bodyText.copyWith(
                  color: active ? AppColors.white : AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 6),
              AnimatedContainer(
                duration: const Duration(milliseconds: 180),
                height: 2,
                width: widget.selected ? 22 : 0,
                color: AppColors.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
