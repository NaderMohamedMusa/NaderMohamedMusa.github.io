import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class AppStyles {
  static TextStyle get headline1 => GoogleFonts.poppins(
        color: AppColors.textPrimary,
        fontSize: 32,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get headline2 => GoogleFonts.poppins(
        color: AppColors.textPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      );

  static TextStyle get bodyText => GoogleFonts.poppins(
        color: AppColors.textSecondary,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        height: 1.5,
      );

  static TextStyle get buttonText => GoogleFonts.poppins(
        color: AppColors.background,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      );
}
