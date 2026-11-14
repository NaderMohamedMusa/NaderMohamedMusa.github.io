import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/profile.dart';
import '../constants/styles.dart';
import '../utils/responsive.dart';
import '../widgets/section_shell.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final stats = [
      _StatData(Icons.calendar_month_outlined, '5', 'Years Experience'),
      _StatData(Icons.code, '20+', 'Projects Completed'),
      _StatData(Icons.sentiment_satisfied_alt_outlined, '10+', 'Happy Clients'),
      _StatData(Icons.emoji_events_outlined, '100%', 'Client Satisfaction'),
    ];

    return SectionShell(
      color: AppColors.backgroundAlt,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeInDown(child: const SectionEyebrow('About Me')),
          const SizedBox(height: 24),
          Responsive(
            mobile: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _AboutCopy(),
                const SizedBox(height: 28),
                _StatsGrid(stats: stats, columns: 2),
              ],
            ),
            desktop: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: _AboutCopy()),
                const SizedBox(width: 48),
                Expanded(flex: 6, child: _StatsGrid(stats: stats, columns: 2)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutCopy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Profile.aboutTitle, style: AppStyles.headline1.copyWith(fontSize: 34)),
        const SizedBox(height: 16),
        Text(Profile.aboutBody, style: AppStyles.bodyText),
        const SizedBox(height: 22),
        OutlinedButton.icon(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                backgroundColor: AppColors.surface,
                title: Text('About Nader', style: AppStyles.headline2),
                content: Text(
                  '${Profile.aboutBody}\n\nEducation: Bachelor’s Degree in Computer Science, Fayoum University (2017–2021).\nLanguages: Arabic (native), English (very good).',
                  style: AppStyles.bodyText,
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Close'),
                  ),
                ],
              ),
            );
          },
          icon: const Icon(Icons.search, size: 16, color: AppColors.textPrimary),
          label: Text(
            'Learn More About Me',
            style: AppStyles.buttonText.copyWith(color: AppColors.textPrimary),
          ),
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF334155)),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          ),
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: const [
            _Chip(Icons.school_outlined, 'CS — Fayoum University'),
            _Chip(Icons.language, 'Arabic / English'),
            _Chip(Icons.phone_iphone, 'Mobile • Web • Desktop'),
          ],
        ),
      ],
    );
  }
}

class _Chip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _Chip(this.icon, this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppColors.primarySoft),
          const SizedBox(width: 8),
          Text(label, style: AppStyles.bodyText.copyWith(fontSize: 12, color: AppColors.textPrimary)),
        ],
      ),
    );
  }
}

class _StatData {
  final IconData icon;
  final String value;
  final String label;
  const _StatData(this.icon, this.value, this.label);
}

class _StatsGrid extends StatelessWidget {
  final List<_StatData> stats;
  final int columns;
  const _StatsGrid({required this.stats, required this.columns});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: stats.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: 148,
      ),
      itemBuilder: (context, index) {
        final stat = stats[index];
        return FadeInUp(
          delay: Duration(milliseconds: 80 * index),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.border),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.14),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(stat.icon, color: AppColors.primarySoft, size: 18),
                ),
                const SizedBox(height: 12),
                Text(stat.value, style: AppStyles.headline1.copyWith(fontSize: 26)),
                Text(stat.label, style: AppStyles.bodyText.copyWith(fontSize: 13)),
              ],
            ),
          ),
        );
      },
    );
  }
}
