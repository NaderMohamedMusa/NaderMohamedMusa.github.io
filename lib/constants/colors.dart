import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF070B16);
  static const Color backgroundAlt = Color(0xFF0B1220);
  static const Color surface = Color(0xFF111827);
  static const Color surfaceAlt = Color(0xFF161F32);
  static const Color card = Color(0xFF0F172A);
  static const Color border = Color(0xFF1E293B);
  static const Color primary = Color(0xFF7C5CFF);
  static const Color primarySoft = Color(0xFF8B6CFF);
  static const Color accent = Color(0xFF6366F1);
  static const Color secondary = Color(0xFF7C5CFF);
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color muted = Color(0xFF64748B);
  static const Color linkColor = Color(0xFF7C5CFF);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  static const LinearGradient heroGlow = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF7C5CFF), Color(0xFF3B82F6), Color(0xFFA855F7)],
  );
}
