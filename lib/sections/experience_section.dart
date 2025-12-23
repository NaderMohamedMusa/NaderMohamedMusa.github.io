import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../models/experience.dart';
import '../utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  final List<Experience> experiences = const [
     Experience(
      company: "Ultimate Solutions",
      role: "Flutter Developer",
      duration: "June 2024 – Present",
      type: "Full-time | On Site",
      description: "Transforming Onyx ERP into a modern platform running on web, desktop, and mobile using Flutter, with direct integration with the Oracle database via API, support for Firebase Hosting, local data management, integration with Mason and CI/CD, and payment gateways. Developing core modules, including HR, Sales, Inventory, and POS, to ensure optimized performance and a seamless experience across all devices.",
      websiteUrl: "https://ultimatesolutionsportal.com/?lang=ar",
      technologies: ["Flutter", "Dart", "Clean Arch", "Bloc", "Oracle API", "Firebase", "Mason"],
    ),
    Experience(
      company: "T Square",
      role: "Flutter Developer",
      duration: "Feb 2024 – June 2024",
      type: "Full-time | Remotely",
      description: "Designed and developed E-Learning and E-Commerce applications using Flutter and Firebase, integrating REST APIs, real-time databases (Pusher, Firebase, FCM), subscription systems, video playback, online lecture access, and payment gateway integration, supporting both single and multi-vendor systems.",
      technologies: ["Flutter", "Firebase", "REST APIs", "Pusher", "FCM", "Payment Gateway"],
    ),
    Experience(
      company: "Fekrait",
      role: "Flutter Developer",
      duration: "June 2021 – Nov 2022",
      type: "Full-time | Remotely",
      description: "Developing the POS system for the ERP System sales module, supporting printing via Sunmi, Ethernet, and Bluetooth, and enabling payments in both online and offline modes. Enhancing the restaurant app for reservations and orders, and developing the e-invoice verification app in Saudi Arabia. Creating the driver app for order tracking and driver location tracking.",
      websiteUrl: "https://fekrait.com",
      technologies: ["Flutter", "Provider", "Sunmi SDK", "Bluetooth", "Google Maps"],
    ),
     Experience(
      company: "Atlantis",
      role: "Flutter Instructor",
      duration: "June 2021 – Nov 2022",
      type: "Part-time | On Site",
      description: "Working as a Flutter instructor at a training center, teaching application development using Flutter, focusing on hands-on training and helping trainees build professional projects to enhance their opportunities in the job market.",
      websiteUrl: "https://www.facebook.com/atlantis.company.eg",
      technologies: ["Flutter", "Dart", "Teaching", "Mentoring"],
    ),
    Experience(
      company: "Pixel",
      role: "Freelance Flutter Developer",
      duration: "June 2020 – Jan 2024",
      type: "Freelance",
      description: "Working on an attendance and leave management application for employees, including salary tracking and employee tracking within the company. Developing a booking application for a tourist village. Working on various e-commerce projects, including vendor and multi-vendor platforms.",
      websiteUrl: "http://www.pixel-eg.com",
      technologies: ["Flutter", "Provider", "MVC", "Firebase", "Google Maps"],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(
        vertical: 80,
        horizontal: Responsive.isMobile(context) ? 20 : size.width * 0.1,
      ),
      child: Column(
        children: [
          Text("Experience", style: AppStyles.headline1.copyWith(color: AppColors.linkColor)),
          const SizedBox(height: 10),
          Text("My professional journey", style: AppStyles.bodyText.copyWith(color: Colors.grey)),
          const SizedBox(height: 10),
          Container(height: 4, width: 50, color: AppColors.linkColor, margin: const EdgeInsets.only(top: 10)),
          const SizedBox(height: 60),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: experiences.length,
            itemBuilder: (context, index) {
              return FadeInUp(
                 duration: Duration(milliseconds: 1000 + (index * 200)),
                 child: _TimelineExperienceCard(experience: experiences[index], isFirst: index == 0, isLast: index == experiences.length - 1)
              );
            },
          ),
        ],
      ),
    );
  }
}

