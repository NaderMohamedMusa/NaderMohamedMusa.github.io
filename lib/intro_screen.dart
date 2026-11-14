import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/constants/colors.dart';
import 'package:portfolio/home_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fadeIn;
  late final Animation<double> _scaleIn;
  late final Animation<double> _progress;
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..forward();
    _fadeIn = CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic);
    _scaleIn = Tween<double>(begin: 0.82, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _progress = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _navigationTimer = Timer(const Duration(milliseconds: 2500), _openHome);
  }

  void _openHome() {
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const HomeScreen(),
        transitionsBuilder: (_, animation, __, child) =>
            FadeTransition(opacity: animation, child: child),
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          const Positioned.fill(child: _IntroBackdrop()),
          SafeArea(
            child: Center(
              child: FadeTransition(
                opacity: _fadeIn,
                child: ScaleTransition(
                  scale: _scaleIn,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 104,
                          height: 104,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF182942), Color(0xFF111827)],
                            ),
                            border: Border.all(
                              color: const Color(0xFF54C5F8).withValues(alpha: 0.3),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primary.withValues(alpha: 0.25),
                                blurRadius: 48,
                                spreadRadius: 3,
                              ),
                            ],
                          ),
                          alignment: Alignment.center,
                          child: ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [Color(0xFF54C5F8), Color(0xFF9A67FF)],
                            ).createShader(bounds),
                            child: Text(
                              '</>',
                              style: GoogleFonts.firaCode(
                                fontSize: 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                letterSpacing: -4,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'NADER MUSA',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: AppColors.textPrimary,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 4,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'SENIOR FLUTTER DEVELOPER',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: AppColors.primarySoft,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 2.2,
                          ),
                        ),
                        const SizedBox(height: 18),
                        Text(
                          'Building for every platform',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: AppColors.textSecondary,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 52),
                        SizedBox(
                          width: 184,
                          child: AnimatedBuilder(
                            animation: _progress,
                            builder: (context, child) => LinearProgressIndicator(
                              value: _progress.value,
                              minHeight: 3,
                              backgroundColor: AppColors.border,
                              valueColor: const AlwaysStoppedAnimation(
                                Color(0xFF54C5F8),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 28,
            child: Text(
              'PORTFOLIO  /  2026',
              textAlign: TextAlign.center,
              style: GoogleFonts.firaCode(
                color: AppColors.muted,
                fontSize: 10,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IntroBackdrop extends StatelessWidget {
  const _IntroBackdrop();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF080E1B), Color(0xFF070B16), Color(0xFF0B1020)],
            ),
          ),
        ),
        Positioned(
          top: -130,
          right: -110,
          child: _Glow(color: const Color(0xFF3B82F6).withValues(alpha: 0.12)),
        ),
        Positioned(
          bottom: -180,
          left: -110,
          child: _Glow(color: AppColors.primary.withValues(alpha: 0.13)),
        ),
      ],
    );
  }
}

class _Glow extends StatelessWidget {
  final Color color;

  const _Glow({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 360,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: color, blurRadius: 150, spreadRadius: 55)],
      ),
    );
  }
}
