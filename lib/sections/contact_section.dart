import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../utils/responsive.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Column(
        children: [
          FadeInDown(child: Text("Contact Me", style: AppStyles.headline1.copyWith(color: AppColors.linkColor))),
          const SizedBox(height: 10),
          FadeInDown(delay: const Duration(milliseconds: 200), child: Text("Let's work together", style: AppStyles.bodyText.copyWith(color: Colors.grey))),
          const SizedBox(height: 60),

          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: Container(
              width: Responsive.isMobile(context) ? double.infinity : 700,
              padding: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2029),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.secondary.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 20, offset: const Offset(0, 10)),
                  BoxShadow(color: AppColors.linkColor.withOpacity(0.05), blurRadius: 20, spreadRadius: 0),
                ],
              ),
              child: Column(
                children: [
                  Text("Get in Touch", style: AppStyles.headline2.copyWith(color: Colors.white, fontSize: 30)),
                  const SizedBox(height: 20),
                  Text(
                    "I'm currently looking for new opportunities, my inbox is always open. Whether you have a question or just want to say hi, I'll try my best to get back to you!",
                    style: AppStyles.bodyText.copyWith(color: Colors.grey[300], fontSize: 16, height: 1.6),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      _ContactButton(
                        text: "Say Hello",
                        icon: Icons.email_outlined,
                        onTap: () async {
                           final Uri emailLaunchUri = Uri(
                             scheme: 'mailto',
                             path: 'Mo.nader298@gmail.com',
                             query: 'subject=Hello&body=Hi Nader,',
                           );
                           if (!await launchUrl(emailLaunchUri)) {}
                        },
                      ),
                      _ContactButton(
                        text: "WhatsApp",
                        icon: FontAwesomeIcons.whatsapp,
                        color: const Color(0xFF25D366),
                        onTap: () async {
                           final Uri whatsappUri = Uri.parse("https://wa.me/201026133553");
                           if (!await launchUrl(whatsappUri)) {}
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          
          const SizedBox(height: 60),
          FadeInUp(
            delay: const Duration(milliseconds: 500),
            child: Column(
              children: [
                _ContactInfoRow(icon: Icons.location_on, text: "6 October, Giza, Egypt"),
                const SizedBox(height: 10),
                _ContactInfoRow(icon: Icons.phone, text: "+20 102 613 3553"),
                const SizedBox(height: 10),
                _ContactInfoRow(
                  icon: Icons.email, 
                  text: "Mo.nader298@gmail.com", 
                  color: AppColors.linkColor,
                  onTap: () async {
                     final Uri emailLaunchUri = Uri(
                       scheme: 'mailto',
                       path: 'Mo.nader298@gmail.com',
                     );
                     if (!await launchUrl(emailLaunchUri)) {}
                  }
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     _FooterIcon(icon: FontAwesomeIcons.github, url: "https://github.com/NaderMohamedMusa"),
                     const SizedBox(width: 20),
                     _FooterIcon(icon: FontAwesomeIcons.linkedin, url: "https://www.linkedin.com/in/nader-mohamed-musa-560133186/"),
                     const SizedBox(width: 20),
                     _FooterIcon(icon: Icons.email, url: "mailto:Mo.nader298@gmail.com"),
                  ],
                ),
                const SizedBox(height: 30),
                Text("© 2025 Nader Mohamed. All Right Reserved", style: AppStyles.bodyText.copyWith(fontSize: 14, color: Colors.grey[600])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContactInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? color;
  final VoidCallback? onTap;

  const _ContactInfoRow({required this.icon, required this.text, this.color, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color ?? Colors.grey, size: 18),
          const SizedBox(width: 10),
          Text(text, style: AppStyles.bodyText.copyWith(color: color ?? Colors.grey, fontWeight: onTap != null ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}

class _ContactButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;
  final Color? color;

  const _ContactButton({required this.text, required this.icon, required this.onTap, this.color});

  @override
  State<_ContactButton> createState() => _ContactButtonState();
}

class _ContactButtonState extends State<_ContactButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.color ?? AppColors.linkColor;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          decoration: BoxDecoration(
            color: _isHovered ? color : Colors.transparent,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: color, width: 2),
            boxShadow: [
              if (_isHovered) BoxShadow(color: color.withOpacity(0.4), blurRadius: 15, spreadRadius: 2)
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, color: _isHovered ? Colors.white : color, size: 20),
              const SizedBox(width: 10),
              Text(
                widget.text,
                style: AppStyles.buttonText.copyWith(
                  color: _isHovered ? Colors.white : color,
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FooterIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _FooterIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(icon, color: AppColors.textSecondary, size: 22),
      onPressed: () => launchUrl(Uri.parse(url)),
      hoverColor: AppColors.linkColor.withOpacity(0.1),
      splashRadius: 25,
    );
  }
}
