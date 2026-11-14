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
          'Contributing to the modernization of Onyx / Solix ERP, transforming a legacy Oracle Forms system into a scalable cross-platform solution for web, desktop, and mobile. Leading and coordinating a development team of 15+ members with technical guidance, code reviews, and consistent standards. Designing reusable architectures for Sales, Inventory, Finance, HR, and POS, and improving performance through modular development.',
      websiteUrl: 'https://ultimatesolutionsportal.com/?lang=ar',
      technologies: [
        'Flutter',
        'Dart',
        'Clean Architecture',
        'Bloc/Cubit',
        'MVVM',
        'REST APIs',
        'Firebase',
        'CI/CD',
      ],
    ),
    Experience(
      company: 'Fekrait',
      role: 'Junior Flutter Developer',
      duration: 'June 2021 – Nov 2022',
      type: 'Full-time | Remotely',
      description:
          'Developed POS and sales management applications integrated with ERP systems, including inventory, invoicing, and daily operations. Implemented online/offline transaction workflows, receipt printing for Sunmi, Bluetooth, and Ethernet devices, restaurant reservation and order features, plus electronic invoice verification and delivery apps with live driver tracking.',
      websiteUrl: 'https://fekrait.com',
      technologies: ['Flutter', 'Provider', 'MVC', 'Sunmi SDK', 'Google Maps'],
    ),
    Experience(
      company: 'Pixel',
      role: 'Junior Flutter Developer',
      duration: 'June 2020 – Jan 2024',
      type: 'Full-time | Remotely',
      description:
          'Delivered mobile applications across e-commerce, HR, tourism, booking, and service industries. Built employee management for attendance, leave, payroll, and location monitoring; customer/vendor e-commerce with carts, orders, and digital payments; and tourism reservation apps with electronic tickets and customer engagement.',
      websiteUrl: 'http://www.pixel-eg.com',
      technologies: ['Flutter', 'Provider', 'MVC', 'Firebase', 'Payments'],
    ),
    Experience(
      company: 'Atlantis',
      role: 'Flutter Instructor',
      duration: 'June 2021 – Nov 2022',
      type: 'Instructor | On Site',
      description:
          'Delivered practical Flutter training from fundamentals to real-world projects. Mentored trainees in architecture, problem-solving, debugging, and best practices, with hands-on exercises that prepare students for professional development roles.',
      websiteUrl: 'https://www.facebook.com/atlantis.company.eg',
      technologies: ['Flutter', 'Dart', 'Teaching', 'Mentoring'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      color: AppColors.background,
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
