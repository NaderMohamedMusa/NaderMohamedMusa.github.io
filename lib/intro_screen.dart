import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/home_screen.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: DefaultTextStyle(
          style: GoogleFonts.firaCode(
            fontSize: 22,
            color: AppColors.primarySoft,
            fontWeight: FontWeight.w600,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'const developer = "Nader Musa";',
                speed: const Duration(milliseconds: 48),
                cursor: '|',
              ),
              TypewriterAnimatedText(
                'Initializing portfolio...',
                speed: const Duration(milliseconds: 40),
                cursor: '|',
              ),
            ],
            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 350),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
            onFinished: () {
              Navigator.of(context).pushReplacement(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const HomeScreen(),
                  transitionsBuilder: (_, animation, __, child) =>
                      FadeTransition(opacity: animation, child: child),
                  transitionDuration: const Duration(milliseconds: 500),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
