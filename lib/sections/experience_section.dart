import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../models/experience.dart';
import '../utils/responsive.dart';
import '../widgets/section_shell.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  final List<Experience> experiences = const [
    Experience(
      company: 'Ultimate Solutions',
      role: 'Senior Flutter Developer',
      duration: 'June 2024 – Present',
      type: 'Full-time | On Site',
      description:
          'Modernizing Onyx ERP from a legacy enterprise system into a scalable solution for web, desktop, and mobile. Leading and coordinating a 15+ member development team, shaping reusable architecture across Sales, Inventory, Finance, HR, and POS, and improving performance and maintainability through modular development and code optimization.',
      websiteUrl: 'https://ultimatesolutionsportal.com/?lang=ar',
      technologies: ['Flutter', 'Dart', 'Clean Architecture', 'Bloc/Cubit', 'MVVM', 'CI/CD'],
    ),
    Experience(
      company: 'T Square',
      role: 'Mid Flutter Developer',
      duration: 'Feb 2024 – June 2024',
      type: 'Full-time | Remotely',
      description:
          'Designed and developed E-Learning and E-Commerce applications using Flutter and Firebase, integrating REST APIs, real-time databases, subscription systems, and payment gateways.',
      technologies: ['Flutter', 'Firebase', 'REST APIs', 'Pusher', 'FCM'],
    ),
    Experience(
      company: 'Fekrait',
      role: 'Junior Flutter Developer',
      duration: 'June 2021 – Nov 2022',
      type: 'Full-time | Remotely',
      description:
          'Built POS and sales management applications integrated with ERP systems, including online and offline transactions, inventory and invoicing workflows, and Sunmi, Bluetooth, and Ethernet printing. Also developed restaurant operations, e-invoice verification, and driver tracking features.',
      websiteUrl: 'https://fekrait.com',
      technologies: ['Flutter', 'Provider', 'MVC', 'REST APIs', 'Dio', 'Sunmi Printing'],
    ),
    Experience(
      company: 'Atlantis',
      role: 'Instructor',
      duration: 'June 2021 – Nov 2022',
      type: 'Part-time | On Site',
      description:
          'Delivered hands-on Flutter training and mentored students in application architecture, debugging, problem-solving, and development best practices through practical projects.',
      websiteUrl: 'https://www.facebook.com/atlantis.company.eg',
      technologies: ['Flutter', 'Dart', 'Teaching'],
    ),
    Experience(
      company: 'Pixel',
      role: 'Junior Flutter Developer',
      duration: 'June 2020 – Jan 2024',
      type: 'Full-time | Remotely',
      description:
          'Developed mobile applications for e-commerce, HR management, tourism, booking, and service businesses. Built employee management workflows, customer and vendor shopping experiences, digital payments, and reservation features from requirements through deployment and maintenance.',
      websiteUrl: 'http://www.pixel-eg.com',
      technologies: ['Flutter', 'Provider', 'Firebase'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      color: AppColors.background,
      bottomPadding: Responsive.isMobile(context) ? 8 : 12,
      child: Column(
        children: [
          const SectionEyebrow('Experience'),
          const SizedBox(height: 12),
          Text('My professional journey', style: AppStyles.headline1),
          const SizedBox(height: 36),
          ...experiences.asMap().entries.map((entry) {
            return FadeInUp(
              delay: Duration(milliseconds: 80 * entry.key),
              child: _ExperienceCard(experience: entry.value),
            );
          }),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  final Experience experience;
  const _ExperienceCard({required this.experience});

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) {
    final exp = widget.experience;
    return MouseRegion(
      onEnter: (_) => setState(() => hovered = true),
      onExit: (_) => setState(() => hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.all(Responsive.isMobile(context) ? 20 : 24),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: hovered ? AppColors.primary.withOpacity(0.55) : AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 8,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(exp.role, style: AppStyles.headline2),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.12),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    exp.duration,
                    style: AppStyles.bodyText.copyWith(color: AppColors.primarySoft, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: exp.websiteUrl == null ? null : () => launchUrl(Uri.parse(exp.websiteUrl!)),
              child: Text(
                '${exp.company}  •  ${exp.type}',
                style: AppStyles.bodyText.copyWith(
                  color: AppColors.primarySoft,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(exp.description, style: AppStyles.bodyText.copyWith(fontSize: 14)),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: exp.technologies
                  .map(
                    (tech) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundAlt,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Text(
                        tech,
                        style: AppStyles.bodyText.copyWith(fontSize: 12, color: AppColors.textPrimary),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
