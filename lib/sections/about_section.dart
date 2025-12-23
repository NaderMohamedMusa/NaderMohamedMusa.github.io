import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../utils/responsive.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

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
          FadeInDown(child: Text("About Me", style: AppStyles.headline1.copyWith(color: AppColors.linkColor))),
          const SizedBox(height: 10),
          FadeInDown(delay: const Duration(milliseconds: 200), child: Text("Get to know me better", style: AppStyles.bodyText.copyWith(color: Colors.grey))),
          const SizedBox(height: 10),
          FadeInDown(delay: const Duration(milliseconds: 400), child: Container(height: 4, width: 50, color: AppColors.linkColor, margin: const EdgeInsets.only(top: 10))),
          const SizedBox(height: 60),

          // Profile Summary Card
          FadeInUp(
            duration: const Duration(milliseconds: 1000),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: const Color(0xFF1E2029),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.secondary.withOpacity(0.1)),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 15, offset: const Offset(0, 5))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Row(
                     children: [
                       const Icon(Icons.person, color: AppColors.linkColor, size: 24),
                       const SizedBox(width: 15),
                       Text("Profile Summary", style: AppStyles.headline2.copyWith(color: Colors.white, fontSize: 22)),
                     ],
                   ),
                   const SizedBox(height: 20),
                   Text(
                     "A Flutter Mobile Developer with over 4 years of experience in designing and developing systems for Android, iOS, and iPad, in addition to working on web and desktop applications. I have extensive expertise in building and optimizing integrated systems, from creating interactive user interfaces to enhancing performance and ensuring high-quality applications across different platforms and devices.",
                     style: AppStyles.bodyText.copyWith(fontSize: 16, height: 1.6, color: Colors.grey[300]),
                     textAlign: TextAlign.justify,
                   ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 40),

          // What I Do Grid
          Text("What I Do", style: AppStyles.headline2.copyWith(color: Colors.white, fontSize: 24)),
          const SizedBox(height: 30),
          LayoutBuilder(builder: (context, constraints) {
             return Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: [
                   _ServiceCard(icon: Icons.phone_android, title: "Cross-Platform Dev", description: "Developing apps for mobile, web, and desktop using Flutter & Dart."),
                   _ServiceCard(icon: Icons.design_services, title: "UI/UX Design", description: "Creating dynamic, user-friendly interfaces adapting to any screen."),
                   _ServiceCard(icon: Icons.speed, title: "Performance", description: "Optimizing data handling and ensuring smooth user experiences."),
                   _ServiceCard(icon: Icons.api, title: "System Integration", description: "Connecting apps with APIs, Firebase, MySQL, and RESTful services."),
                   _ServiceCard(icon: Icons.layers, title: "State Management", description: "Efficient state management using Riverpod, Bloc, GetX, and Cubit."),
                   _ServiceCard(icon: Icons.store, title: "App Deployment", description: "Publishing on Google Play & App Store and monitoring performance."),
                ],
             );
          }),

           const SizedBox(height: 40),
           
           // Education & Languages Split
           Responsive.isMobile(context) ? 
             Column(children: [
                _InfoBlock(icon: Icons.school, title: "Education", items: const [
                  {"title": "Bachelor’s Degree in CS", "subtitle": "Fayoum University (2017-2021)"}
                ]),
                const SizedBox(height: 20),
                _InfoBlock(icon: Icons.language, title: "Languages", items: const [
                  {"title": "Arabic", "subtitle": "Mother tongue"},
                  {"title": "English", "subtitle": "Very Good"}
                ]),
             ])
           : Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Expanded(child: _InfoBlock(icon: Icons.school, title: "Education", items: const [
                    {"title": "Bachelor’s Degree in CS", "subtitle": "Fayoum University (2017-2021)"}
                 ])),
                 const SizedBox(width: 30),
                 Expanded(child: _InfoBlock(icon: Icons.language, title: "Languages", items: const [
                    {"title": "Arabic", "subtitle": "Mother tongue"},
                    {"title": "English", "subtitle": "Very Good"}
                 ])),
               ],
             ),

          const SizedBox(height: 60),
          
          // Stats
          Wrap(
            spacing: 30,
            runSpacing: 30,
            alignment: WrapAlignment.center,
            children: [
              _StatCircle(count: "04+", label: "Years\nExperience"),
              _StatCircle(count: "20+", label: "Projects\nCompleted"),
              _StatCircle(count: "10+", label: "Happy\nClients"),
            ],
          ),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  const _ServiceCard({required this.icon, required this.title, required this.description});

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: Responsive.isMobile(context) ? double.infinity : 300,
        padding: const EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: const Color(0xFF1E2029),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: _isHovered ? AppColors.linkColor : AppColors.secondary.withOpacity(0.1)),
          boxShadow: [
             BoxShadow(
               color: _isHovered ? AppColors.linkColor.withOpacity(0.1) : Colors.black.withOpacity(0.2),
               blurRadius: 15,
               offset: const Offset(0, 5)
             )
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: AppColors.linkColor.withOpacity(0.1), shape: BoxShape.circle),
              child: Icon(widget.icon, color: AppColors.linkColor, size: 30),
            ),
            const SizedBox(height: 15),
            Text(widget.title, style: AppStyles.headline2.copyWith(color: Colors.white, fontSize: 18), textAlign: TextAlign.center),
            const SizedBox(height: 10),
            Text(widget.description, style: AppStyles.bodyText.copyWith(color: Colors.grey, fontSize: 13, height: 1.5), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
   final IconData icon;
   final String title;
   final List<Map<String, String>> items;
   
   const _InfoBlock({required this.icon, required this.title, required this.items});

   @override
   Widget build(BuildContext context) {
      return Container(
         padding: const EdgeInsets.all(30),
         decoration: BoxDecoration(
            color: const Color(0xFF1E2029),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.secondary.withOpacity(0.1)),
         ),
         child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Row(
                 children: [
                    Icon(icon, color: AppColors.linkColor, size: 24),
                    const SizedBox(width: 10),
                    Text(title, style: AppStyles.headline2.copyWith(color: Colors.white, fontSize: 20)),
                 ],
               ),
               const SizedBox(height: 20),
               ...items.map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                        const Icon(Icons.check_circle_outline, color: AppColors.linkColor, size: 16),
                        const SizedBox(width: 10),
                        Expanded(
                           child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text(item["title"]!, style: AppStyles.bodyText.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                                 if (item["subtitle"] != null)
                                   Text(item["subtitle"]!, style: AppStyles.bodyText.copyWith(color: Colors.grey, fontSize: 13)),
                              ],
                           ),
                        )
                     ],
                  ),
               )).toList()
            ],
         ),
      );
   }
}

class _StatCircle extends StatelessWidget {
   final String count;
   final String label;
   const _StatCircle({required this.count, required this.label});

   @override
   Widget build(BuildContext context) {
      return Container(
         width: 150,
         height: 150,
         decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xFF1E2029),
            border: Border.all(color: AppColors.linkColor.withOpacity(0.3), width: 2),
            boxShadow: [BoxShadow(color: AppColors.linkColor.withOpacity(0.1), blurRadius: 20)],
         ),
         child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(count, style: AppStyles.headline1.copyWith(color: AppColors.linkColor, fontSize: 32)),
               const SizedBox(height: 5),
               Text(label, style: AppStyles.bodyText.copyWith(color: Colors.white, fontSize: 14), textAlign: TextAlign.center),
            ],
         ),
      );
   }
}
