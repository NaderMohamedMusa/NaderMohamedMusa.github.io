import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/profile.dart';
import '../constants/styles.dart';
import '../utils/responsive.dart';
import '../widgets/app_buttons.dart';
import '../widgets/section_shell.dart';

class HomeSection extends StatelessWidget {
  final VoidCallback onViewWork;

  const HomeSection({super.key, required this.onViewWork});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      padding: EdgeInsets.fromLTRB(
        Responsive.isMobile(context) ? 20 : 72,
        Responsive.isMobile(context) ? 36 : 56,
        Responsive.isMobile(context) ? 20 : 72,
        Responsive.isMobile(context) ? 48 : 72,
      ),
      child: Responsive(
        mobile: Column(
          children: [
            _HeroCopy(onViewWork: onViewWork, compact: true),
            const SizedBox(height: 40),
            const _HeroVisual(size: 280),
          ],
        ),
        desktop: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(flex: 6, child: _HeroCopy(onViewWork: onViewWork)),
            const SizedBox(width: 40),
            const Expanded(flex: 5, child: _HeroVisual(size: 420)),
          ],
        ),
      ),
    );
  }
}

class _HeroCopy extends StatelessWidget {
  final VoidCallback onViewWork;
  final bool compact;

  const _HeroCopy({required this.onViewWork, this.compact = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: compact ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        FadeInDown(
          child: Text(
            Profile.role,
            style: AppStyles.sectionEyebrow,
            textAlign: compact ? TextAlign.center : TextAlign.start,
          ),
        ),
        const SizedBox(height: 18),
        FadeInLeft(
          child: RichText(
            textAlign: compact ? TextAlign.center : TextAlign.start,
            text: TextSpan(
              style: AppStyles.display.copyWith(fontSize: compact ? 36 : 56),
              children: [
                const TextSpan(text: "Hi, I'm "),
                TextSpan(
                  text: Profile.firstName,
                  style: const TextStyle(color: AppColors.primarySoft),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        FadeInLeft(
          delay: const Duration(milliseconds: 120),
          child: Text(
            Profile.headline,
            style: AppStyles.headline1.copyWith(
              fontSize: compact ? 26 : 40,
              fontWeight: FontWeight.w700,
            ),
            textAlign: compact ? TextAlign.center : TextAlign.start,
          ),
        ),
        const SizedBox(height: 18),
        FadeIn(
          delay: const Duration(milliseconds: 200),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: Text(
              Profile.summary,
              style: AppStyles.bodyText,
              textAlign: compact ? TextAlign.center : TextAlign.start,
            ),
          ),
        ),
        const SizedBox(height: 28),
        FadeInUp(
          child: Wrap(
            spacing: 14,
            runSpacing: 12,
            alignment: compact ? WrapAlignment.center : WrapAlignment.start,
            children: [
              AppPrimaryButton(
                label: 'View My Work',
                icon: Icons.north_east,
                onTap: onViewWork,
              ),
              AppOutlineButton(
                label: 'Download CV',
                icon: Icons.download,
                onTap: () => launchUrl(Uri.parse(Profile.resume)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 36),
        FadeInUp(
          delay: const Duration(milliseconds: 150),
          child: Column(
            crossAxisAlignment:
                compact ? CrossAxisAlignment.center : CrossAxisAlignment.start,
            children: [
              Text(
                'TECHNOLOGIES I WORK WITH',
                style: AppStyles.sectionEyebrow.copyWith(
                  color: AppColors.muted,
                  letterSpacing: 1.6,
                  fontSize: 11,
                ),
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: compact ? WrapAlignment.center : WrapAlignment.start,
                children: const [
                  _TechBadge('Flutter', Color(0xFF54C5F8)),
                  _TechBadge('Dart', Color(0xFF0175C2)),
                  _TechBadge('Firebase', Color(0xFFFFCA28)),
                  _TechBadge('Bloc', Color(0xFF7C5CFF)),
                  _TechBadge('Git', Color(0xFFF05032)),
                  _TechBadge('REST', Color(0xFF22C55E)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _TechBadge extends StatelessWidget {
  final String label;
  final Color color;
  const _TechBadge(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: color.withOpacity(0.18),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                label[0],
                style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.w800),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: AppStyles.bodyText.copyWith(color: AppColors.textPrimary, fontSize: 12, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

class _HeroVisual extends StatelessWidget {
  final double size;
  const _HeroVisual({required this.size});

  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: SizedBox(
        height: size + 40,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              right: 18,
              top: 18,
              child: Column(
                children: List.generate(
                  5,
                  (r) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      children: List.generate(
                        5,
                        (c) => Container(
                          width: 4,
                          height: 4,
                          margin: const EdgeInsets.only(left: 8),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.18),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: size * 0.78,
              height: size * 0.78,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.heroGlow,
              ),
            ),
            ClipOval(
              child: Image.asset(
                'assets/images/profile.jpg',
                width: size * 0.72,
                height: size * 0.72,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 24,
              child: _CodeCard(),
            ),
            Positioned(
              left: 8,
              bottom: size * 0.18,
              child: CustomPaint(
                size: const Size(70, 50),
                painter: _ScribblePainter(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CodeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xE6111827),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.35), blurRadius: 24, offset: const Offset(0, 12)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.code, color: AppColors.textSecondary, size: 14),
              const SizedBox(width: 6),
              Text('Code', style: AppStyles.code.copyWith(color: AppColors.muted, fontSize: 11)),
              const Spacer(),
              const Icon(Icons.circle, size: 8, color: Color(0xFF22C55E)),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'const developer = {\n  name: "Nader",\n  skills: ["Flutter", "Dart"],\n  passion: "Building apps\n  for every platform"\n};',
            style: AppStyles.code,
          ),
        ],
      ),
    );
  }
}

class _ScribblePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withOpacity(0.7)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6;
    final path = Path()
      ..moveTo(0, size.height * 0.7)
      ..quadraticBezierTo(size.width * 0.4, 0, size.width, size.height * 0.35);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

