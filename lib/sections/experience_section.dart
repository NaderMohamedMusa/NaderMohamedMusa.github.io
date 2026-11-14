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
      role: 'Flutter Developer',
      duration: 'June 2024 – Present',
      type: 'Full-time | On Site',
      description:
          'Transforming Onyx ERP into a modern platform running on web, desktop, and mobile using Flutter, with direct integration with the Oracle database via API, support for Firebase Hosting, local data management, integration with Mason and CI/CD, and payment gateways.',
      websiteUrl: 'https://ultimatesolutionsportal.com/?lang=ar',
      technologies: ['Flutter', 'Dart', 'Clean Arch', 'Bloc', 'Oracle API', 'Firebase'],
    ),
    Experience(
      company: 'T Square',
      role: 'Flutter Developer',
      duration: 'Feb 2024 – June 2024',
      type: 'Full-time | Remotely',
      description:
          'Designed and developed E-Learning and E-Commerce applications using Flutter and Firebase, integrating REST APIs, real-time databases, subscription systems, and payment gateways.',
      technologies: ['Flutter', 'Firebase', 'REST APIs', 'Pusher', 'FCM'],
    ),
    Experience(
      company: 'Fekrait',
      role: 'Flutter Developer',
      duration: 'June 2021 – Nov 2022',
      type: 'Full-time | Remotely',
      description:
          'Developing the POS system for the ERP sales module, supporting printing via Sunmi, Ethernet, and Bluetooth, plus restaurant, e-invoice, and driver tracking apps.',
      websiteUrl: 'https://fekrait.com',
      technologies: ['Flutter', 'Provider', 'Sunmi SDK', 'Google Maps'],
    ),
    Experience(
      company: 'Atlantis',
      role: 'Flutter Instructor',
      duration: 'June 2021 – Nov 2022',
      type: 'Part-time | On Site',
      description:
          'Working as a Flutter instructor, focusing on hands-on training and helping trainees build professional projects.',
      websiteUrl: 'https://www.facebook.com/atlantis.company.eg',
      technologies: ['Flutter', 'Dart', 'Teaching'],
    ),
    Experience(
      company: 'Pixel',
      role: 'Freelance Flutter Developer',
      duration: 'June 2020 – Jan 2024',
      type: 'Freelance',
      description:
          'Attendance systems, tourist booking, and multi-vendor e-commerce platforms for clients across Egypt.',
      websiteUrl: 'http://www.pixel-eg.com',
      technologies: ['Flutter', 'Provider', 'Firebase'],
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
