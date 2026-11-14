import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../utils/responsive.dart';

class SectionShell extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsets? padding;

  const SectionShell({
    super.key,
    required this.child,
    this.color,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final horizontal = Responsive.isMobile(context)
        ? 20.0
        : (width > 1400 ? width * 0.12 : 72.0);

    return Container(
      width: double.infinity,
      color: color ?? AppColors.background,
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: Responsive.isMobile(context) ? 64 : 88,
            horizontal: horizontal,
          ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1180),
          child: child,
        ),
      ),
    );
  }
}

class SectionEyebrow extends StatelessWidget {
  final String text;
  const SectionEyebrow(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(text.toUpperCase(), style: AppStyles.sectionEyebrow);
  }
}
