import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppStyles {
  static TextStyle get display => GoogleFonts.plusJakartaSans(
        color: AppColors.textPrimary,
        fontSize: 52,
        fontWeight: FontWeight.w800,
        height: 1.15,
      );

  static TextStyle get headline1 => GoogleFonts.plusJakartaSans(
        color: AppColors.textPrimary,
        fontSize: 36,
        fontWeight: FontWeight.w800,
        height: 1.2,
      );

  static TextStyle get headline2 => GoogleFonts.plusJakartaSans(
        color: AppColors.textPrimary,
        fontSize: 22,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get sectionEyebrow => GoogleFonts.plusJakartaSans(
        color: AppColors.primarySoft,
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 2.2,
      );

  static TextStyle get bodyText => GoogleFonts.inter(
        color: AppColors.textSecondary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.7,
      );

  static TextStyle get buttonText => GoogleFonts.inter(
        color: AppColors.white,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get code => GoogleFonts.firaCode(
        color: const Color(0xFFCBD5E1),
        fontSize: 12,
        height: 1.55,
      );
}
