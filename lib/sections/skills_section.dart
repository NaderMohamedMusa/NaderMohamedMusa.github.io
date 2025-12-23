import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../models/skill.dart';
import '../utils/responsive.dart';

class SkillsSection extends StatelessWidget {
  SkillsSection({super.key});

  final List<SkillCategory> skillCategories = [
    SkillCategory(
      title: "Mobile Development",
      icon: Icons.phone_android,
      skills: [
        Skill(name: "Flutter", percentage: 0.95),
        Skill(name: "Dart", percentage: 0.95),
        Skill(name: "Bloc & Cubit", percentage: 0.95),
        Skill(name: "Riverpod", percentage: 0.90),
        Skill(name: "GetX & Provider", percentage: 0.90),
        Skill(name: "Responsive UI", percentage: 0.95),
        Skill(name: "Animations", percentage: 0.90),
        Skill(name: "Flutter Web", percentage: 0.85),
        Skill(name: "Testing", percentage: 0.80),
      ],
    ),
    SkillCategory(
      title: "Architecture & Patterns",
      icon: Icons.layers,
      skills: [
        Skill(name: "Clean Architecture", percentage: 0.95),
        Skill(name: "MVVM", percentage: 0.90),
        Skill(name: "MVC", percentage: 0.90),
        Skill(name: "SOLID Principles", percentage: 0.90),
        Skill(name: "Design Patterns", percentage: 0.85),
        Skill(name: "Modular Architecture", percentage: 0.85),
        Skill(name: "GetIt (DI)", percentage: 0.90),
      ],
    ),
    SkillCategory(
      title: "Backend & Integration",
      icon: Icons.cloud,
      skills: [
        Skill(name: "RESTful APIs", percentage: 0.95),
        Skill(name: "Firebase", percentage: 0.90),
        Skill(name: "Supabase", percentage: 0.85),
        Skill(name: "Google Maps", percentage: 0.90),
        Skill(name: "Payment Gateways", percentage: 0.85),
        Skill(name: "WebSockets (Pusher)", percentage: 0.85),
        Skill(name: "Local Storage (Hive/SQLite)", percentage: 0.90),
      ],
    ),
    SkillCategory(
      title: "DevOps & Tools",
      icon: Icons.build,
      skills: [
        Skill(name: "Git & GitHub", percentage: 0.95),
        Skill(name: "CI/CD (Codemagic)", percentage: 0.85),
        Skill(name: "Store Deployment", percentage: 0.95),
        Skill(name: "Melos (Monorepos)", percentage: 0.85),
        Skill(name: "Shorebird", percentage: 0.80),
        Skill(name: "Jira / Trello", percentage: 0.90),
        Skill(name: "Fastlane", percentage: 0.80),
      ],
    ),
    SkillCategory(
      title: "AI Augmented Development",
      icon: Icons.psychology,
      skills: [
        Skill(name: "Cursor AI", percentage: 0.95),
        Skill(name: "GitHub Copilot", percentage: 0.90),
        Skill(name: "ChatGPT", percentage: 0.95),
        Skill(name: "Claude Sonnet", percentage: 0.90),
        Skill(name: "Google DeepMind (Antigravity)", percentage: 0.99), // ;)
      ],
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
          Text("Skills", style: AppStyles.headline1.copyWith(color: AppColors.linkColor)),
          const SizedBox(height: 10),
          Text("My technical expertise", style: AppStyles.bodyText.copyWith(color: Colors.grey)),
           const SizedBox(height: 10),
          Container(height: 4, width: 50, color: AppColors.linkColor, margin: const EdgeInsets.only(top: 10)),
          const SizedBox(height: 60),
          
          Responsive.isMobile(context) 
            ? Column(
                children: skillCategories.map((category) => Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: _SkillCategoryCard(category: category),
                )).toList(),
              )
            : Wrap(
                spacing: 30,
                runSpacing: 30,
                alignment: WrapAlignment.center,
                children: skillCategories.map((category) => SizedBox(
                  width: (size.width * 0.8) / 2 - 40, // 2 cards per row approximately
                  child: _SkillCategoryCard(category: category),
                )).toList(),
              ),
        ],
      ),
    );
  }
}

class SkillCategory {
  final String title;
  final IconData icon;
  final List<Skill> skills;

  SkillCategory({required this.title, required this.icon, required this.skills});
}

class _SkillCategoryCard extends StatelessWidget {
  final SkillCategory category;

  const _SkillCategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2029),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.secondary.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 15, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(category.icon, color: AppColors.linkColor, size: 24),
              const SizedBox(width: 15),
              Text(category.title, style: AppStyles.headline2.copyWith(color: Colors.white, fontSize: 22)),
            ],
          ),
          const SizedBox(height: 15),
          Divider(color: Colors.grey[800], thickness: 1),
          const SizedBox(height: 20),
          ...category.skills.map((skill) => _SkillProgressBar(skill: skill)).toList(),
        ],
      ),
    );
  }
}

class _SkillProgressBar extends StatelessWidget {
  final Skill skill;

  const _SkillProgressBar({required this.skill});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(skill.name, style: AppStyles.bodyText.copyWith(color: Colors.grey[300], fontWeight: FontWeight.w500)),
              Text("${(skill.percentage * 100).toInt()}%", style: AppStyles.bodyText.copyWith(color: Colors.grey[500], fontSize: 14)),
            ],
          ),
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (context, constraints) {
              return Stack(
                children: [
                   Container(
                     height: 6,
                     width: double.infinity,
                     decoration: BoxDecoration(
                       color: Colors.grey[800],
                       borderRadius: BorderRadius.circular(3),
                     ),
                   ),
                   Container(
                     height: 6,
                     width: constraints.maxWidth * skill.percentage,
                     decoration: BoxDecoration(
                       color: AppColors.linkColor,
                       borderRadius: BorderRadius.circular(3),
                     ),
                   ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
