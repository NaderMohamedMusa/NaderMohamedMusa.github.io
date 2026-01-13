import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/home_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Fallback color
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Coding Background
          Image.asset(
            'assets/images/coding_background.png',
            fit: BoxFit.cover,
          ),
          
          // Semi-transparent overlay to ensure text readability
          Container(
            color: Colors.black.withOpacity(0.7),
          ),

          // Animated Text
          Center(
            child: DefaultTextStyle(
              style: GoogleFonts.firaCode(
                fontSize: 30.0,
                color: Colors.greenAccent,
                fontWeight: FontWeight.bold,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'void main() {\n  runApp(NaderMusa());\n}',
                    speed: const Duration(milliseconds: 100),
                    cursor: '_',
                  ),
                  TypewriterAnimatedText(
                    'Loading system resources...',
                    speed: const Duration(milliseconds: 80),
                    cursor: '_',
                  ),
                  TypewriterAnimatedText(
                    'Initializing portfolio...',
                    speed: const Duration(milliseconds: 80),
                    cursor: '_',
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 500),
                displayFullTextOnTap: true,
                stopPauseOnTap: true,
                onFinished: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
