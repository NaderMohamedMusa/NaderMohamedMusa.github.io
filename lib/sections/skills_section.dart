import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../utils/responsive.dart';
import '../widgets/section_shell.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  final List<SkillItem> featured = const [
    SkillItem('Flutter', 0.95, Color(0xFF54C5F8)),
    SkillItem('Dart & OOP', 0.95, Color(0xFF0175C2)),
    SkillItem('BLoC / GetX / Provider', 0.95, Color(0xFF7C5CFF)),
    SkillItem('Clean Architecture', 0.95, Color(0xFF6366F1)),
    SkillItem('Firebase', 0.95, Color(0xFFFFCA28)),
    SkillItem('REST APIs', 0.95, Color(0xFF22C55E)),
    SkillItem('MVVM & MVC', 0.90, Color(0xFF14B8A6)),
    SkillItem('GitHub / GitLab', 0.95, Color(0xFFF05032)),
    SkillItem('CI/CD & Codemagic', 0.85, Color(0xFFA855F7)),
  ];

  final List<SkillCategory> extra = [
    SkillCategory('Flutter', [
      'Flutter Web',
      'Responsive UI',
      'Custom Widgets',
      'Melos (monorepos)',
      'Flavors',
      'Shorebird',
      'Store Deployment',
      'Testing',
    ]),
    SkillCategory('Backend & Data', [
      'All Firebase services',
      'All Supabase services',
      'Hive',
      'SQLite',
      'Maps & Live Tracking',
      'Background Services',
    ]),
    SkillCategory('Engineering', [
      'SOLID',
      'Design Patterns',
      'Clean Code',
      'Data Structures',
      'Algorithms',
      'Sentry',
      'Agile',
      'Jira / Trello / Slack',
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    final columns = Responsive.isMobile(context)
        ? 1
        : (Responsive.isTablet(context) ? 2 : 3);

    return SectionShell(
      child: Column(
        children: [
          const SectionEyebrow('My Skills'),
          const SizedBox(height: 12),
          Text('Technologies I Master', style: AppStyles.headline1),
          const SizedBox(height: 40),
          GridView.builder(
            itemCount: featured.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              mainAxisExtent: 86,
              crossAxisSpacing: 28,
              mainAxisSpacing: 18,
            ),
            itemBuilder: (context, index) => _SkillBar(item: featured[index]),
          ),
          const SizedBox(height: 36),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.center,
            children: extra
                .expand((c) => c.skills.map((s) => _Tag('${c.title}: $s')))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class SkillCategory {
  final String title;
  final List<String> skills;
  SkillCategory(this.title, this.skills);
}

class SkillItem {
  final String name;
  final double percentage;
  final Color color;
  const SkillItem(this.name, this.percentage, this.color);
}

class _SkillBar extends StatelessWidget {
  final SkillItem item;
  const _SkillBar({required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: item.color.withOpacity(0.16),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Center(
                child: Text(
                  item.name[0],
                  style: TextStyle(color: item.color, fontSize: 11, fontWeight: FontWeight.w800),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                item.name,
                style: AppStyles.bodyText.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
            Text(
              '${(item.percentage * 100).toInt()}%',
              style: AppStyles.bodyText.copyWith(fontSize: 13, color: AppColors.muted),
            ),
          ],
        ),
        const SizedBox(height: 10),
        LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Container(
                  height: 6,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Container(
                  height: 6,
                  width: constraints.maxWidth * item.percentage,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  final String text;
  const _Tag(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(text, style: AppStyles.bodyText.copyWith(fontSize: 12, color: AppColors.textPrimary)),
    );
  }
}

