import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../utils/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeSection extends StatelessWidget {
  const HomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height, // Full screen height
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.isMobile(context) ? 20 : size.width * 0.1,
      ),
      child: Responsive(
        mobile: _mobileLayout(context),
        desktop: _desktopLayout(context),
      ),
    );
  }

  Widget _desktopLayout(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  "Hello, I'm",
                  style: AppStyles.headline2.copyWith(color: AppColors.secondary),
                ),
              ),
              const SizedBox(height: 10),
              FadeInLeft(
                duration: const Duration(milliseconds: 1000),
                child: Text(
                  "Nader Mohamed",
                  style: AppStyles.headline1.copyWith(fontSize: 60),
                ),
              ),
              const SizedBox(height: 10),
              FadeInLeft(
                duration: const Duration(milliseconds: 1200),
                child: SizedBox(
                   height: 40,
                   child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Senior Flutter Developer",
                        textStyle: AppStyles.headline2.copyWith(color: Colors.grey),
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        "Mobile - Web - Desktop - iOS",
                        textStyle: AppStyles.headline2.copyWith(color: Colors.grey),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                    repeatForever: true,
                    pause: const Duration(milliseconds: 2000),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              FadeInUp(
                duration: const Duration(milliseconds: 1400),
                child: Row(
                  children: [
                    _SocialIcon(icon: FontAwesomeIcons.github, url: "https://github.com/NaderMohamedMusa"),
                    const SizedBox(width: 20),
                    _SocialIcon(icon: FontAwesomeIcons.linkedin, url: "https://www.linkedin.com/in/nader-mohamed-musa-560133186/"),
                    const SizedBox(width: 20),
                    _SocialIcon(icon: FontAwesomeIcons.whatsapp, url: "https://wa.me/201026133553"),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              FadeInUp(
                duration: const Duration(milliseconds: 1600),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                         final Uri whatsappUri = Uri.parse("https://wa.me/201026133553");
                         if (!await launchUrl(whatsappUri)) {
                           // handle error
                         }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.secondary,
                        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      ),
                      child: Text("Contact Me", style: AppStyles.buttonText.copyWith(color: Colors.black, fontSize: 16)),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () async {
                         final Uri resumeUri = Uri.parse("https://drive.google.com/file/d/1rgKNaUMRgjmhAdj7_e7un5CHXKFMT-Ys/view");
                         if (!await launchUrl(resumeUri)) {
                           // handle error
                         }
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const FaIcon(FontAwesomeIcons.download, color: Colors.black, size: 20),
                            const SizedBox(width: 8),
                            Text("Download Resume", style: AppStyles.buttonText.copyWith(color: Colors.black, fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: FadeInRight(
            duration: const Duration(milliseconds: 1500),
             // Placeholder for profile image
            child: CircleAvatar(
              radius: 200,
              backgroundColor: AppColors.surface,
              backgroundImage: AssetImage("assets/images/profile.jpg"),
            ),
          ),
        ),
      ],
    );
  }

  Widget _mobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FadeInDown(
          duration: const Duration(milliseconds: 1000),
          child: CircleAvatar(
            radius: 100,
            backgroundColor: AppColors.surface,
            backgroundImage: AssetImage("assets/images/profile.jpg"),
          ),
        ),
        const SizedBox(height: 40),
        FadeInDown(
           duration: const Duration(milliseconds: 1000),
           child: Text(
            "Hello, I'm",
            style: AppStyles.headline2.copyWith(color: AppColors.secondary, fontSize: 18),
          ),
        ),
        const SizedBox(height: 10),
        FadeInLeft(
          duration: const Duration(milliseconds: 1000),
          child: Text(
            "Nader Mohamed",
            style: AppStyles.headline1.copyWith(fontSize: 32),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        FadeInRight(
          duration: const Duration(milliseconds: 1200),
          child: SizedBox(
             height: 30, // Smaller height for mobile
             child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(
                  "Senior Flutter Developer",
                  textStyle: AppStyles.headline2.copyWith(color: Colors.grey, fontSize: 18),
                  speed: const Duration(milliseconds: 100),
                  textAlign: TextAlign.center,
                ),
                TypewriterAnimatedText(
                  "Mobile - Web - Desktop - iOS",
                  textStyle: AppStyles.headline2.copyWith(color: Colors.grey, fontSize: 18),
                  speed: const Duration(milliseconds: 100),
                  textAlign: TextAlign.center,
                ),
              ],
              repeatForever: true,
              pause: const Duration(milliseconds: 2000),
             ),
          ),
        ),
        const SizedBox(height: 30),
        FadeInUp(
          duration: const Duration(milliseconds: 1400),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                   final Uri whatsappUri = Uri.parse("https://wa.me/201026133553");
                   if (!await launchUrl(whatsappUri)) {
                     // handle error
                   }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text("Contact Me", style: AppStyles.buttonText.copyWith(color: Colors.black, fontSize: 16)),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () async {
                   final Uri resumeUri = Uri.parse("https://drive.google.com/file/d/1rgKNaUMRgjmhAdj7_e7un5CHXKFMT-Ys/view");
                   if (!await launchUrl(resumeUri)) {
                     // handle error
                   }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  decoration: BoxDecoration(
                    color: AppColors.secondary,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(FontAwesomeIcons.download, color: Colors.black, size: 20),
                      const SizedBox(width: 8),
                      Text("Download Resume", style: AppStyles.buttonText.copyWith(color: Colors.black, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        FadeInUp(
          duration: const Duration(milliseconds: 1400),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                _SocialIcon(icon: FontAwesomeIcons.github, url: "https://github.com/NaderMohamedMusa"),
                const SizedBox(width: 20),
                _SocialIcon(icon: FontAwesomeIcons.linkedin, url: "https://www.linkedin.com/in/nader-mohamed-musa-560133186/"),
                const SizedBox(width: 20),
                _SocialIcon(icon: FontAwesomeIcons.whatsapp, url: "https://wa.me/201026133553"),
                 // WhatsApp icon removed from here as it is now a main button
            ],
          ),
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: FaIcon(icon, color: AppColors.textSecondary, size: 30),
      onPressed: () async {
        final Uri uri = Uri.parse(url);
        if (!await launchUrl(uri)) {
          // Handle error
        }
      },
      hoverColor: AppColors.secondary.withOpacity(0.1),
    );
  }
}
