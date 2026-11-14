import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/profile.dart';
import '../constants/styles.dart';
import '../utils/responsive.dart';
import '../widgets/app_buttons.dart';
import '../widgets/section_shell.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      color: AppColors.background,
      padding: EdgeInsets.fromLTRB(
        Responsive.isMobile(context) ? 20 : 72,
        Responsive.isMobile(context) ? 8 : 12,
        Responsive.isMobile(context) ? 20 : 72,
        28,
      ),
      child: Column(
        children: [
          Responsive(
            mobile: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                _CtaBlock(),
                SizedBox(height: 24),
                _QuoteCard(),
                SizedBox(height: 24),
                _FollowBlock(),
              ],
            ),
            desktop: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 4, child: _CtaBlock()),
                SizedBox(width: 28),
                Expanded(flex: 5, child: _QuoteCard()),
                SizedBox(width: 28),
                Expanded(flex: 3, child: _FollowBlock()),
              ],
            ),
          ),
          const SizedBox(height: 36),
          const Divider(color: AppColors.border),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 8,
            children: [
              Text(
                '© ${DateTime.now().year} ${Profile.name}. All rights reserved.',
                style: AppStyles.bodyText.copyWith(fontSize: 12, color: AppColors.muted),
              ),
              Text(
                'Made with ❤️ by ${Profile.firstName}',
                style: AppStyles.bodyText.copyWith(fontSize: 12, color: AppColors.muted),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CtaBlock extends StatelessWidget {
  const _CtaBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionEyebrow("Let's work together"),
        const SizedBox(height: 12),
        Text('Have a project in mind?', style: AppStyles.headline1.copyWith(fontSize: 30)),
        const SizedBox(height: 10),
        Text(
          "I'm always open to discussing new projects and opportunities. Let's create something amazing together!",
          style: AppStyles.bodyText.copyWith(fontSize: 14),
        ),
        const SizedBox(height: 20),
        AppPrimaryButton(
          label: 'Get in Touch',
          icon: Icons.north_east,
          onTap: () => launchUrl(Uri.parse(Profile.phoneLink)),
        ),
      ],
    );
  }
}

class _QuoteCard extends StatelessWidget {
  const _QuoteCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.format_quote, color: AppColors.primary, size: 28),
          const SizedBox(height: 10),
          Text(
            'A Senior Flutter Developer with 5 years of experience building production apps for mobile, web, and desktop, including enterprise ERP platforms and real-time delivery systems.',
            style: AppStyles.bodyText.copyWith(fontSize: 14, color: AppColors.textPrimary),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/images/profile.jpg'),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(Profile.name, style: AppStyles.bodyText.copyWith(color: AppColors.white, fontWeight: FontWeight.w700, fontSize: 13)),
                  Text('Senior Flutter Developer', style: AppStyles.bodyText.copyWith(fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FollowBlock extends StatelessWidget {
  const _FollowBlock();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionEyebrow('Follow Me'),
        const SizedBox(height: 14),
        Row(
          children: [
            _Social(FontAwesomeIcons.github, Profile.github),
            _Social(FontAwesomeIcons.linkedinIn, Profile.linkedin),
            _Social(FontAwesomeIcons.whatsapp, Profile.phoneLink),
            _Social(FontAwesomeIcons.envelope, 'mailto:${Profile.email}'),
          ],
        ),
        const SizedBox(height: 16),
        _InfoRow(Icons.email_outlined, Profile.email, 'mailto:${Profile.email}'),
        const SizedBox(height: 8),
        _InfoRow(Icons.phone_outlined, Profile.phone, Profile.phoneLink),
        const SizedBox(height: 8),
        _InfoRow(Icons.location_on_outlined, Profile.location, null),
      ],
    );
  }
}

class _Social extends StatelessWidget {
  final FaIconData icon;
  final String url;
  const _Social(this.icon, this.url);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Container(
          width: 36,
          height: 36,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.surfaceAlt,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.border),
          ),
          child: FaIcon(icon, size: 14, color: AppColors.textPrimary),
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? url;
  const _InfoRow(this.icon, this.text, this.url);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: url == null ? null : () => launchUrl(Uri.parse(url!)),
      child: Row(
        children: [
          Icon(icon, size: 14, color: AppColors.primarySoft),
          const SizedBox(width: 8),
          Flexible(
            child: Text(text, style: AppStyles.bodyText.copyWith(fontSize: 13, color: AppColors.textPrimary)),
          ),
        ],
      ),
    );
  }
}