class _TimelineExperienceCard extends StatefulWidget {
  final Experience experience;
  final bool isFirst;
  final bool isLast;

  const _TimelineExperienceCard({required this.experience, required this.isFirst, required this.isLast});

  @override
  State<_TimelineExperienceCard> createState() => _TimelineExperienceCardState();
}

class _TimelineExperienceCardState extends State<_TimelineExperienceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Timeline Line and Dot
        Positioned(
          left: 20,
          top: 0,
          bottom: 0,
          child: Column(
            children: [
              Expanded(
                child: Container(
                  width: 2,
                  color: widget.isFirst ? Colors.transparent : AppColors.linkColor.withOpacity(0.5),
                ),
              ),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.linkColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: AppColors.linkColor.withOpacity(0.5), blurRadius: 10, spreadRadius: 2),
                  ],
                ),
                child: const Icon(Icons.work, color: Colors.white, size: 12),
              ),
              Expanded(
                child: Container(
                  width: 2,
                  color: widget.isLast ? Colors.transparent : AppColors.linkColor.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
        // Content Card
        Padding(
          padding: const EdgeInsets.only(left: 60, bottom: 40),
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
              transform: Matrix4.identity()..scale(_isHovered ? 1.02 : 1.0),
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2029), // Darker card bg
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: _isHovered ? AppColors.linkColor : AppColors.secondary.withOpacity(0.1)),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered ? AppColors.linkColor.withOpacity(0.2) : Colors.black.withOpacity(0.2),
                    blurRadius: _isHovered ? 20 : 15,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.experience.role, style: AppStyles.headline2.copyWith(color: Colors.white, fontSize: 22)),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.linkColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.linkColor.withOpacity(0.3)),
                    ),
                    child: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         const Icon(Icons.calendar_today, color: AppColors.linkColor, size: 14),
                         const SizedBox(width: 8),
                         Text(widget.experience.duration, style: AppStyles.bodyText.copyWith(color: AppColors.linkColor, fontSize: 13, fontWeight: FontWeight.bold)),
                       ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      const Icon(FontAwesomeIcons.building, color: AppColors.textSecondary, size: 16),
                      const SizedBox(width: 10),
                      if (widget.experience.websiteUrl != null)
                           InkWell(
                             onTap: () async {
                                final Uri url = Uri.parse(widget.experience.websiteUrl!);
                                if (!await launchUrl(url)) {
                                     // handle error
                                }
                             },
                             child: Text(
                               "${widget.experience.company} | ${widget.experience.type}",
                               style: AppStyles.bodyText.copyWith(color: AppColors.linkColor, fontWeight: FontWeight.bold, decoration: TextDecoration.underline, decorationColor: AppColors.linkColor, fontSize: 15),
                             ),
                           )
                        else
                           Text("${widget.experience.company} | ${widget.experience.type}", style: AppStyles.bodyText.copyWith(color: AppColors.textSecondary, fontWeight: FontWeight.w600, fontSize: 15)),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Description as bullets
                  ...widget.experience.description.split('. ').where((s) => s.isNotEmpty).map((sentence) => 
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           const Padding(
                             padding: EdgeInsets.only(top: 6),
                             child: Icon(Icons.check_circle, color: AppColors.linkColor, size: 14),
                           ),
                           const SizedBox(width: 10),
                           Expanded(child: Text(sentence.trim().endsWith('.') ? sentence.trim() : "$sentence.", style: AppStyles.bodyText.copyWith(color: Colors.grey[300], fontSize: 15, height: 1.5))),
                        ],
                      ),
                    )
                  ).toList(),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: widget.experience.technologies.map((tech) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFF252836),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColors.textSecondary.withOpacity(0.1)),
                      ),
                      child: Text(tech, style: AppStyles.bodyText.copyWith(color: AppColors.linkColor, fontSize: 12, fontWeight: FontWeight.w500)),
                    )).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
