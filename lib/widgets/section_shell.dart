import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../utils/responsive.dart';

class SectionShell extends StatelessWidget {
  final Widget child;
  final Color? color;
  final EdgeInsets? padding;
  final double? topPadding;
  final double? bottomPadding;

  const SectionShell({
    super.key,
    required this.child,
    this.color,
    this.padding,
    this.topPadding,
    this.bottomPadding,
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
          EdgeInsets.fromLTRB(
            horizontal,
            topPadding ?? (Responsive.isMobile(context) ? 8 : 12),
            horizontal,
            bottomPadding ?? (Responsive.isMobile(context) ? 8 : 12),
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
